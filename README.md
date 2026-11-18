SQL Server E-commerce Business Query Practice
25 business-focused T-SQL practice exercises using a synthetic e-commerce dataset. This repository documents SQL learning and practical business-question solving, separate from my ongoing dashboard-and-storytelling case studies.
Dataset disclosure: The data is fictional and created for education. It is not real Amazon customer data, and the analyses should not be interpreted as actual company performance.

Project overview
These exercises cover business questions about customer spending, sales, marketing, payments, inventory, shipping, and refunds. The focus is on expressing business requirements as database queries, joining relational tables, creating metrics, and analyzing results.

Technology: Microsoft SQL Server (T-SQL), SQL Server Management Studio (SSMS).

Skills demonstrated / practiced:
- Filtering and sorting (WHERE, ORDER BY, TOP)
- Aggregations (COUNT, COUNT(DISTINCT), SUM, AVG)
- Group-level filtering (GROUP BY, HAVING)
- INNER JOIN, LEFT JOIN and anti-join patterns
- Date filtering and calculations (DATEDIFF)
- CASE WHEN and conditional aggregation
- ISNULL, CAST, percentage metrics and business KPIs
- An introductory common table expression (CTE) example
Repository structure
sql-server-business-query-practice/
├── README.md
├── sql/
│   ├── business_queries_01_25.sql       # All 25 exercises in one script
│   └── questions/                       # One .sql file per question
│       ├── Q01_customer_spending_analysis.sql
│       ├── ...
│       └── Q25_average_refund_processing_time.sql
└── docs/
    └── review_checklist.md              # Suggested pre-publication improvements
Exercise index
#	Business question	Area
01	[Customer Spending Analysis](sql/questions/Q01_customer_spending_analysis.sql)	Customer analytics
02	[Product Sales Analysis](sql/questions/Q02_product_sales_analysis.sql)	Product & sales
03	[Shipping Performance](sql/questions/Q03_shipping_performance.sql)	Shipping & logistics
04	[Product Return Analysis](sql/questions/Q04_product_return_analysis.sql)	Returns & refunds
05	[Inventory Analysis](sql/questions/Q05_inventory_analysis.sql)	Inventory & warehouses
06	[Sales Performance by State](sql/questions/Q06_sales_performance_by_state.sql)	Sales performance
07	[Warehouse Shipping Activity](sql/questions/Q07_warehouse_shipping_activity.sql)	Shipping & logistics
08	[Payment Failure Analysis](sql/questions/Q08_payment_failure_analysis.sql)	Payments
09	[Customer Loyalty Analysis](sql/questions/Q09_customer_loyalty_analysis.sql)	Customer analytics
10	[Inactive Purchasing Behavior](sql/questions/Q10_inactive_purchasing_behavior.sql)	Customer analytics
11	[Warehouse Product Availability](sql/questions/Q11_warehouse_product_availability.sql)	Inventory & warehouses
12	[Products Without Returns](sql/questions/Q12_products_without_returns.sql)	Returns & refunds
13	[Marketing Campaign Analysis](sql/questions/Q13_marketing_campaign_analysis.sql)	Marketing
14	[Customer Order Analysis](sql/questions/Q14_customer_order_analysis.sql)	Customer analytics
15	[Marketing Campaign Performance](sql/questions/Q15_marketing_campaign_performance.sql)	Marketing
16	[Payment Method Performance](sql/questions/Q16_payment_method_performance.sql)	Payments
17	[Warehouse Shipping Summary](sql/questions/Q17_warehouse_shipping_summary.sql)	Shipping & logistics
18	[Order Classification](sql/questions/Q18_order_classification.sql)	Sales performance
19	[Shipment Status Analysis](sql/questions/Q19_shipment_status_analysis.sql)	Shipping & logistics
20	[Payment Performance Analysis](sql/questions/Q20_payment_performance_analysis.sql)	Payments
21	[Order Channel Performance](sql/questions/Q21_order_channel_performance.sql)	Sales performance
22	[Payment Failure Rate](sql/questions/Q22_payment_failure_rate.sql)	Payments
23	[Warehouse Late Delivery Analysis](sql/questions/Q23_warehouse_late_delivery_analysis.sql)	Shipping & logistics
24	[Return Refund Analysis](sql/questions/Q24_return_refund_analysis.sql)	Returns & refunds
25	[Average Refund Processing Time](sql/questions/Q25_average_refund_processing_time.sql)	Returns & refunds


How to use
1. Open any file under [`sql/questions/`](sql/questions/) in SSMS, or use the combined script [`business_queries_01_25.sql`](sql/business_queries_01_25.sql).
2. Run the SQL against the matching synthetic e-commerce SQL Server schema (the original tables are not included here).
3. Each question contains its business scenario and the corresponding T-SQL query.
4. The combined script includes GO separators between questions, which SSMS understands.
Referenced database tables
Customers, Orders, OrderItems, Products, Payments, Shipments, Warehouses, Inventory, Returns, and MarketingCampaigns.

Reproducibility note: The synthetic sample data and DDL scripts are not supplied in this package. The SQL can be reviewed as code, but execution requires tables with matching structures and columns. If shareable schema/data become available, they can be added later.
Learning record and next step
This collection reflects a progression of exercises, not a production-ready analytics system. SQL logic in the original exercise solutions has been preserved during repository formatting. See [the review checklist](docs/review_checklist.md) for improvements worth considering before public release.

My separate E-commerce Business Analytics Case Studies (In Progress) builds on this practice with SQL, data validation, Power BI dashboards, and evidence-based data storytelling using the same synthetic dataset. A link to that portfolio can be added here once public.
