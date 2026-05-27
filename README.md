# Czech Republic Economic & Food Affordability Analysis

## Project Introduction
This project was conducted for the analytical department of an independent research organization. The primary objective is to analyze the accessibility of basic food items for the general public in the Czech Republic by comparing them with wage developments and broader macroeconomic indicators. 

The findings serve as a data foundation for the press department to be presented at an upcoming conference focused on living standards.

## Data Overview
The analysis utilizes several datasets from the Czech Open Data Portal and global economic indicators:

### Primary Datasets (Czech Republic Focus):
- **Payroll data:** `czechia_payroll`, `czechia_payroll_calculation`, `czechia_payroll_industry_branch`, `czechia_payroll_unit`, `czechia_payroll_value_type`
- **Price data:** `czechia_price`, `czechia_price_category`
- **Regional data:** `czechia_region`, `czechia_district`

### Secondary Datasets (European Comparison):
- `countries`: Geographical and demographic information.
- `economies`: GDP, GINI coefficient, and tax burden data.

## Project Deliverables
To answer the research questions, two final unified tables were created:
1. **`t_lucie_sulkova_project_sql_primary_final`**: A unified dataset containing payroll and food price data for the Czech Republic, synchronized for comparable periods.
2. **`t_lucie_sulkova_project_sql_secondary_final`**: A dataset containing GDP, GINI, and population data for additional European countries.

*Note: No changes were made to the original source tables. All transformations were performed using new SQL views/tables.*

### Research Question 1: Do wages increase in all industries over the years, or do they drop in some?

**Analysis:**
Contrary to the assumption of a constant upward trend, the data reveals that wage stagnation or decline occurs periodically across various sectors. While the general long-term trend is positive, specific industries experience year-on-year decreases.

**Key Findings:**
* **Sector Vulnerability:** Wage decreases were observed across a wide spectrum of industries, ranging from "Mining and Quarrying" to "Education" and "Accommodation and Food Service Activities". 
* **Notable Years:** A significant concentration of wage decreases occurred in **2013**, affecting sectors like "Construction", "Finance and Insurance", and "Information and Communication". This suggests a broader economic impact during that period.
* **Industry Examples:** For instance, "Mining and Quarrying" showed a recurring pattern of decline (observed in 2009, 2013, 2014, and 2016), indicating high volatility in this specific sector. 

**Conclusion:** Wages do not increase continuously in all industries. Economic fluctuations cause temporary drops in individual branches, confirming that wage growth is not uniform across the Czech economy.

### Research Question 2: How many liters of milk and kilograms of bread can be bought in the first and last comparable periods?

**Analysis:**
To evaluate the development of purchasing power, we compared the affordability of two staple food items—bread ("Chléb konzumní kmínový") and milk ("Mléko polotučné pasterované")—between the first available year (2006) and the last available year (2018).

**Key Findings:**
* **Bread Affordability:** The amount of bread one could purchase with an average wage increased from **1,287 kg in 2006** to **1,342 kg in 2018**.
* **Milk Affordability:** The increase was even more pronounced for milk, where the purchasing power rose from **1,437 liters in 2006** to **1,642 liters in 2018**.

**Conclusion:**
Despite the fluctuations in food prices and wages over the observed 12-year period, the data indicates a positive trend in purchasing power. The average wage in the Czech Republic grew faster than the prices of these staple food items, allowing citizens to afford a larger quantity of bread and milk in 2018 compared to 2006.

### Research Question 3: Which food category is increasing in price the slowest?

**Analysis:**
We analyzed the average year-over-year (YoY) percentage change in prices for all available food categories. The goal was to identify items that demonstrate the lowest price volatility or long-term price stability.

**Key Findings:**
* **Slowest Growth/Deflation:** The categories with the slowest price growth (or even an average decline) are "Cukr krystalový" (-1.92%) and "Rajská jablka červená kulatá" (-0.74%).
* **Moderate Growth:** Staple items like "Chléb konzumní kmínový" (3.97%) and "Mléko polotučné pasterované" (2.98%) showed steady, moderate growth.
* **Highest Volatility:** Categories with the highest average annual increase include "Papriky" (7.29%) and "Máslo" (6.67%).

**Conclusion:**
The price growth across categories is not uniform. While most food items show a positive annual price increase, some categories, such as sugar and tomatoes, have remained stable or even decreased in price on average over the observed period.

### Research Question 4: Is there a year in which the year-on-year increase in food prices was significantly higher than wage growth (greater than 10%)?

**Analysis:**
We compared the year-on-year (YoY) growth of average wages with the average YoY increase in food prices to identify periods where food became significantly less affordable. We specifically monitored the difference to see if it ever exceeded the 10% threshold.

**Key Findings:**
* **Growth Discrepancies:** While there are years where food prices grew faster than wages (e.g., 2012 or 2013), the difference never reached the 10% mark.
* **Economic Resilience:** The highest difference was observed in **2013**, where food prices rose by approximately 6.01% while wages declined by 1.56% (a difference of 7.57 percentage points).
* **Wage Dominance:** Conversely, in years like 2009 or 2018, wage growth (or stability) combined with price deflation/slower growth significantly improved consumer purchasing power.

**Conclusion:**
Based on the analyzed data, there is no year in the observed period (2007–2018) where the year-on-year increase in food prices exceeded wage growth by more than 10%. The Czech economy maintained a balance where food price inflation generally did not outpace wage growth to a critical extent.

### Research Question 5: Does GDP growth relate to wage and food price changes in the same year or the following year?

**Analysis:**
We examined the relationship between GDP growth, wage development, and food price changes. We looked for correlations between these macroeconomic indicators to determine if GDP growth acts as a leading or coincident indicator for living standards.

**Key Findings:**
* **Non-Linear Relationship:** The data shows that GDP growth does not have a direct, simple linear relationship with wage and price changes in the same year. For example, in 2009, GDP fell sharply (-4.66%), but food prices still showed a growth of 3.16%, while wages declined (-6.58%).
* **Delayed Reactions:** There is evidence of potential "lagged" effects. In years following strong GDP growth (e.g., 2015 with 5.39% growth), we observed varying trends in the subsequent year (2016), suggesting that the transmission of macroeconomic growth into household income is complex and influenced by other factors.
* **Sensitivity:** Wages appear more sensitive to GDP fluctuations than food prices, which are often influenced by global market factors, harvest seasons, and regulatory changes rather than purely domestic economic output.

**Conclusion:**
There is no strong evidence of a simple, immediate correlation between GDP growth and the cost of basic food items or wage levels in the same year. The economic environment in the Czech Republic during the observed period indicates that while GDP is a key indicator of national prosperity, its impact on the daily purchasing power of citizens is mediated by many other structural and global economic variables.

