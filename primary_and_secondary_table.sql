-- PRIMARY TABLE 

CREATE TABLE t_lucie_sulkova_project_sql_primary_final AS ( 
WITH cte_base_payroll AS (
	SELECT 
		COALESCE(cpib."name", 'All industries') AS industry_branch, 
		cp.payroll_year AS data_year, 
		AVG(value) AS avg_wage 
	FROM czechia_payroll AS cp 
	JOIN czechia_payroll_calculation AS cpc ON cp.calculation_code = cpc.code 
	LEFT JOIN czechia_payroll_industry_branch AS cpib ON cp.industry_branch_code = cpib.code
	JOIN czechia_payroll_unit AS cpu ON cp.unit_code = cpu.code 
	JOIN czechia_payroll_value_type AS cpvt ON cp.value_type_code = cpvt.code
	WHERE cpvt.code = 5958 AND cp.unit_code = 200
	GROUP BY cpib."name", data_year 
	ORDER BY industry_branch, data_year  
), cte_payroll_prev_year AS ( 
	SELECT 
		*,
		LAG(avg_wage) OVER (PARTITION BY industry_branch ORDER BY data_year) AS prev_year_avg_wage
	FROM cte_base_payroll 
), cte_wage_trend AS ( 
	SELECT 
		*,
		CASE 
			WHEN avg_wage > prev_year_avg_wage THEN 'increasing'
			WHEN prev_year_avg_wage IS NULL THEN '-'
			ELSE 'decreasing'
		END AS wage_trend_status
	FROM cte_payroll_prev_year 
), cte_base_prices AS ( 
	SELECT 
		cpc."name" AS food_category, 
		AVG(value) AS avg_price, 
		DATE_PART('year', cp.date_from) AS data_year
	FROM czechia_price AS cp 
	JOIN czechia_price_category AS cpc ON cp.category_code = cpc.code 
	GROUP BY data_year, cpc."name" 
), cte_prices_prev_year AS ( 
	SELECT 
		*,
		LAG(avg_price) OVER (PARTITION BY food_category ORDER BY data_year) AS prev_year_avg_price
	FROM cte_base_prices
), cte_price_trend AS ( 
	SELECT 
		*,
		CASE 
			WHEN avg_price > prev_year_avg_price THEN 'increasing'
			WHEN prev_year_avg_price IS NULL THEN '-'
			ELSE 'decreasing'
		END AS price_trend_status
	FROM cte_prices_prev_year
)
SELECT 
	m.data_year, 
	m.industry_branch, 
	m.avg_wage, 
	m.wage_trend_status AS wage_trend, 
	p.food_category, 
	p.avg_price, 
	p.price_trend_status AS price_trend
FROM cte_wage_trend AS m
JOIN cte_price_trend AS p ON m.data_year = p.data_year
WHERE m.industry_branch != 'All industries'
ORDER BY m.industry_branch, m.data_year 
);



-- SECONDARY TABLE 

CREATE TABLE t_lucie_sulkova_project_sql_secondary_final AS ( 
    SELECT 
        c.country, 
        e."year", 
        e.gdp, 
        c.continent, 
        c.population  
    FROM countries AS c 
    JOIN economies AS e ON c.country = e.country 
    WHERE c.region_in_world LIKE '%Europe%'
    ORDER BY c.country, e."year" 
);
