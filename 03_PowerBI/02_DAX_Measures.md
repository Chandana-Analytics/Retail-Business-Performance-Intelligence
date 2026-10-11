# DAX Measures

## Overview

This document contains the DAX measures used in the Retail Customer Behavior Analysis dashboard. The measures are organized according to the report pages where they are used. Each measure supports a specific business requirement and enables dynamic analysis through Power BI.
---

# 1. Executive Overview

## Total Sales

**Purpose**
Calculates the total revenue generated from completed retail transactions.
### DAX

```dax
Total Sales = SUM('Fact Sales' [SALES _AMOUNT])
```

---

## Total Orders

**Purpose**
Calculates the total number of unique customer orders.
### DAX

```dax
Total Orders = DISTINCTCOUNT('Fact Sales' [INVOICE])
```

---

## Total Customers

**Purpose**
Calculates the total number of unique customers.
### DAX

```dax
Total Customers = DISTINCTCOUNT('Fact Sales' [CUSTOMER _ID])
```

---

## Average Order Value

**Purpose**
Calculates the average revenue generated per order.
### DAX

```dax
Average Order Value = DIVIDE( [Total Sales], [Total Orders])
```

---

## Total Quantity Sold

**Purpose**
Calculates the total number of products sold.
### DAX

```dax
Total Quantity Sold = SUM('Fact Sales' [QUANTITY])
```

---

# 2. Customer Intelligence

## Repeat Customers

```dax
Repeat Customers =
COUNTROWS(
FILTER(
VALUES('Dim Customer'[CUSTOMER _ID]),
CALCULATE(DISTINCTCOUNT('Fact Sales'[INVOICE])) > 1
)
)
```

## Repeat Customer %

```dax
Repeat Customer % =
DIVIDE(
[Repeat Customers],
[Total Customers],
0
)
```

## One-Time Customers

```dax
One-Time Customers =
COUNTROWS(
FILTER(
VALUES('Dim Customer'[CUSTOMER_ID]),
CALCULATE(
DISTINCTCOUNT('Fact Sales'[INVOICE])
) = 1
)
)
```

## Average Orders per Customer

```dax
Avg Orders / Customer = DIVIDE( [Total Orders], [Total Customers])
```

## Average Quantity per Customer

```dax
Avg Qty / Customer =
DIVIDE(
[Total Quantity Sold],
[Total Customers]
)
```

---

# 3. Customer Segmentation

## Overview

Customer segmentation was **not calculated in Power BI**.
The complete RFM analysis (Recency, Frequency, Monetary) and customer segmentation logic were developed in **Snowflake SQL** as part of the Retail Customer Behavior Analysis project.
The SQL output containing customer segments was exported as a CSV file and imported into Power BI.
Power BI was then used to create summary measures for each customer segment.
---

## Champions

```dax
Champions =
CALCULATE(
DISTINCTCOUNT('RFM Segmentation' [CUSTOMER _ID]),
'RFM Segmentation' [CUSTOMER _SEGMENT] = "Champions"
)
```

## Loyal Customers

```dax
Loyal Customers =
CALCULATE(
DISTINCTCOUNT('RFM Segmentation' [CUSTOMER _ID]),
'RFM Segmentation' [CUSTOMER _SEGMENT] = "Loyal Customers"
)
```

## Potential Loyalists

```dax
Potential Loyalists =
CALCULATE(
DISTINCTCOUNT('RFM Segmentation' [CUSTOMER _ID]),
'RFM Segmentation' [CUSTOMER _SEGMENT] = "Potential Loyalists"
)
```

## At Risk Customers

```dax
At Risk Customers =
CALCULATE(
DISTINCTCOUNT('RFM Segmentation' [CUSTOMER _ID]),
'RFM Segmentation' [CUSTOMER _SEGMENT] = "At Risk"
)
```

## Lost Customers

```dax
Lost Customers =
CALCULATE(
DISTINCTCOUNT('RFM Segmentation' [CUSTOMER _ID]),
'RFM Segmentation' [CUSTOMER _SEGMENT] = "Lost Customers"
)
```

## Big Spenders

```dax
Big Spenders =
CALCULATE(
DISTINCTCOUNT('RFM Segmentation' [CUSTOMER _ID]),
'RFM Segmentation' [CUSTOMER _SEGMENT] = "Big Spenders"
)
```

---

# 4. Product Intelligence

## Total Products

```dax
Total Products =
DISTINCTCOUNT('Dim Product' [STOCKCODE])
```

## Units Sold

```dax
Units Sold =
SUM('Fact Sales' [QUANTITY])
```

---

# 5. Time Intelligence

## Year-over-Year Revenue Growth %

```dax
YoY Growth % =
VAR SelectedYear =
SELECTEDVALUE('Dim Date' [Year])
RETURN
IF(
SelectedYear = 2010,
BLANK(),
DIVIDE(
[Total Sales] -  [Previous Year Sales],
[Previous Year Sales]
)
)
```

## Previous Month Sales

```dax
Previous Month Sales = CALCULATE( [Total Sales],PREVIOUSMONTH('Dim Date' [DATE]))
```

## Month-over-Month Revenue Growth %

```dax
MoM Growth % =
DIVIDE(
[Total Sales] -  [Previous Month Sales],
[Previous Month Sales]
)
```

---

# Notes

- Customer segmentation (RFM) was generated in Snowflake SQL and imported into Power BI as a CSV file.
- No DAX measures were created for RFM scoring or customer segmentation.
- All measures documented here were created specifically for dashboard reporting.
