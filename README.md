# Project Background
This project leverages Google BigQuery to prepare data before loading it into Tableau to build a dashboard. Queries were later consolidated into a single query, then optimized to improve performance and reduce costs. 

## Business Objective
Provide stakeholders with an interactive view of sales performance to monitor trends, identify revenue drivers, and support inventory and marketing planning.

## Primary Use Cases
- Monitor monthly and seasonal sales performance.
- Identify top-performing products and geographies.
- Compare domestic vs international sales behavior.
- Support inventory and promotion planning.

--- 

# Executive Summary
## Insights
- Two products account for a disproportionate share of revenue, with sales nearly double the next highest item.
- International customers represent a smaller share of total customers but generate 33% higher average unit prices.
- Sales declined year-over-year in 2011, driven by both fewer customers and lower total items sold.
- March and September consistently show peak sales activity.

## Recommendations
- Analyze customer churn between 2010 and 2011 by product and geography to identify whether revenue loss was driven by customer attrition or reduced order size.
- Expand international sales for top-performing products, particularly those with strong foreign demand and higher unit prices, while monitoring margin impact.
- Use seasonal peaks (March and September) to plan targeted promotions and inventory allocation for top-selling products.
- Track repeat purchase behavior for top products, identifying whether demand is driven by repeat buyers or one-time purchases.

## Proposed Success Metrics
- Total revenue and revenue growth
- Average order value
- Sales by product and geography
- Repeat customer rate

## Next Steps
- Explore sales trends by country and product category.
- Examine order volume and revenue patterns for different customer segments.
- Identify opportunities to expand international sales.

---

# Dashboard Preview
<img width="1799" height="1199" alt="Dashboard(1)" src="https://github.com/user-attachments/assets/9d2c4f27-d11a-4505-a2a6-6e4c87b0c722" />

---

# Links
- [SQL Queries](https://github.com/nvpham12/Online-Retail-II-Sales-Dashboard/tree/main/queries)
- [Tableau Dashboard](https://public.tableau.com/views/RetailSalesDashboard_17604811253120/Dashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
- [Technical and Analytics Report](https://github.com/nvpham12/Online-Retail-II-Sales-Dashboard/blob/main/Technical%20Report%20Online%20Retail%20Dashboard.md)

---

# Tools & Technologies
- Microsoft Excel
- Google BigQuery (SQL)
- Tableau

---

# Approach
- Cleaned and transformed retail sales data using SQL in BigQuery
- Consolidated and optimized queries to improve performance and reduce costs
- Designed an interactive Tableau dashboard to explore sales trends, products, and geographies
- Enabled stakeholder-driven analysis through filters and calculated fields

---

# Data
Retail sales transactions from a UK-based giftware company (2009–2011), including product, customer, pricing, and geographic information.

## Data Source and License
- Dataset: Online Retail II  
- Creator: Daqing Chen
- License: Creative Commons Attribution 4.0 International (CC BY 4.0) license
