
-- 03_transportation_analysis.sql
-- Business question: Which modes dominate freight activity?

USE freight_analytics;

SELECT
    m.mode_name,
    COUNT(*) AS freight_records,
    ROUND(SUM(f.tons_2024), 2) AS total_thousand_tons,
    ROUND(SUM(f.value_2024), 2) AS total_million_dollars,
    ROUND(SUM(f.tmiles_2024), 2) AS total_million_ton_miles,
    ROUND(
        100.0 * SUM(f.tons_2024) /
        NULLIF(
            (SELECT SUM(tons_2024) FROM freight_flows), 0
        ), 2
    ) AS share_of_freight_weight_pct
FROM freight_flows f
LEFT JOIN transport_mode_lookup m
    ON f.dms_mode = m.mode_code
GROUP BY m.mode_name
ORDER BY total_thousand_tons DESC;
