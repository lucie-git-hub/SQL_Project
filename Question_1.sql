-- RESEARCH QUESTION 1: Do wages increase in all industries over the years, or do they drop in some?

SELECT DISTINCT 
    data_year, 
    industry_branch, 
    wage_trend
FROM t_lucie_sulkova_project_sql_primary_final
WHERE wage_trend = 'decreasing'
ORDER BY industry_branch;
