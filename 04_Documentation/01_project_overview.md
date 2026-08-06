\# Project Overview



\-\*\*Retail Business Performance Intelligence\*\* is an end-to-end analytics project built using the \*\*Online Retail II\*\* dataset to analyze retail business performance through interactive reporting and business intelligence.



\-The project started by profiling and cleaning the retail transaction data in Snowflake. Invalid records such as cancelled transactions, missing customer IDs, negative quantities, and incorrect prices were identified and removed to prepare a reliable dataset for analysis.



\-After the data was prepared, SQL was used to analyze customer purchasing behaviour, evaluate customer spending patterns, calculate purchase frequency and recency, and perform RFM-based customer segmentation to understand different customer groups.



\-To support Power BI reporting, a reporting layer was created in Snowflake using a star schema. Fact and dimension views were developed to provide a clean, structured, and reusable data model for dashboard development.



\-The reporting views were connected directly to Power BI, while the SQL-generated RFM segmentation results were exported as a CSV file and imported into Power BI for customer segmentation reporting. The final dashboard provides interactive analysis of executive KPIs, customer intelligence, customer segmentation, product performance, sales trends, and country-level business performance.



\-This project demonstrates a complete analytics workflow, combining Snowflake SQL for data preparation and business analysis with Power BI for interactive reporting and business intelligence.

