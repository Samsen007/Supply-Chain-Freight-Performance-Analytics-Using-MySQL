
-- 06_trade_type_analysis.sql
-- Business question: How do domestic, import and export flows differ?

USE freight_analytics;

SELECT
    t.trade_type_name,
    COUNT(*) AS freight_records,
    ROUND(SUM(f.tons_2024), 2) AS total_thousand_tons,
    ROUND(SUM(f.value_2024), 2) AS total_million_dollars,
    ROUND(SUM(f.tmiles_2024), 2) AS total_million_ton_miles,
    ROUND(
        100.0 * SUM(f.tons_2024) /
        NULLIF(
            (SELECT SUM(tons_2024) FROM freight_flows), 0
        ), 2
    ) AS weight_share_pct,
    ROUND(
        100.0 * SUM(f.value_2024) /
        NULLIF(
            (SELECT SUM(value_2024) FROM freight_flows), 0
        ), 2
    ) AS value_share_pct
FROM freight_flows f
JOIN trade_type_lookup t
    ON f.trade_type = t.trade_type_code
GROUP BY t.trade_type_name
ORDER BY total_million_dollars DESC;
