\# SQL Project Reference



This Power BI dashboard extends the \*\*Retail Customer Behavior Analysis\*\* SQL project.



The original SQL project focused on understanding customer purchasing behaviour through SQL analysis. The work included:



\- Data Loading

\- Data Profiling

\- Data Cleaning

\- Customer Purchase Frequency Analysis

\- Customer Spending Analysis

\- Customer Purchase Volume Analysis

\- Customer Recency Analysis

\- RFM Customer Segmentation



During the Power BI phase, additional SQL objects were created in Snowflake to support dashboard reporting. These include:



\- Reporting Layer Views

&#x20; - VW\_FACT\_SALES

&#x20; - VW\_DIM\_CUSTOMERS

&#x20; - VW\_DIM\_PRODUCTS

&#x20; - VW\_DIM\_DATE

\- VW\_CUSTOMER\_INTELLIGENCE



The RFM segmentation generated during the SQL project was exported as a CSV file and imported into Power BI, while the reporting views were connected directly from Snowflake.



Only the SQL components required for dashboard reporting are included in this repository.

