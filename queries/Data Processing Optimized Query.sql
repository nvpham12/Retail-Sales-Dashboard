/*
This query:
  - Combines data from two Excel sheets (saved as CSV files and loaded into BigQuery as separate tables) using UNION ALL
  - Defines the result as a Common Table Expression (CTE) for further processing
  - Removes currency and converts Price into a numerical column, UnitPrice
  - Calculates total Sales per row (Unit_Price × Quantity)
  - Removes duplicates using SELECT DISTINCT
  - Creates an InvoiceDate_UTC column
  - Removes UTC suffix from all invoice dates and renames column to InvoiceTimeStamp_UTC
  - Removes rows with non-positive Quantities, nulls, invalid Countries, and canceled orders (where Invoice starts with 'C')
  - Creates a new table that contains the resulting dataset
  - Processes 92.97 MB of data

It differs from the baseline query in that this query:
  - Lists out all columns instead of using SELECT *
  - Filters the data from the sheets first instead of filtering the union CTE
  - Uses UNION ALL instead of UNION DISTINCT, reducing redundant deduplication (SELECT DISTINCT is used later)
  - Finds UnitPrices without a subquery
*/

CREATE OR REPLACE TABLE
  `online_retail_2_dataset.cleaned_retail_2`
CLUSTER BY
  Country AS
WITH
  retail_union AS (
  SELECT
    Invoice,
    StockCode,
    `Customer ID`,
    Description,
    Quantity,
    InvoiceDate,
    Price,
    Country
  FROM
    `online_retail_2_dataset.sheet1`
  WHERE
    Quantity > 0
    AND `Customer ID` IS NOT NULL
    AND Description IS NOT NULL
    AND Invoice NOT LIKE 'C%'
    AND Country NOT IN ('Unspecified',
      'European Community',
      'West Indies')
  UNION ALL
  SELECT
    Invoice,
    StockCode,
    `Customer ID`,
    Description,
    Quantity,
    InvoiceDate,
    Price,
    Country
  FROM
    `online_retail_2_dataset.sheet2`
  WHERE
    Quantity > 0
    AND `Customer ID` IS NOT NULL
    AND Description IS NOT NULL
    AND Invoice NOT LIKE 'C%'
    AND Country NOT IN ('Unspecified',
      'European Community',
      'West Indies'))

SELECT
  DISTINCT Invoice,
  StockCode,
  `Customer ID`,
  Description,
  Quantity,
  DATE(InvoiceDate) AS InvoiceDate_UTC,
  FORMAT_TIMESTAMP('%F %T', InvoiceDate) AS InvoiceTimeStamp_UTC,
  ROUND(SAFE_CAST(REGEXP_REPLACE(Price, r'^GBP\s*', '') AS FLOAT64), 2) AS UnitPrice,
  ROUND(SAFE_CAST(REGEXP_REPLACE(Price, r'^GBP\s*', '') AS FLOAT64) * Quantity, 2) AS Sales,
  Country
FROM
  retail_union;

-- This update changes instances of 'Korea' in the Country column to 'South Korea' per the assumption that orders in 'Korea' are not from 'North Korea'
UPDATE
  `online_retail_2_dataset.cleaned_retail_2`
SET
  Country = 'South Korea'
WHERE
  Country = 'Korea';