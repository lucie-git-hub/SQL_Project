-- RESEARCH QUESTION 2: How many liters of milk and kilograms of bread can be bought in the first and last comparable periods?

WITH cte_yearly_avg_wage AS ( 
    SELECT 
        AVG(avg_wage) AS avg_wage_cz, 
        data_year 
    FROM t_lucie_sulkova_project_sql_primary_final
    GROUP BY data_year
), 
cte_first_last_wage AS ( 
    SELECT *
    FROM cte_yearly_avg_wage
    WHERE data_year IN (2006, 2018)
), 
cte_first_last_price AS ( 
    SELECT DISTINCT 
        food_category, 
        data_year, 
        avg_price 
    FROM t_lucie_sulkova_project_sql_primary_final
    WHERE food_category IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový') -- Milk and Bread
      AND data_year IN (2006, 2018)
) 
SELECT 
    cp.food_category, 
    cp.data_year,
    ROUND((cw.avg_wage_cz / cp.avg_price)::numeric) AS affordable_amount
FROM cte_first_last_price AS cp 
JOIN cte_first_last_wage AS cw 
    ON cp.data_year = cw.data_year
ORDER BY cp.food_category, cp.data_year;


