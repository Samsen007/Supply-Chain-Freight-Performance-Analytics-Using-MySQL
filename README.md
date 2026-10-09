# Supply Chain & Freight Performance Analytics Using MySQL

## Project Overview

This project analyzes freight transportation patterns across the United States using the **Freight Analysis Framework (FAF 5.7.1)** published by the U.S. Department of Transportation.

Using MySQL and advanced SQL techniques, the project investigates freight transportation modes, commodity movements, domestic and international trade flows, historical trends, and regional freight corridors to derive insights relevant to supply chain and logistics planning.

## Business Objectives

- Identify transportation modes that carry the greatest freight weight and economic value.
- Determine which commodity groups dominate freight movement.
- Analyze year-over-year changes in freight weight and inflation-adjusted value.
- Compare domestic, import, and export freight flows.
- Identify high-volume and high-ton-mile domestic freight corridors.
- Compare transportation mode rankings across trade types.

## Dataset

**Source:** U.S. Department of Transportation — Freight Analysis Framework (FAF) Version 5.7.1.

The dataset provides estimated freight flows by origin, destination, commodity, transportation mode, trade type, and distance band, alongside historical and forecast measures.

- Dataset version: FAF 5.7.1
- Historical analysis period: 2017–2024
- Imported records: 2,671,386
- Data format: CSV
- Database: MySQL 8.0

The original dataset is large. It is not included in this repository. Obtain the dataset and associated metadata from the official [Freight Analysis Framework website](https://faf.ornl.gov/faf5/).

## Tools and Technologies

- **MySQL 8.0** — data storage, aggregation, and analysis
- **SQL** — data validation and business analysis
- **Common Table Expressions (CTEs)** — organizing analytical queries
- **Window functions** — year-over-year comparisons using `LAG()` and mode rankings using `RANK()`
- **JOINs and aggregations** — combining reference tables and calculating freight metrics

## Repository Structure

```text
FAF-Freight-Analytics-MySQL/
├── sql/
│   ├── 01_database_setup.sql
│   ├── 02_data_validation.sql
│   ├── 03_transportation_analysis.sql
│   ├── 04_commodity_analysis.sql
│   ├── 05_yearly_trends.sql
│   ├── 06_trade_type_analysis.sql
│   ├── 07_freight_corridors.sql
│   └── 08_advanced_mode_rankings.sql
├── docs/
│   ├── dataset_and_methodology.md
│   ├── data_validation.md
│   └── business_insights.md
├── screenshots/
└── README.md
```

## Business Questions and Analysis

### 1. Transportation Mode Analysis
Evaluates freight weight, estimated goods value, and ton-miles across truck, pipeline, rail, water, air, and other modes.

### 2. Commodity Analysis
Identifies the commodity groups with the greatest freight weight and estimates goods value per ton.

### 3. Historical Freight Trends
Examines yearly changes in freight weight and inflation-adjusted goods value from 2017 through 2024.

### 4. Domestic vs. Import vs. Export
Compares freight weight, value, and ton-miles across the three trade types.

### 5. Freight Corridor Analysis
Ranks interregional domestic freight flows by weight and ton-miles to highlight major freight movements.

### 6. Advanced SQL Analysis
Uses `RANK()` to identify the leading transportation modes within domestic, import, and export flows.

## Selected Findings

The initial analysis produced the following results:

- **Transportation modes:** Truck represented 64.18% of summed 2024 freight weight in the initial mode analysis.
- **Trade types:** Domestic records accounted for 19.57% of dataset records, while imports represented 41.20% and exports 39.23%.
- **Commodity groups:** Natural gas and other fossil products (SCTG code 19) ranked first by summed 2024 freight weight in the initial commodity analysis.
- **Historical trends:** Summed freight weight declined by 4.61% in 2020 compared with 2019, then increased by 2.87% in 2021.
- **Freight corridors:** The leading interregional domestic route by weight in the initial analysis was FAF region 489 to region 486.

These findings are preliminary outputs from the SQL analysis. The project distinguishes record shares from freight-weight shares and requires further validation of aggregation methodology before interpreting summed results as official national totals.

## Business Recommendations

Based on the patterns observed, logistics planners could:

- Evaluate capacity planning for truck-dominated freight flows.
- Compare commodity-specific transport requirements when prioritizing freight handling and network resources.
- Monitor year-over-year changes in freight weight and goods value to support demand planning.
- Investigate major interregional freight corridors when assessing network capacity and routing options.
- Compare domestic and international freight patterns when planning transportation resources.

These are potential areas for further investigation, not measured cost savings or proven causal effects.

## Data and Methodology Limitations

- FAF figures are estimates of freight flows, not direct counts of individual shipments.
- Freight weight, goods value, and ton-miles are different measures and should not be used interchangeably.
- Freight value is not the same as transportation revenue, profit, or shipping cost.
- Commodity and regional codes require the appropriate FAF metadata to interpret correctly.
- Before reporting aggregate figures as national totals, the relevant FAF methodology, units, coverage, and aggregation rules must be verified.
- Historical and forecast values should be clearly distinguished in any extended analysis.

## How to Use This Repository

1. Obtain the FAF 5.7.1 dataset and metadata from the official source.
2. Install MySQL 8.0 and MySQL Workbench.
3. Run `sql/01_database_setup.sql` to create the database and tables.
4. Import the source CSV into `freight_flows`, preserving the documented column order and handling empty values as `NULL`.
5. Run `sql/02_data_validation.sql` to validate the imported data.
6. Execute the remaining SQL scripts to reproduce the analyses.

The yearly trend script performs large aggregations. Execute its yearly summary statements individually if your MySQL connection has a query timeout.

## Author

**Data Analytics Portfolio Project**

Developed to demonstrate practical SQL skills, data validation, analytical problem-solving, and business-oriented interpretation using a real-world freight dataset.
