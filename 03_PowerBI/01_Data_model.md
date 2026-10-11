# Data Model



## Overview



The Power BI data model was designed using a **star schema** to support efficient reporting and analysis. Instead of connecting Power BI directly to the transaction table, a reporting layer was created in Snowflake using SQL views. These views provide a clean and organized structure for reporting while keeping data preparation separate from dashboard development.



---



## Data Source



- **Database:** Snowflake

- **Primary Source Table:** CLEAN_TRANSACTIONS

- **Reporting Layer:** SQL Views

- **Additional Source:** RFM_Segmentation.csv

- **Visualization Tool:** Power BI



---



# Reporting Layer



The following reporting views were created in Snowflake and imported into Power BI as the main reporting tables.



| Reporting View | Purpose |

|---------------|---------|

| **VW_FACT_SALES** | Stores transaction-level sales data used throughout the dashboard. |

| **VW_DIM_CUSTOMERS** | Contains unique customer information, including Customer ID and Country. |

| **VW_DIM_PRODUCTS** | Contains unique product information, including Stock Code and Product Name. |

| **VW_DIM_DATE** | Calendar table created to support time-based reporting and trend analysis. |

| **VW_CUSTOMER_INTELLIGENCE** | Customer-level summary view containing Total Orders, Total Sales, Total Quantity, Average Order Value, and Customer Type. |



---



# Star Schema



## Fact Table



### VW_FACT_SALES



This is the central table in the data model and contains transaction-level sales records used for all dashboard calculations.



**Key Fields**



- Invoice

- Invoice Date

- Customer ID

- Stock Code

- Quantity

- Unit Price

- Sales Amount



---



## Dimension Tables



### VW_DIM_CUSTOMERS



Contains unique customer information.



**Fields**



- Customer ID

- Country



---



### VW_DIM_PRODUCTS



Contains unique product information.



**Fields**



- Stock Code

- Product Name



---



### VW_DIM_DATE



Provides calendar information used for time-based analysis.



**Fields**



- Date

- Day

- Day Name

- Month Number

- Year Month

- Month

- Month Name

- Quarter

- Year



---



### VW_CUSTOMER_INTELLIGENCE



This view was created in Snowflake to prepare customer-level business metrics before importing the data into Power BI. Keeping these calculations in SQL reduced repeated calculations inside the dashboard.



**Fields**



- Customer ID

- Total Orders

- Total Sales

- Total Quantity

- Average Order Value

- Customer Type (Repeat Customer / One-Time Customer)



---



# Relationships



| From | To | Relationship |

|------|----|--------------|

| VW_FACT_SALES\[Customer ID] | VW_DIM_CUSTOMERS\[Customer ID] | Many-to-One |

| VW_FACT_SALES\[Stock Code] | VW_DIM_PRODUCTS\[Stock Code] | Many-to-One |

| VW_FACT_SALES\[Invoice Date] | VW_DIM_DATE\[Invoice Date] | Many-to-One |

| VW_CUSTOMER_INTELLIGENCE\[Customer ID] | VW_DIM_CUSTOMERS\[Customer ID] | Many-to-One |



**Cross-filter Direction**



- Single Direction (Dimension → Fact)



This relationship structure keeps filtering simple and helps maintain good report performance.



---



# Model Design Approach



The reporting layer was created in Snowflake before building the Power BI dashboard. Transaction data was separated into fact and dimension views, while customer-level business metrics were prepared in a dedicated customer intelligence view.



This approach helped keep the Power BI model simple, reduced the amount of DAX required, improved report performance, and made the dashboard easier to maintain.



---



# Data Flow



```

Raw Transactions



↓



Clean Transactions



↓



Snowflake Reporting Views



- VW_FACT_SALES

- VW_DIM_CUSTOMERS

- VW_DIM_PRODUCTS

- VW_DIM_DATE

- VW_CUSTOMER_INTELLIGENCE



↓



Power BI Data Model



↓



Business KPIs \& DAX Measures



↓



Interactive Dashboard

```

