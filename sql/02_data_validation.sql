
-- 02_data_validation.sql
-- Purpose: Validate row count, completeness and trade categories.

USE freight_analytics;

-- Check total records.
SELECT COUNT(*) AS total_records
FROM freight_flows;

-- Check completeness of core analysis fields.
SELECT
    COUNT(*) AS total_rows,
    SUM(dms_orig IS NULL) AS missing_origin,
    SUM(dms_dest IS NULL) AS missing_destination,
    SUM(sctg2 IS NULL) AS missing_commodity,
    SUM(trade_type IS NULL) AS missing_trade_type,
    SUM(dms_mode IS NULL) AS missing_mode
FROM freight_flows;

-- Inspect trade-type distribution.
SELECT
    t.trade_type_name,
    COUNT(*) AS freight_records,
    ROUND(
        100.0 * COUNT(*) /
        (SELECT COUNT(*) FROM freight_flows), 2
    ) AS record_share_pct
FROM freight_flows f
LEFT JOIN trade_type_lookup t
    ON f.trade_type = t.trade_type_code
GROUP BY t.trade_type_name
ORDER BY freight_records DESC;

-- Inspect representative records.
SELECT
    fr_orig, dms_orig, dms_dest, fr_dest,
    fr_inmode, dms_mode, fr_outmode,
    sctg2, trade_type, dist_band,
    tons_2017, tons_2024, value_2024, tmiles_2024
FROM freight_flows
LIMIT 10;
