/*====================================================
RFM Customer Value Segmentation Analysis
====================================================*/

WITH reference_date AS (
    SELECT MAX(invoicedate) AS latest_purchase_date
    FROM clean_transactions
)
SELECT
    customer_id,
    DATEDIFF(
        DAY,
        MAX(invoicedate),
        (SELECT latest_purchase_date FROM reference_date)
    ) AS recency,
    COUNT(DISTINCT invoice) AS frequency,
    ROUND(
        SUM(quantity * price),
        2
    ) AS monetary
FROM clean_transactions
GROUP BY customer_id;

-- Validate RFM Metric ranges
SELECT
    MIN(recency) AS min_recency,
    MAX(recency) AS max_recency,
    MIN(frequency) AS min_frequency,
    MAX(frequency) AS max_frequency,
    MIN(monetary) AS min_monetary,
    MAX(monetary) AS max_monetary
FROM (
    WITH reference_date AS (
        SELECT MAX(invoicedate) AS latest_purchase_date
        FROM clean_transactions
    )
        SELECT
        customer_id,
        DATEDIFF(
            DAY,
            MAX(invoicedate),
            (SELECT latest_purchase_date FROM reference_date)
        ) AS recency,
        COUNT(DISTINCT invoice) AS frequency,
        ROUND(
            SUM(quantity * price),
            2
        ) AS monetary
    FROM clean_transactions
    GROUP BY customer_id
);

-- Create RFM Scores
CREATE OR REPLACE TABLE rfm_scores AS
WITH reference_date AS (
    SELECT MAX(invoicedate) AS latest_purchase_date
    FROM clean_transactions
),
rfm_metrics AS (
    SELECT
        customer_id,
        DATEDIFF(
            DAY,
            MAX(invoicedate),
            (SELECT latest_purchase_date
             FROM reference_date)
        ) AS recency,
        COUNT(DISTINCT invoice) AS frequency,
        ROUND(SUM(quantity * price),2) AS monetary
    FROM clean_transactions
    GROUP BY customer_id
)
SELECT
    customer_id,
    recency,
    frequency,
    monetary,
    6 - NTILE(5) OVER(ORDER BY recency) AS recency_score,
    NTILE(5) OVER(ORDER BY frequency) AS frequency_score,
    NTILE(5) OVER(ORDER BY monetary) AS monetary_score
FROM rfm_metrics;

-- Validate RFM Scores
SELECT
    MIN(recency_score),
    MAX(recency_score),
    MIN(frequency_score),
    MAX(frequency_score),
    MIN(monetary_score),
    MAX(monetary_score)
FROM rfm_scores;

-- Create Customer Segments Based on RFM Scores
 CREATE OR REPLACE TABLE rfm_segments AS
SELECT
    customer_id,
    recency_score,
    frequency_score,
    monetary_score,
    CASE
        WHEN recency_score >= 4
         AND frequency_score >= 4
         AND monetary_score >= 4
        THEN 'Champions'
        WHEN recency_score >= 3
         AND frequency_score >= 4
        THEN 'Loyal Customers'
        WHEN monetary_score >= 4
         AND frequency_score <= 3
        THEN 'Big Spenders'
        WHEN recency_score >= 4
         AND frequency_score BETWEEN 2 AND 3
        THEN 'Potential Loyalists'
        WHEN recency_score <= 2
         AND frequency_score >= 3
        THEN 'At Risk'
        WHEN recency_score <= 2
         AND frequency_score <= 2
        THEN 'Lost Customers'
        ELSE 'Regular Customers'
    END AS customer_segment
FROM rfm_scores;

-- Analyze Customer Segment Distribution
SELECT
    customer_segment,
    COUNT(*) AS customers
FROM rfm_segments
GROUP BY customer_segment
ORDER BY customers DESC;

