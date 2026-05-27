-- RESEARCH QUESTION 5: Does GDP growth relate to wage and food price changes in the same year or the following year?

WITH cte_unique_prices AS (
    SELECT DISTINCT food_category, data_year, avg_price
    FROM t_lucie_sulkova_project_sql_primary_final 
), 
cte_price_lag AS ( 
    SELECT food_category, avg_price, data_year, 
           LAG(avg_price) OVER (PARTITION BY food_category ORDER BY data_year) AS prev_year_price
    FROM cte_unique_prices 
), 
cte_price_yoy AS ( 
    SELECT data_year, ROUND((AVG((avg_price - prev_year_price) / prev_year_price) * 100)::numeric, 4) AS price_yoy_pct
    FROM cte_price_lag 
    WHERE prev_year_price IS NOT NULL 
    GROUP BY data_year
), 
cte_wage_yoy AS ( 
    SELECT data_year, 
           ROUND((((AVG(avg_wage) - LAG(AVG(avg_wage)) OVER (ORDER BY data_year)) / LAG(AVG(avg_wage)) OVER (ORDER BY data_year)) * 100)::numeric, 4) AS wage_yoy_pct
    FROM t_lucie_sulkova_project_sql_primary_final
    GROUP BY data_year
), 
cte_gdp_yoy AS ( 
    SELECT "year" AS data_year, 
           ROUND((((gdp - LAG(gdp) OVER (ORDER BY "year")) / LAG(gdp) OVER (ORDER BY "year")) * 100)::numeric, 2) AS gdp_yoy_pct
    FROM economies
    WHERE country = 'Czech Republic' AND gdp IS NOT NULL
)
SELECT 
    g.data_year, 
    g.gdp_yoy_pct, 
    w.wage_yoy_pct, 
    p.price_yoy_pct
FROM cte_gdp_yoy g
JOIN cte_wage_yoy w ON g.data_year = w.data_year
JOIN cte_price_yoy p ON g.data_year = p.data_year
WHERE g.gdp_yoy_pct IS NOT NULL AND w.wage_yoy_pct IS NOT NULL
ORDER BY g.data_year;
