# Project Background
This project leverages Google BigQuery to prepare data before loading it into Tableau to build a dashboard. Queries were later consolidated into a single query, then optimized to improve performance and reduce costs. 

## Tools & Technologies
- **Microsoft Excel**: File conversion, date scaffold creation
- **Google BigQuery**: SQL querying, data cleaning, and data extraction
- **Tableau**: Interactive dashboarding


## Links
- [SQL Queries](https://github.com/nvpham12/Online-Retail-II-Sales-Dashboard/tree/main/queries)
- [Tableau Dashboard](https://public.tableau.com/views/RetailSalesDashboard_17545186499380/Dashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
- [Technical and Analytics Report](https://github.com/nvpham12/Online-Retail-II-Sales-Dashboard/blob/main/Technical%20Report%20Online%20Retail%20Dashboard.md)

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
- Explore sales trends by country and product category.
- Examine order volume and revenue patterns for different customer segments.
- Identify opportunities to expand international sales.
---

# Data Source and License
- Dataset: Online Retail II  
- Creator: Daqing Chen
- License: Creative Commons Attribution 4.0 International (CC BY 4.0) license
