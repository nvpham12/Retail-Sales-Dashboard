# Project Background
This project leverages Google BigQuery to prepare data before loading it into Tableau to build a dashboard. Queries were later consolidated into a single query, then optimized to improve performance and reduce costs. 

## Tools & Technologies
- **Microsoft Excel**: File conversion, creating date scaffold for dashboarding
- **Google BigQuery**: SQL querying, data cleaning, and data extraction
- **Tableau**: Interactive dashboarding

## Links
- [SQL Query files](https://github.com/nvpham12/Online-Retail-II-Sales-Dashboard/tree/main/queries)
- [Tableau Dashboard](https://public.tableau.com/views/RetailSalesDashboard_17545186499380/Dashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

## Approach
- Cleaned & transformed Online Retail II dataset in BigQuery.
- Consolidated multiple queries into a single end-to-end query pipeline, reducing overhead and improving overall query performance.
- Optimized the query pipeline through SQL best practices, clustering, and partitioning to lower query costs.
- Benchmarked all queries and pipelines to performance.
- Extracted data from the query and imported it into Tableau.
- Designed an interactive Tableau dashboard with filters for date and location, using colorblind-friendly palettes.

## Data
- The dataset contains information on sales occuring between 2009 and 2011 from a UK based company that typically sells gift-ware to wholesalers.
- The dataset includes invoices, item stock codes, item descriptions, quantities sold, prices, customer ids, invoice timestamps, and customer countries between December 2009 to December 2011.
- The data contains 778,863 rows and 8 columns.

### Schema

| Field Name    | Type      |
|---------------|-----------|
| Invoice       | STRING    |
| StockCode     | STRING    |
| Description   | STRING    |
| Quantity      | INTEGER   |
| InvoiceDate   | TIMESTAMP |
| Price         | STRING    |
| Customer ID   | INTEGER   |
| Country       | STRING    |

---

# Data Loading
- The data was in a multi-sheet Excel file format when it was downloaded, requiring conversion to another file type, such as CSV.
- Tables were made in BigQuery for each CSV file.

# Data Processing
- A union was used to combine the tables from the 2 sheets.
- Missing values and invalid countries were removed.
- Dates were extracted and timestamps were cleaned.
- Duplicates were removed.
- Prices were converted into a numerical data type.
- Korea was changed to South Korea (sales are assumed to be from South Korea not North Korea).
- Sales were computed and added as a column.
- Customer ID was moved to after StockCode and before Description.

## Final Schema
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
BigQuery uses Elapsed Time, Slot Time Consumed, Bytes Shuffled and Bytes Processed as query performance metrics. BigQuery offers pricing based on slot time consumed (Capacity Pricing) or bytes processed (On-Demand Pricing). The optimization assumes On-Demand Pricing and while focus on reducing bytes processed.

## Guidelines
- All queries were run using the same servers and settings 
- Queries were run back-to-back. 
- The 'Use cached results' setting was turned off to ensure each query had to run from scratch. 
- These guidelines were followed to minimize external factors such as server diffrences or throttling at times when cloud usage is in high demand.

## Performance Metrics
- **Elapsed Time**: The query run time.
- **Slot Time Consumed**: The units of computational capacity required to execute the SQL query. 
- **Bytes Shuffled**: The amount of data moved between stages of query execution.
- **Bytes Processed**:  The amount of data processed by the query.

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
- Combining queries into a pipeline (vs running them individually) improved performance by roughly 50% all-around, running faster while reducing resource consumption.

## Optimized Pipeline vs Baseline Pipeline
| Metric                | Baseline Pipeline | Optimized Pipeline | Performance Difference (Baseline − Optimized) | % Reduction |
|-----------------------|-------------------|--------------------|-----------------------------------------------|-------------|
| **Elapsed Time**      | 11 seconds        | 12 seconds         | -1 second                                     | -9.09%      |
| **Slot Time Consumed**| 38 seconds        | 1340 seconds       | -1328 seconds                                 | -11066.67%  |
| **Bytes Shuffled**    | 501.29 MB         | 307.01 MB          | 194.28 MB                                     | 38.76%      |
| **Bytes Processed**   | 182.16 MB         | 103.97 MB          | 78.19 MB                                      | 42.92%      |

- Run time increased by 1 second which isn't a meaningful difference. The queries have roughly the same run time and the difference may be due to normal system variability.
- The optimized query uses significantly more slot time due to partitioning, but slot time consumed is not a factor in BigQuery's On-Demand Pricing model.
- With On-Demand Pricing, costs can be further reduced by 42.92% relative to the baseline query pipeline.

---

# Tableau Dashboard Preview
<img width="1799" height="1199" alt="Dashboard" src="https://github.com/user-attachments/assets/ec6c1337-bc7a-45ec-9386-22bd1f3a8e70" />

---

# Executive Summary
## Insights
- Regency Cakestand 3 Tier and White Hanging Heat T-Light Holder are the products with the highest sales, having close to double the sales of the next best selling item.
- Postages and the same Regency Cakestand have the highest in sales outside of UK-based customers.
- While the store mainly sells products to the United Kingdom, other frequent buyers are from Australia, EIRE (Ireland), France, Germany, and the Netherlands.
- Sales in the UK account for 80% of total sales and the number of foreign customers account for around 10% of total customers.
- The business had 14 fewer customers in 2011 than in 2010. Sales also decreased by 220,000 British Pounds and the number of items purchased decreased by around 500,000 in 2011 from 2010.
- Average unit price from foreign orders is 33% higher than domestic orders.
- The sales per item sold ratio (sales / number of items sold) is $14,143,359/8,458,784 = 1.67$ for UK based customers and $2,913,656/1,973,359 = 1.48$ across all foreign customers.

## Recommendations
- Check the number of wholesalers among 2010 customers and compare that the number of customers from 2011. If the store has lost customers, investigate why they churned, if they moved their purchases to a competitor, and what attracts them to that competitor.
- The store's best selling item is the Regency Cakestand. However, this type of product tends to be reusable. Demand for this item should be closely monitored.
- Check costs of products sold to foreign customers. While foreign customers have orders with higher unit prices, this is likely driven by export costs that are passed on to the customer.

## Next Steps
- Query the data to check the sales and average number of items per order inside and outside of the UK for comparison.
- Verify if the average unit price from foreign orders are accompanied with higher sales. The higher average prices could potentially be driven due to additional costs associated with exports, which are passed on to customers.
- Check sales per item for each foreign country, checking for any that surpasses the ratio for domestic customers of 1.67. The store is recommended to expand business in those countries.

---

# Data Source and License
- Dataset: Online Retail II  
- Creator: Daqing Chen
- License: Creative Commons Attribution 4.0 International (CC BY 4.0) license
- Reference: Chen, D. (2012). Online Retail II [Dataset]. UCI Machine Learning Repository. https://doi.org/10.24432/C5CG6D.