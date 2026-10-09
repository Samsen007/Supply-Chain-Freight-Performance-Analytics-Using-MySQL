
-- 05_yearly_trends.sql
-- Business question: How did freight weight and value change by year?
-- Technique: Aggregation, CTE, LAG() window function.

USE freight_analytics;

CREATE TABLE IF NOT EXISTS yearly_freight_summary (
    year SMALLINT PRIMARY KEY,
    total_thousand_tons DOUBLE,
    total_million_2017_dollars DOUBLE
);

-- Populate one year at a time to reduce long-running queries.
-- If a year already exists, use REPLACE INTO for that year
-- rather than INSERT INTO.

-- 2017
REPLACE INTO yearly_freight_summary
SELECT 2017, SUM(tons_2017), SUM(value_2017)
FROM freight_flows;

-- 2018
REPLACE INTO yearly_freight_summary
SELECT 2018, SUM(tons_2018), SUM(value_2018)
FROM freight_flows;

-- 2019
REPLACE INTO yearly_freight_summary
SELECT 2019, SUM(tons_2019), SUM(value_2019)
FROM freight_flows;

-- 2020
REPLACE INTO yearly_freight_summary
SELECT 2020, SUM(tons_2020), SUM(value_2020)
FROM freight_flows;

-- 2021
REPLACE INTO yearly_freight_summary
SELECT 2021, SUM(tons_2021), SUM(value_2021)
FROM freight_flows;

-- 2022
REPLACE INTO yearly_freight_summary
SELECT 2022, SUM(tons_2022), SUM(value_2022)
FROM freight_flows;

-- 2023
REPLACE INTO yearly_freight_summary
SELECT 2023, SUM(tons_2023), SUM(value_2023)
FROM freight_flows;

-- 2024
REPLACE INTO yearly_freight_summary
SELECT 2024, SUM(tons_2024), SUM(value_2024)
FROM freight_flows;

-- Compare each year with the previous year.
WITH yearly_comparison AS (
    SELECT
        year,
        total_thousand_tons,
        total_million_2017_dollars,
        LAG(total_thousand_tons)
            OVER (ORDER BY year) AS previous_year_tons,
        LAG(total_million_2017_dollars)
            OVER (ORDER BY year) AS previous_year_value
    FROM yearly_freight_summary
)
SELECT
    year,
    ROUND(total_thousand_tons, 2) AS thousand_tons,
    ROUND(total_million_2017_dollars, 2)
        AS million_2017_dollars,
    ROUND(
        100.0 * (total_thousand_tons - previous_year_tons)
        / NULLIF(previous_year_tons, 0), 2
    ) AS tonnage_growth_pct,
    ROUND(
        100.0 * (
            total_million_2017_dollars - previous_year_value
        ) / NULLIF(previous_year_value, 0), 2
    ) AS value_growth_pct
FROM yearly_comparison
ORDER BY year;
