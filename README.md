# Czech Republic Economic & Food Affordability Analysis

## Project Introduction
This project was part of an analytical task focused on public living standards in the Czech Republic. The goal was to look into how accessible basic food items have been for the average person over the years, specifically in relation to wage growth and broader economic trends like GDP. The final outputs were designed as a data foundation for further reporting on living standards.

## Data Overview
I worked with public datasets from the Czech Open Data Portal, combined with global economic statistics:

### Primary Datasets (Czech Republic):
- **Payroll:** `czechia_payroll`, `czechia_payroll_calculation`, `czechia_payroll_industry_branch`, `czechia_payroll_unit`, `czechia_payroll_value_type`
- **Prices:** `czechia_price`, `czechia_price_category`
- **Regional:** `czechia_region`, `czechia_district`

### Secondary Datasets (European context):
- `countries`: General information about states.
- `economies`: GDP, GINI coefficient, and tax data.

## Project Deliverables
I created two final tables to serve as the core of the analysis:
1. **`t_lucie_sulkova_project_sql_primary_final`**: A unified table for the Czech Republic, merging payroll and price data into a comparable timeline.
2. **`t_lucie_sulkova_project_sql_secondary_final`**: A table with GDP and population metrics for European countries to allow for a broader context.

*Note: I did not modify the original source tables. All logic is contained within the new SQL tables.*

---

### Research Question 1: Do wages increase in all industries, or do they drop in some?

**The Reality:** It’s a common belief that wages always grow, but the data shows otherwise. While the long-term trend is upward, several sectors hit periods of stagnation or even decline.

**Key Findings:**
* **Sector-wide drops:** I found wage decreases in diverse fields, from "Mining" to "Education" or "Hospitality."
* **The 2013 impact:** This year stands out as a "bad year" for several industries, including Construction and Finance, likely reflecting the economic climate of the time.
* **Volatility:** Some sectors are more sensitive than others—for example, "Mining and Quarrying" shows recurring drops throughout the period.

**Conclusion:** Wage growth isn't a given in every sector. Different industries respond to economic cycles differently, and periodic drops are a normal part of the data.


### Research Question 2: How many liters of milk and kilograms of bread can be bought in the first and last comparable periods?

**Analysis:**
I wanted to see how the average wage actually translates into purchasing power. I compared the years 2006 and 2018 using two common staple items.

**Key Findings:**
* **Bread:** In 2006, the average wage bought 1,287 kg; by 2018, it was 1,342 kg.
* **Milk:** The jump was even clearer, rising from 1,437 to 1,642 liters.

**Conclusion:** Despite price fluctuations, the average citizen could afford more of these staples in 2018 than in 2006. Wages grew faster than the prices of these specific items.


### Research Question 3: Which food category is increasing in price the slowest?

**Analysis:**
I calculated the average year-on-year (YoY) percentage change for every food category in the dataset.

**Key Findings:**
* **The "Slow" items:** Sugar (-1.92%) and tomatoes (-0.74%) were the most stable items, showing no growth or even slight deflation on average.
* **The "Fast" items:** Paprika (7.29%) and butter (6.67%) were the most volatile in terms of price growth.

**Conclusion:** Inflation in the food sector is definitely not equal. While staples like bread and milk grew at a moderate pace, other items remained surprisingly stable.


### Research Question 4: Is there a year where food price growth significantly outpaced wage growth (over 10%)?

**Analysis:**
I compared the YoY growth rates of wages and food prices. I was looking for a "gap" where prices rose by at least 10 percentage points more than wages.

**Key Findings:**
* **No critical gap:** The data shows that while prices sometimes rose faster than wages (e.g., 2013), the difference never hit the 10% threshold.
* **Economic resilience:** Years like 2009 and 2018 actually saw wage growth (or stability) outperforming price growth, which helped maintain purchasing power.

**Conclusion:** Even though prices sometimes climbed faster than paychecks, I didn't find a single year where this gap would be classified as a critical 10% crisis.



### Research Question 5: Does GDP growth relate to wage and food price changes?

**Analysis:**
This was the most complex part: looking for a link between GDP, wages, and prices.

**Key Findings:**
* **No simple link:** The numbers don't show a direct line between GDP growth and household income. In 2009, GDP dropped, but food prices were still fluctuating.
* **Delayed effects:** There is no "instant" reaction. Changes in GDP don't automatically mean immediate wage hikes or price shifts the next year.
* **Complex factors:** Wages seem more tied to GDP than food prices are, but both are heavily influenced by global factors outside of just the domestic GDP.

**Conclusion:** GDP is a good indicator of national health, but it’s too broad to explain short-term changes in people's wallets. Household purchasing power is clearly shaped by much more than just the annual GDP growth rate.


---

## How to Use This Repository
This repository contains the SQL logic used for the economic analysis. You can replicate the results by following these steps:

1. **Database Setup:** Ensure you have access to a PostgreSQL database where the source tables (`czechia_payroll`, `czechia_price`, `countries`, `economies`, etc.) are available.
2. **Data Preparation:** First, run the script for the primary and secondary tables (`t_lucie_sulkova_project_sql_primary_final` and `t_lucie_sulkova_project_sql_secondary_final`). This creates the unified datasets used for all further analysis.
3. **Running Queries:** Once the primary and secondary tables are generated, you can execute the individual SQL scripts for each research question (found in the `/main` folder).
4. **Customization:** If you want to use this for a different period or region, simply adjust the `WHERE` clauses in the respective scripts.
