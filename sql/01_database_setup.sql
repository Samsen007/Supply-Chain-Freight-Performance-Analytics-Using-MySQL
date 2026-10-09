
-- Project: Supply Chain & Freight Performance Analytics Using MySQL
-- Dataset: U.S. Freight Analysis Framework (FAF 5.7.1)
-- Purpose: Create the database and tables.

CREATE DATABASE IF NOT EXISTS freight_analytics;
USE freight_analytics;

-- Lookup table: Trade types
CREATE TABLE IF NOT EXISTS trade_type_lookup (
    trade_type_code TINYINT PRIMARY KEY,
    trade_type_name VARCHAR(30) NOT NULL
);

INSERT IGNORE INTO trade_type_lookup
    (trade_type_code, trade_type_name)
VALUES
    (1, 'Domestic'),
    (2, 'Import'),
    (3, 'Export');

-- Lookup table: Domestic transportation modes
CREATE TABLE IF NOT EXISTS transport_mode_lookup (
    mode_code TINYINT PRIMARY KEY,
    mode_name VARCHAR(50) NOT NULL
);

INSERT IGNORE INTO transport_mode_lookup (mode_code, mode_name)
VALUES
    (1, 'Truck'),
    (2, 'Rail'),
    (3, 'Water'),
    (4, 'Air'),
    (5, 'Multiple modes and mail'),
    (6, 'Pipeline'),
    (7, 'Other or unknown'),
    (8, 'No domestic mode');

-- Main freight fact table.
-- Region and commodity codes are stored as strings to preserve
-- leading zeros, e.g. 011 and 01.

CREATE TABLE IF NOT EXISTS freight_flows (
    fr_orig VARCHAR(10),
    dms_orig VARCHAR(10),
    dms_dest VARCHAR(10),
    fr_dest VARCHAR(10),
    fr_inmode TINYINT,
    dms_mode TINYINT,
    fr_outmode TINYINT,
    sctg2 VARCHAR(5),
    trade_type TINYINT,
    dist_band VARCHAR(10),

    tons_2017 DOUBLE,
    tons_2018 DOUBLE,
    tons_2019 DOUBLE,
    tons_2020 DOUBLE,
    tons_2021 DOUBLE,
    tons_2022 DOUBLE,
    tons_2023 DOUBLE,
    tons_2024 DOUBLE,
    tons_2030 DOUBLE,
    tons_2035 DOUBLE,
    tons_2040 DOUBLE,
    tons_2045 DOUBLE,
    tons_2050 DOUBLE,

    value_2017 DOUBLE,
    value_2018 DOUBLE,
    value_2019 DOUBLE,
    value_2020 DOUBLE,
    value_2021 DOUBLE,
    value_2022 DOUBLE,
    value_2023 DOUBLE,
    value_2024 DOUBLE,
    value_2030 DOUBLE,
    value_2035 DOUBLE,
    value_2040 DOUBLE,
    value_2045 DOUBLE,
    value_2050 DOUBLE,

    current_value_2018 DOUBLE,
    current_value_2019 DOUBLE,
    current_value_2020 DOUBLE,
    current_value_2021 DOUBLE,
    current_value_2022 DOUBLE,
    current_value_2023 DOUBLE,
    current_value_2024 DOUBLE,

    tmiles_2017 DOUBLE,
    tmiles_2018 DOUBLE,
    tmiles_2019 DOUBLE,
    tmiles_2020 DOUBLE,
    tmiles_2021 DOUBLE,
    tmiles_2022 DOUBLE,
    tmiles_2023 DOUBLE,
    tmiles_2024 DOUBLE,
    tmiles_2030 DOUBLE,
    tmiles_2035 DOUBLE,
    tmiles_2040 DOUBLE,
    tmiles_2045 DOUBLE,
    tmiles_2050 DOUBLE
);
