\# Reporting Layer



\-After completing the data cleaning and customer behavior analysis, a reporting layer was created in Snowflake to prepare the data for Power BI reporting.



\-Rather than connecting Power BI directly to the cleaned transaction table, dedicated reporting views were developed to organize the data into a business-friendly structure. These views follow a star schema, separating transactional data from descriptive information to simplify reporting and improve the overall performance of the data model.



\-By introducing a reporting layer, business logic is defined once in Snowflake and reused consistently across all dashboard visuals. This approach makes the data model easier to maintain, improves query performance, and provides a reliable foundation for business reporting.



\## Reporting Views



\### 1. VW\_FACT\_SALES



This view serves as the central fact table and contains transaction-level sales information along with the business measures required for reporting.



\*\*Key fields\*\*



\- Invoice

\- Customer ID

\- Stock Code

\- Invoice Date

\- Quantity

\- Unit Price

\- Sales Amount



This view forms the core of the Power BI data model and is used to calculate sales, revenue, and other transactional metrics.



\---



\### 2. VW\_DIM\_CUSTOMERS



This dimension contains one record for each customer and stores customer-related attributes used for analysis.



\*\*Key fields\*\*



\- Customer ID

\- Country



This view supports customer segmentation, customer-level analysis, and country-wise reporting.



\---



\### 3. VW\_DIM\_PRODUCTS



This dimension contains the unique products available in the cleaned dataset.



\*\*Key fields\*\*



\- Stock Code

\- Product Description



This view is used for product performance analysis and product-based reporting.



\---



\### 4. VW\_DIM\_DATE



This dimension provides calendar attributes required for time-based reporting.



\*\*Key fields\*\*



\- Date

\- Year

\- Quarter

\- Month Number

\- Month Name

\- Week Number

\- Day

\- Day Name



This view enables daily, monthly, quarterly, and yearly trend analysis within Power BI.



\---



\## Benefits of the Reporting Layer



Creating a dedicated reporting layer provides several advantages:



\- Separates reporting logic from the underlying transactional data.

\- Organizes the data into a star schema suitable for business intelligence reporting.

\- Reduces the complexity of the Power BI data model.

\- Provides reusable business-ready datasets for dashboards and future reporting.

\- Improves model performance and simplifies long-term maintenance.

