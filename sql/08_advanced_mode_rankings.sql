
-- 08_advanced_mode_rankings.sql
-- Business question: Which modes lead within each trade type?
-- Techniques: CTE, aggregation, JOIN, RANK().

USE freight_analytics;

WITH mode_summary AS (
    SELECT
        f.trade_type,
        t.trade_type_name,
        f.dms_mode,
        m.mode_name,
        SUM(f.tons_2024) AS total_thousand_tons
    FROM freight_flows f
    JOIN trade_type_lookup t
        ON f.trade_type = t.trade_type_code
    LEFT JOIN transport_mode_lookup m
        ON f.dms_mode = m.mode_code
    GROUP BY
        f.trade_type,
        t.trade_type_name,
        f.dms_mode,
        m.mode_name
),
ranked_modes AS (
    SELECT
        trade_type,
        trade_type_name,
        mode_name,
        total_thousand_tons,
        RANK() OVER (
            PARTITION BY trade_type
            ORDER BY total_thousand_tons DESC
        ) AS mode_rank
    FROM mode_summary
)
SELECT
    trade_type_name,
    mode_name,
    ROUND(total_thousand_tons, 2) AS thousand_tons,
    mode_rank
FROM ranked_modes
WHERE mode_rank <= 3
ORDER BY trade_type_name, mode_rank;
