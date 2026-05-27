-- RESEARCH QUESTION 3: Which food category is increasing in price the slowest?

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
cte_yoy_change AS ( 
    SELECT 
        food_category,
        ROUND((((avg_price - prev_year_price) / prev_year_price) * 100)::numeric, 2) AS yoy_change_pct
    FROM cte_price_lag 
    WHERE prev_year_price IS NOT NULL 
)
SELECT 
    food_category, 
    ROUND(AVG(yoy_change_pct), 2) AS avg_yoy_change_pct
FROM cte_yoy_change 
GROUP BY food_category 
ORDER BY avg_yoy_change_pct
;

