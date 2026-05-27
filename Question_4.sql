-- RESEARCH QUESTION 4: Is there a year in which the year-on-year increase in food prices was significantly higher than wage growth (greater than 10%)?

WITH cte_unique_prices AS (
    SELECT DISTINCT 
        food_category, 
        data_year, 
        avg_price
    FROM t_lucie_sulkova_project_sql_primary_final 
), 
cte_price_lag AS ( 
    SELECT
        food_category, 
        avg_price, 
        data_year, 
        LAG(avg_price) OVER (PARTITION BY food_category ORDER BY data_year) AS prev_year_price
    FROM cte_unique_prices 
), 
cte_price_yoy AS ( 
    SELECT 
        data_year,
        ROUND((((avg_price - prev_year_price) / prev_year_price) * 100)::numeric, 4) AS price_yoy_pct
    FROM cte_price_lag 
    WHERE prev_year_price IS NOT NULL 
), 
cte_avg_price_yoy AS ( 
    SELECT 
        ROUND(AVG(price_yoy_pct)::numeric, 4) AS avg_price_yoy_pct, 
        data_year
    FROM cte_price_yoy 
    GROUP BY data_year
), 
cte_yearly_avg_wage AS ( 
    SELECT 
        AVG(avg_wage) AS avg_wage_cz, 
        data_year
    FROM t_lucie_sulkova_project_sql_primary_final
    GROUP BY data_year
), 
cte_wage_lag AS ( 
    SELECT 
        data_year, 
        avg_wage_cz,
        LAG(avg_wage_cz) OVER (ORDER BY data_year) AS prev_year_wage
    FROM cte_yearly_avg_wage 
), 
cte_wage_yoy AS ( 
    SELECT 
        data_year,
        ROUND((((avg_wage_cz - prev_year_wage) / prev_year_wage) * 100)::numeric, 4) AS wage_yoy_pct
    FROM cte_wage_lag 
    WHERE prev_year_wage IS NOT NULL
)
SELECT 
    cp.data_year, 
    cw.wage_yoy_pct, 
    cp.avg_price_yoy_pct,
    (cp.avg_price_yoy_pct - cw.wage_yoy_pct) AS yoy_difference_pct
FROM cte_avg_price_yoy AS cp
JOIN cte_wage_yoy AS cw ON cp.data_year = cw.data_year 
-- WHERE (cp.avg_price_yoy_pct - cw.wage_yoy_pct) > 10
ORDER BY cp.data_year;


