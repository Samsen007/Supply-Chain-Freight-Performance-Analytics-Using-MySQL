
-- 07_freight_corridors.sql
-- Business questions:
-- 1. Which interregional domestic routes carry the most freight weight?
-- 2. Which routes account for the most ton-miles?

USE freight_analytics;

-- Top 10 interregional routes by freight weight.
SELECT
    dms_orig AS origin_region_code,
    dms_dest AS destination_region_code,
    COUNT(*) AS freight_records,
    ROUND(SUM(tons_2024), 2) AS total_thousand_tons,
    ROUND(SUM(value_2024), 2) AS total_million_dollars,
    ROUND(SUM(tmiles_2024), 2) AS total_million_ton_miles
FROM freight_flows
WHERE trade_type = 1
  AND dms_orig <> dms_dest
GROUP BY dms_orig, dms_dest
ORDER BY total_thousand_tons DESC
LIMIT 10;

-- Top 10 interregional routes by ton-miles.
SELECT
    dms_orig AS origin_region_code,
    dms_dest AS destination_region_code,
    ROUND(SUM(tons_2024), 2) AS total_thousand_tons,
    ROUND(SUM(tmiles_2024), 2) AS total_million_ton_miles,
    ROUND(SUM(value_2024), 2) AS total_million_dollars
FROM freight_flows
WHERE trade_type = 1
  AND dms_orig <> dms_dest
GROUP BY dms_orig, dms_dest
ORDER BY total_million_ton_miles DESC
LIMIT 10;
