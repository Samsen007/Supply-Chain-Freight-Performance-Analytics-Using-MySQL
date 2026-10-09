# Dataset and Methodology

## Dataset Source

- **Dataset:** Freight Analysis Framework (FAF 5.7.1)
- **Publisher:** U.S. Department of Transportation
- **Official source:** https://faf.ornl.gov/faf5/
- **Format:** CSV with accompanying metadata
- **Database:** MySQL 8.0

## Project Scope

This project examines freight flows across the United States using the FAF 5.7.1 dataset. The analysis focuses on freight weight, estimated goods value, ton-miles, transportation modes, commodity groups, trade types, annual trends, and domestic freight corridors.

## Data Preparation

1. Inspected the source CSV and metadata workbook.
2. Created the `freight_analytics` MySQL database.
3. Created lookup tables for trade types and domestic transportation modes.
4. Imported the main CSV into the `freight_flows` table.
5. Checked the record count and completeness of selected analysis fields.
6. Used SQL aggregation and window functions to investigate freight patterns.

## Key Fields

| Field | Description |
|---|---|
| `dms_orig` | Domestic origin region code |
| `dms_dest` | Domestic destination region code |
| `sctg2` | Commodity classification code |
| `trade_type` | Domestic, import, or export category |
| `dms_mode` | Domestic transportation mode code |
| `tons_2024` | 2024 freight weight measure |
| `value_2024` | 2024 freight value measure |
| `tmiles_2024` | 2024 ton-mile measure |

## SQL Techniques

- Aggregation using `SUM()`, `COUNT()` and `GROUP BY`
- Multi-table joins
- Common Table Expressions (CTEs)
- Window functions including `LAG()` and `RANK()`
- Year-over-year percentage change
- Conditional filtering and sorting

## Important Limitations

FAF provides estimated freight flows, not individual shipment-level tracking records. Freight weight, goods value and ton-miles measure different things. Forecast values must be distinguished from historical estimates, and aggregate totals must be interpreted according to the official FAF methodology and units.

The original source data is not included in this repository. Users should obtain it from the official source above.
