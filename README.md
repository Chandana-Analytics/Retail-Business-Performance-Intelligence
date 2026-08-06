# Retail Business Performance Intelligence

## Project Overview

**Retail Business Performance Intelligence** is a business intelligence project built using the **Online Retail II** dataset to analyze sales performance, customer purchasing behaviour, product performance, and revenue trends.

This project extends the **Retail Customer Behavior Analysis** SQL project. The SQL phase focused on preparing the data through profiling, cleaning, customer behaviour analysis, RFM segmentation, and the development of a reporting layer in Snowflake. Building on that foundation, Power BI was used to transform the analytical outputs into an interactive dashboard that enables business users to monitor business performance and explore insights through dynamic visualizations.

The dashboard combines Snowflake SQL for data preparation with Power BI for reporting, providing a practical solution for analyzing retail business performance from multiple perspectives.

---

# Business Problem

Retail businesses generate large volumes of transactional data every day, but raw transaction data alone does not provide meaningful business information.

Business users need answers to questions such as:

- How is the business performing overall?
- Which customers generate the highest revenue?
- Which products contribute the most sales?
- Which customer segments require attention?
- How does revenue change over time?

This project addresses these challenges by converting retail transaction data into an interactive Power BI dashboard that supports business monitoring and data-driven decision-making.

---

# Project Objectives

- Build an interactive retail business performance dashboard using Power BI.
- Reuse the reporting layer created in Snowflake SQL.
- Monitor executive sales KPIs.
- Analyze customer purchasing behaviour.
- Visualize SQL-generated RFM customer segmentation.
- Evaluate product performance.
- Analyze monthly and quarterly revenue trends.
- Present meaningful business insights and recommendations.

---

# Project Workflow

```
Online Retail II Dataset
        │
        ▼
Data Profiling & Cleaning (Snowflake SQL)
        │
        ▼
Reporting Layer Development
(Fact & Dimension Views)
        │
        ▼
Customer Intelligence View
        │
        ▼
RFM Customer Segmentation
        │
        ▼
Power BI Data Model
        │
        ▼
DAX Measures
        │
        ▼
Interactive Dashboard
        │
        ▼
Business Insights & Recommendations
```

---

# Dashboard Pages

## 1. Executive Overview

Provides a high-level summary of overall business performance.

### Key Metrics

- Total Sales
- Total Orders
- Total Customers
- Average Order Value
- Total Quantity Sold

---

## 2. Customer Intelligence

Analyzes customer purchasing behaviour and customer loyalty.

### Key Analysis

- Repeat Customers
- One-Time Customers
- Repeat Customer %
- Top Customers by Revenue
- Average Orders per Customer
- Average Quantity per Customer

---

## 3. Customer Segmentation

Visualizes customer segments generated through SQL-based RFM analysis.

### Customer Segments

- Champions
- Loyal Customers
- Potential Loyalists
- At Risk Customers
- Lost Customers
- Big Spenders

---

## 4. Product Intelligence

Evaluates product performance by analyzing revenue contribution, order volume, and sales quantity to identify the products that contribute the most to overall business performance.

### Key Analysis

- Top Products by Revenue
- Top Products by Orders
- Top Products by Quantity Sold
- Product Contribution to Total Sales

---

## 5. Time Intelligence

Analyzes sales performance across different time periods to understand revenue trends and business growth over time.

### Key Analysis

- Monthly Sales Trend
- Quarterly Revenue Trend
- Revenue Growth Analysis
- Sales Performance Over Time

---

## 6. Business Insights & Recommendations

Summarizes the key findings from the analysis and provides recommendations to support business decision-making.

---

# Business Questions Answered

The dashboard helps answer the following business questions:

- How is the business performing overall?
- Which customers contribute the highest revenue?
- How many customers are repeat buyers?
- Which customer segments generate the most value?
- Which products generate the highest revenue?
- Which products are ordered most frequently?
- How does revenue change over time?
- How does business performance vary across different countries?

---

# Technologies Used

## Data Preparation

- Snowflake SQL
- Reporting Layer
- Star Schema
- Fact & Dimension Views

## Business Intelligence

- Microsoft Power BI
- Power Query
- DAX

---

# Repository Structure

```
Retail_Business_Performance_Intelligence
│
├── README.md
├── 01_Data
├── 02_SQL
├── 03_PowerBI
├── 04_Documentation
└── 05_Outputs
```

---

# Key Features

- SQL reporting layer built in Snowflake
- Star schema data model
- Interactive Power BI dashboard
- Executive KPI reporting
- Customer intelligence analysis
- SQL-based RFM customer segmentation
- Product performance analysis
- Time-based sales analysis
- Business insights and recommendations

---

# Dashboard Preview

![Executive Overview](05_Outputs/Dashboard_Preview/Executive_Overview.png)

---

# Business Value

The dashboard transforms raw retail transaction data into meaningful business information that is easy to explore and understand.

Instead of manually analyzing thousands of transaction records, business users can quickly monitor sales performance, understand customer purchasing behaviour, evaluate product performance, identify valuable customer segments, and track revenue trends through a single interactive reporting solution.

By combining **Snowflake SQL** for data preparation and **Power BI** for visualization, the project delivers a structured business intelligence solution that supports data-driven decision-making and can be extended for future reporting requirements.