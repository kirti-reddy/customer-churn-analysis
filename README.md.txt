# Customer Churn Analysis

## Project Overview
Analyzed customer churn data using Oracle SQL and Python to identify patterns across customer segments.

## Tools Used
- Oracle SQL
- Python
- Pandas
- Matplotlib
- Jupyter Notebook

## Key Findings
- Customers analyzed with valid churn status: 490
- Customers churned: 116
- Overall churn rate: 23.67%
- Highest churn by contract: Two Year (27.15%)
- Highest churn by subscription: Standard (27.78%)
- Highest named internet service churn: Cable (29.91%)
- Highest churn by tenure: 25–48 months (28.57%)
- Highest churn among named payment methods: UPI (28.71%)

## Data Quality Notes
- Unknown/missing payment method: 15 customers, including 5 churned (33.33%).
- Two Year contracts had the highest observed churn rate in this dataset. This does not prove that contract type causes churn.

## Project Workflow
1. Loaded customer data into Oracle Database.
2. Used SQL queries to calculate churn rates.
3. Compared churn across customer segments.
4. Created charts using Python, Pandas, and Matplotlib.
5. Summarized findings and data quality considerations.

## Conclusion
The analysis identifies differences in observed churn rates across customer groups. These findings can help guide further investigation into customer retention.