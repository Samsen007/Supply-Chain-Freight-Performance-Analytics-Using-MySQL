# Data Validation

## Initial Validation Results

The following checks were performed after importing the dataset into MySQL.

| Validation check | Result |
|---|---|
| Imported records | 2,671,386 |
| Missing domestic origin codes | 0 |
| Missing domestic destination codes | 0 |
| Missing commodity codes | 0 |
| Missing trade type codes | 0 |
| Missing domestic mode codes | 0 |

## Additional Checks

- Inspected sample records to check column alignment.
- Confirmed that leading-zero region and commodity codes were preserved.
- Reviewed missing foreign-region and foreign-mode fields.
- Compared the MySQL record count with the source CSV record count.

## Data Quality Considerations

Missing foreign-region fields may be legitimate for certain types of freight movements. These fields should not automatically be replaced with zero or used as a reason to delete records.

A preliminary duplicate-key check identified repeated combinations of selected fields. Because the candidate key did not include all relevant dimensions, this was not treated as proof of duplicate records.

## Status

These are initial validation checks. A complete validation should also check numeric conversion warnings, valid code mappings, the official dataset's record grain, and aggregation rules before publishing national-level totals.
