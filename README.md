# Project Background
This project leverages Google BigQuery to prepare data before loading it into Tableau to build a dashboard. Queries were later consolidated into a single query, then optimized to improve performance and reduce costs. 

## Tools & Technologies
- **Microsoft Excel**: File conversion, creating date scaffold for dashboarding
- **Google BigQuery**: SQL querying, data cleaning, and data extraction
- **Tableau**: Interactive dashboarding

## Links
- [SQL Query files](https://github.com/nvpham12/Online-Retail-II-Sales-Dashboard/tree/main/queries)
- [Tableau Dashboard](https://public.tableau.com/views/RetailSalesDashboard_17545186499380/Dashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
- [Technical Report](https://github.com/nvpham12/Online-Retail-II-Sales-Dashboard/blob/main/Technical%20Report%20Online%20Retail%20Dashboard.md)

## Approach
- Cleaned & transformed Online Retail II dataset in BigQuery.
- Consolidated multiple queries into a single end-to-end query pipeline, reducing overhead and improving overall query performance.
- Optimized the query pipeline through SQL best practices, clustering, and partitioning to lower query costs.
- Benchmarked all queries and pipelines to measure performance, following guidelines to ensure accurate and unbiased metrics.
- Extracted data from the query and imported it into Tableau.
- Designed an interactive Tableau dashboard with filters for date and location, using colorblind-friendly palettes.
- Published the dashboard to Tableau Public.

## Data
- The dataset contains information on sales occuring between 2009 and 2011 from a UK based company that typically sells gift-ware to wholesalers.
- The dataset includes invoices, item stock codes, item descriptions, quantities sold, prices, customer ids, invoice timestamps, and customer countries between December 2009 to December 2011.
- The data contains 778,863 rows and 8 columns.

---

# Executive Summary
## Insights
- Regency Cakestand 3 Tier and White Hanging Heat T-Light Holder are the products with the highest sales, having close to double the sales of the next best selling item.
- Postages and the same Regency Cakestand have the highest in sales outside of UK-based customers.
- While the store mainly sells products to the United Kingdom, other frequent buyers are from Australia, EIRE (Ireland), France, Germany, and the Netherlands.
- Sales in the UK account for 80% of total sales and the number of foreign customers account for around 10% of total customers.
- The business had 14 fewer customers in 2011 than in 2010. Sales also decreased by 220,000 British Pounds and the number of items purchased decreased by around 500,000 in 2011 from 2010.
- Average unit price from foreign orders is 33% higher than domestic orders.
- The sales per item sold ratio  is 1.67 for UK based customers and 1.48 across all foreign customers.

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
