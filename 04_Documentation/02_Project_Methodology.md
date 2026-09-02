# Project Methodology

The project followed a structured workflow, starting from data preparation in Snowflake and ending with interactive business reporting in Power BI.

---

## Phase 1 — Data Preparation

The Online Retail II dataset was imported into Snowflake for analysis.

The data preparation process included:

- Profiling the dataset to understand its quality.
- Identifying cancelled transactions.
- Identifying missing Customer IDs.
- Identifying negative quantities and invalid prices.
- Cleaning the dataset by removing invalid records.
- Creating a clean transaction table for further analysis.

This ensured that all subsequent analysis was performed on reliable and consistent data.

---

## Phase 2 — Customer Behaviour Analysis

After cleaning the data, SQL was used to analyze customer purchasing behaviour.

The analysis included:

- Customer Purchase Frequency Analysis
- Customer Spending Analysis
- Customer Purchase Volume Analysis
- Customer Recency Analysis
- RFM Customer Segmentation

The RFM segmentation generated during this phase was exported as a CSV file for use in Power BI.

---

## Phase 3 — Reporting Layer Development

To simplify dashboard development, a reporting layer was created in Snowflake.

The reporting layer consists of:

- VW_FACT_SALES
- VW_DIM_CUSTOMERS
- VW_DIM_PRODUCTS
- VW_DIM_DATE
- VW_CUSTOMER_INTELLIGENCE

These reporting views separate transactional data from reporting data and provide a structured data model for Power BI.

---

## Phase 4 — Dashboard Development

The reporting views were connected directly from Snowflake into Power BI.

The RFM segmentation created during the SQL phase was imported separately as a CSV file.

Using these data sources, interactive report pages were developed to analyze:

- Executive Business Performance
- Customer Intelligence
- Customer Segmentation
- Product Performance
- Time-Based Sales Trends
- Business Insights & Recommendations

---

## Phase 5 — Business Reporting

The final dashboard combines SQL analysis and Power BI reporting to provide a complete view of retail business performance.

The dashboard helps users:

- Monitor key business KPIs.
- Analyze customer purchasing behaviour.
- Understand customer segments.
- Evaluate product performance.
- Track sales trends over time.
- Support business decisions through interactive reporting.