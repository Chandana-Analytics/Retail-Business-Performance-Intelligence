\# DAX Measures



\## Overview



This document contains the DAX measures used in the Retail Customer Behavior Analysis dashboard. The measures are organized according to the report pages where they are used. Each measure supports a specific business requirement and enables dynamic analysis through Power BI.



\---



\# 1. Executive Overview



\## Total Sales



\*\*Purpose\*\*



Calculates the total revenue generated from completed retail transactions.



\### DAX



Total Sales = SUM('Fact Sales'\[SALES\_AMOUNT])



\---



\## Total Orders



\*\*Purpose\*\*



Calculates the total number of unique customer orders.



\### DAX



Total Orders = DISTINCTCOUNT('Fact Sales'\[INVOICE])

\---



\## Total Customers



\*\*Purpose\*\*



Calculates the total number of unique customers.



\### DAX



Total Customers = DISTINCTCOUNT('Fact Sales'\[CUSTOMER\_ID])



\---



\## Average Order Value



\*\*Purpose\*\*



Calculates the average revenue generated per order.



\### DAX



Average Order Value = DIVIDE(\[Total Sales],\[Total Orders])



\---



\## Total Quantity Sold



\*\*Purpose\*\*



Calculates the total number of products sold.



\### DAX



Total Quantity Sold = SUM('Fact Sales'\[QUANTITY])



\---



\# 2. Customer Intelligence



\## Repeat Customers



Repeat Customers =

COUNTROWS(

&#x20;   FILTER(

&#x20;       VALUES('Dim Customer'\[CUSTOMER\_ID]),

&#x20;       CALCULATE(DISTINCTCOUNT('Fact Sales'\[INVOICE])) > 1

&#x20;   )

)



\## Repeat Customer %



Repeat Customer % =

DIVIDE(

&#x20;   \[Repeat Customers],

&#x20;   \[Total Customers],

&#x20;   0

)

\## One-Time Customers



One-Time Customers =

COUNTROWS(

&#x20;   FILTER(

&#x20;       VALUES('Dim Customer'\[CUSTOMER\_ID]),

&#x20;       CALCULATE(DISTINCTCOUNT('Fact Sales'\[INVOICE]) = 1

&#x20;   )

))



\## Average Orders per Customer



Avg Orders / Customer = DIVIDE(\[Total Orders],\[Total Customers])



\## Average Quantity per Customer



Avg Qty / Customer =

DIVIDE(

&#x20;   \[Total Quantity Sold],

&#x20;   \[Total Customers]

)

\---



\# 3. Customer Segmentation



\## Overview



Customer segmentation was \*\*not calculated in Power BI\*\*.



The complete RFM analysis (Recency, Frequency, Monetary) and customer segmentation logic were developed in \*\*Snowflake SQL\*\* as part of the Retail Customer Behavior Analysis project.



The SQL output containing customer segments was exported as a CSV file and imported into Power BI.



Power BI was then used to create summary measures for each customer segment.



\---



\## Champions



Champions =

CALCULATE(

&#x20;   DISTINCTCOUNT('RFM Segmentation'\[CUSTOMER\_ID]),

&#x20;   'RFM Segmentation'\[CUSTOMER\_SEGMENT] = "Champions"

)



\## Loyal Customers



Loyal Customers =

CALCULATE(

&#x20;   DISTINCTCOUNT('RFM Segmentation'\[CUSTOMER\_ID]),

&#x20;   'RFM Segmentation'\[CUSTOMER\_SEGMENT] = "Loyal Customers"

)



\## Potential Loyalists



Potential Loyalists =

CALCULATE(

&#x20;   DISTINCTCOUNT('RFM Segmentation'\[CUSTOMER\_ID]),

&#x20;   'RFM Segmentation'\[CUSTOMER\_SEGMENT] = "Potential Loyalists"

)



\## At Risk Customers



At Risk Customers =

CALCULATE(

&#x20;   DISTINCTCOUNT('RFM Segmentation'\[CUSTOMER\_ID]),

&#x20;   'RFM Segmentation'\[CUSTOMER\_SEGMENT] = "At Risk"

)



\## Lost Customers



Lost Customers =

CALCULATE(

&#x20;   DISTINCTCOUNT('RFM Segmentation'\[CUSTOMER\_ID]),

&#x20;   'RFM Segmentation'\[CUSTOMER\_SEGMENT] = "Lost Customers"

)



\## Big Spenders



Big Spenders =

CALCULATE(

&#x20;   DISTINCTCOUNT('RFM Segmentation'\[CUSTOMER\_ID]),

&#x20;   'RFM Segmentation'\[CUSTOMER\_SEGMENT] = "Big Spenders"

)



\---



\# 4. Product Intelligence



\## Total Products



Total Products =

DISTINCTCOUNT('Dim Product'\[STOCKCODE])



\## Units Sold



Units Sold =

SUM('Fact Sales'\[QUANTITY])



\---



\# 5. Time Intelligence



\## Year-over-Year Revenue Growth %



YoY Growth % =

VAR SelectedYear =

&#x20;   SELECTEDVALUE('Dim Date'\[Year])

RETURN

IF(

&#x20;   SelectedYear = 2010,

&#x20;   BLANK(),

&#x20;   DIVIDE(

&#x20;       \[Total Sales] - \[Previous Year Sales],

&#x20;       \[Previous Year Sales]

&#x20;   )

)





\## Previous Month Sales



Previous Month Sales = CALCULATE(\[Total Sales],PREVIOUSMONTH('Dim Date'\[DATE]))



\## Month-over-Month Revenue Growth %



MoM Growth % =

DIVIDE(

&#x20;   \[Total Sales] - \[Previous Month Sales],

&#x20;   \[Previous Month Sales]

)

\---



\# Notes



\- Customer segmentation (RFM) was generated in Snowflake SQL and imported into Power BI as a CSV file.

\- No DAX measures were created for RFM scoring or customer segmentation.

\- All measures documented here were created specifically for dashboard reporting.

