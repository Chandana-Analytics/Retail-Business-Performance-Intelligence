\# Data Model



\## Overview



The Power BI data model was designed using a \*\*star schema\*\* to support efficient reporting and analysis. Instead of connecting Power BI directly to the transaction table, a reporting layer was created in Snowflake using SQL views. These views provide a clean and organized structure for reporting while keeping data preparation separate from dashboard development.



\---



\## Data Source



\- \*\*Database:\*\* Snowflake

\- \*\*Primary Source Table:\*\* CLEAN\_TRANSACTIONS

\- \*\*Reporting Layer:\*\* SQL Views

\- \*\*Additional Source:\*\* RFM\_Segmentation.csv

\- \*\*Visualization Tool:\*\* Power BI



\---



\# Reporting Layer



The following reporting views were created in Snowflake and imported into Power BI as the main reporting tables.



| Reporting View | Purpose |

|---------------|---------|

| \*\*VW\_FACT\_SALES\*\* | Stores transaction-level sales data used throughout the dashboard. |

| \*\*VW\_DIM\_CUSTOMERS\*\* | Contains unique customer information, including Customer ID and Country. |

| \*\*VW\_DIM\_PRODUCTS\*\* | Contains unique product information, including Stock Code and Product Name. |

| \*\*VW\_DIM\_DATE\*\* | Calendar table created to support time-based reporting and trend analysis. |

| \*\*VW\_CUSTOMER\_INTELLIGENCE\*\* | Customer-level summary view containing Total Orders, Total Sales, Total Quantity, Average Order Value, and Customer Type. |



\---



\# Star Schema



\## Fact Table



\### VW\_FACT\_SALES



This is the central table in the data model and contains transaction-level sales records used for all dashboard calculations.



\*\*Key Fields\*\*



\- Invoice

\- Invoice Date

\- Customer ID

\- Stock Code

\- Quantity

\- Unit Price

\- Sales Amount



\---



\## Dimension Tables



\### VW\_DIM\_CUSTOMERS



Contains unique customer information.



\*\*Fields\*\*



\- Customer ID

\- Country



\---



\### VW\_DIM\_PRODUCTS



Contains unique product information.



\*\*Fields\*\*



\- Stock Code

\- Product Name



\---



\### VW\_DIM\_DATE



Provides calendar information used for time-based analysis.



\*\*Fields\*\*



\- Date

\- Day

\- Day Name

\- Month Number

\- Year Month

\- Month

\- Month Name

\- Quarter

\- Year



\---



\### VW\_CUSTOMER\_INTELLIGENCE



This view was created in Snowflake to prepare customer-level business metrics before importing the data into Power BI. Keeping these calculations in SQL reduced repeated calculations inside the dashboard.



\*\*Fields\*\*



\- Customer ID

\- Total Orders

\- Total Sales

\- Total Quantity

\- Average Order Value

\- Customer Type (Repeat Customer / One-Time Customer)



\---



\# Relationships



| From | To | Relationship |

|------|----|--------------|

| VW\_FACT\_SALES\[Customer ID] | VW\_DIM\_CUSTOMERS\[Customer ID] | Many-to-One |

| VW\_FACT\_SALES\[Stock Code] | VW\_DIM\_PRODUCTS\[Stock Code] | Many-to-One |

| VW\_FACT\_SALES\[Invoice Date] | VW\_DIM\_DATE\[Invoice Date] | Many-to-One |

| VW\_CUSTOMER\_INTELLIGENCE\[Customer ID] | VW\_DIM\_CUSTOMERS\[Customer ID] | Many-to-One |



\*\*Cross-filter Direction\*\*



\- Single Direction (Dimension → Fact)



This relationship structure keeps filtering simple and helps maintain good report performance.



\---



\# Model Design Approach



The reporting layer was created in Snowflake before building the Power BI dashboard. Transaction data was separated into fact and dimension views, while customer-level business metrics were prepared in a dedicated customer intelligence view.



This approach helped keep the Power BI model simple, reduced the amount of DAX required, improved report performance, and made the dashboard easier to maintain.



\---



\# Data Flow



```

Raw Transactions



↓



Clean Transactions



↓



Snowflake Reporting Views



\- VW\_FACT\_SALES

\- VW\_DIM\_CUSTOMERS

\- VW\_DIM\_PRODUCTS

\- VW\_DIM\_DATE

\- VW\_CUSTOMER\_INTELLIGENCE



↓



Power BI Data Model



↓



Business KPIs \& DAX Measures



↓



Interactive Dashboard

```

