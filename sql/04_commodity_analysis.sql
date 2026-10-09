
-- 04_commodity_analysis.sql
-- Business questions:
-- 1. Which commodities have the greatest freight weight?
-- 2. Which commodities have the highest estimated value per ton?

USE freight_analytics;

-- Top 10 commodity groups by freight weight in 2024.
SELECT
    sctg2 AS commodity_code,
    COUNT(*) AS freight_records,
    ROUND(SUM(tons_2024), 2) AS total_thousand_tons,
    ROUND(SUM(value_2024), 2) AS total_million_dollars,
    ROUND(SUM(tmiles_2024), 2) AS total_million_ton_miles
FROM freight_flows
GROUP BY sctg2
ORDER BY total_thousand_tons DESC
LIMIT 10;

-- Top 10 commodity groups by estimated goods value per ton.
-- Exclude categories with less than 1,000 thousand tons.
SELECT
    sctg2 AS commodity_code,
    COUNT(*) AS freight_records,
    ROUND(SUM(tons_2024), 2) AS total_thousand_tons,
    ROUND(SUM(value_2024), 2) AS total_million_dollars,
    ROUND(
        SUM(value_2024) / NULLIF(SUM(tons_2024), 0), 3
    ) AS thousand_dollars_per_ton
FROM freight_flows
GROUP BY sctg2
HAVING SUM(tons_2024) > 1000
ORDER BY thousand_dollars_per_ton DESC
LIMIT 10;
