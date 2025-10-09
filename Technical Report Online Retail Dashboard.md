# Project Background
This report combines technical and analytics perspectives, showcasing the pipeline, query optimization, and dashboard insights for sales data from an online retail store.

## Tools & Technologies
- **Microsoft Excel**: File conversion, date scaffold creation
- **Google BigQuery**: SQL querying, data cleaning, and data extraction
- **Tableau**: Interactive dashboarding

## Links
- [SQL Queries](https://github.com/nvpham12/Online-Retail-II-Sales-Dashboard/tree/main/queries)
- [Tableau Dashboard](https://public.tableau.com/views/RetailSalesDashboard_17545186499380/Dashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

## Approach
- Cleaned and transformed the Online Retail II dataset in BigQuery.
- Consolidated multiple queries into a single end-to-end pipeline, reducing overhead and improving performance.
- Optimized the pipeline using SQL best practices, clustering, and partitioning to reduce costs.
- Benchmarked queries to measure performance, following guidelines to ensure consistent metrics.
- Extracted a sample of the processed data from BigQuery and imported it into Tableau for visualization.
- Designed an interactive dashboard with date and location filters using calculated fields and colorblind-friendly palettes.
- Published the dashboard to Tableau Public.

## Data
- The dataset contains sales from 2009–2011 for a UK-based giftware company.
- The dataset includes invoices, stock codes, descriptions, quantities, prices, customer IDs, timestamps, and countries.
- The data contains 778,863 rows and 8 columns.

---

# Data Loading
- Original Excel files converted to CSV for BigQuery.
- Separate BigQuery tables created for each CSV file.

# Data Processing
- Unioned tables from both sheets.
- Removed missing values and invalid countries.
- Extracted and cleaned dates and timestamps.
- Removed duplicates.
- Converted prices to numeric type.
- Corrected "Korea" to "South Korea".
- Calculated sales and added as a column.
- Reordered columns for consistency.

## Schema
| Field Name              | Type    |
|------------------------|---------|
| Invoice                | STRING  |
| StockCode              | STRING  |
| Customer ID            | INTEGER |
| Description            | STRING  |
| Quantity               | INTEGER |
| InvoiceDate_UTC        | DATE    |
| InvoiceTimeStamp_UTC   | STRING  |
| UnitPrice              | FLOAT   |
| Sales                  | FLOAT   |
| Country                | STRING  |

---

# Query Benchmarking and Optimization
- Metrics: Elapsed Time, Slot Time Consumed, Bytes Shuffled, Bytes Processed.
- Optimization focuses on reducing bytes processed under On-Demand Pricing.

## Guidelines
- Queries run on the same servers back-to-back, with cached results disabled.
- Guidelines minimized variability from server differences or cloud throttling.

## Performance Metrics
- **Elapsed Time**: Query run time
- **Slot Time Consumed**: Computational capacity used
- **Bytes Shuffled**: Data moved between query stages
- **Bytes Processed**: Data processed by the query

## Individual Query Performance
| Query Steps         | Elapsed Time     | Slot Time Consumed | Bytes Shuffled | Bytes Processed |
|--------------------|------------------|--------------------|----------------|-----------------|
| **Union**          | 7 seconds        | 30 seconds         | 311.57 MB      | 92.97 MB        |
| **Data Cleaning**  | 5 seconds        | 16 seconds         | 281.76 MB      | 89.96 MB        |
| **Computing Sales**| 6 seconds        | 19 seconds         | 208.14 MB      | 84.76 MB        |
| **Update Table**   | 5 seconds        | 21 seconds         | 225.97 MB      | 96.64 MB        |
| **Total**          | 23 seconds       | 86 seconds         | 1027.44 MB     | 364.33 MB       |

## Individual Queries vs Baseline Pipeline
| Metric                | Individual Queries | Baseline Pipeline | Performance Difference (Individual − Baseline) | % Reduction |
|-----------------------|--------------------|-------------------|------------------------------------------------|-------------|
| **Elapsed Time**      | 23 seconds         | 11 seconds        | 12 seconds                                     | 52.17%      |
| **Slot Time Consumed**| 86 seconds         | 38 seconds        | 48 seconds                                     | 55.81%      |
| **Bytes Shuffled**    | 1027.44 MB         | 501.29 MB         | 526.15 MB                                      | 51.21%      |
| **Bytes Processed**   | 364.33 MB          | 182.16 MB         | 182.17 MB                                      | 50%         |

- Consolidating queries improved performance by ~50%, reducing runtime and resource use.

## Optimized Pipeline vs Baseline Pipeline
| Metric                | Baseline Pipeline | Optimized Pipeline | Performance Difference (Baseline − Optimized) | % Reduction |
|-----------------------|-------------------|--------------------|-----------------------------------------------|-------------|
| **Elapsed Time**      | 11 seconds        | 12 seconds         | -1 second                                     | -9.09%      |
| **Slot Time Consumed**| 38 seconds        | 1340 seconds       | -1328 seconds                                 | -11066.67%  |
| **Bytes Shuffled**    | 501.29 MB         | 307.01 MB          | 194.28 MB                                     | 38.76%      |
| **Bytes Processed**   | 182.16 MB         | 103.97 MB          | 78.19 MB                                      | 42.92%      |

- Run time increase is negligible; slot time does not affect On-Demand Pricing.
- Query costs reduced by ~43% relative to baseline.

---

# Tableau Dashboard Preview
<img width="1799" height="1199" alt="Dashboard" src="https://github.com/user-attachments/assets/ec6c1337-bc7a-45ec-9386-22bd1f3a8e70" />

> Dashboard visualizes a sample of the processed sales data extracted from the BigQuery.

---

# Executive Summary
## Insights
- Regency Cakestand 3 Tier and White Hanging Heat T-Light Holder are top-selling items, nearly double the next best.
- Postages and the Regency Cakestand had the highest sales outside the UK.
- UK sales account for 80% of total; foreign customers ~10%.
- 2011 had 14 fewer customers than 2010; total sales dropped £220,000, items sold decreased by ~500,000.
- Foreign orders have 33% higher average unit price than domestic.
- Sales per item: UK 1.67, foreign 1.48.

## Recommendations
- Investigate lost customers and competitors attracting 2011 buyers.
- Monitor demand for reusable top-selling products like the Regency Cakestand.
- Examine costs for foreign orders; higher unit prices likely reflect export costs.

## Next Steps
- Compare sales and average items per order between domestic and foreign customers.
- Confirm whether higher foreign prices align with higher sales or export costs.
- Analyze sales per item for each foreign country to identify expansion opportunities.

---

# Data Source and License
Dataset: Online Retail II

Creator: Daqing Chen

License: Creative Commons Attribution 4.0 International (CC BY 4.0)

Reference: Chen, D. (2012). Online Retail II [Dataset]. UCI Machine Learning Repository. https://doi.org/10.24432/C5CG6D

