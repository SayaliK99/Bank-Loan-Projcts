# Bank-Loan-Projct BY PowerBI & SQL

## Project Summary
The Bank Loan Analysis Dashboard is designed to monitor and evaluate the loan portfolio of a bank. It integrates SQL for data extraction and transformation and Power BI for visualization to provide insights into loan disbursements, repayments, overdue accounts, and default risks.
The dashboard empowers management to track loan performance, reduce NPAs (Non-Performing Assets), and optimize credit decisions.

## Key Highlights:
Connected SQL Server database containing loan transactions, customer profiles, and repayment history.
Implemented ETL logic in SQL to clean, join, and aggregate raw data before loading into Power BI.
Developed interactive dashboards to analyze loan distribution, overdue trends, default risks, and branch performance.

## Problem Statement
Banks face challenges in tracking loan performance across multiple branches and customer segments due to:
Data silos in multiple systems leading to delayed reporting.
Difficulty in identifying high-risk customers and NPAs in real-time.
Lack of a centralized dashboard to monitor loan disbursement vs. repayment trends.
No predictive insight into which segments are most likely to default.
These limitations affect decision-making, risk management, and regulatory compliance.

## Solution Implemented
Data Integration and Modeling (SQL + Power BI):
Extracted loan, customer, and repayment data from SQL tables.
Cleaned data using CTEs and stored procedures to handle nulls, duplicates, and inconsistencies.
Created a star schema in Power BI with FactLoan, FactRepayment, DimCustomer, DimBranch.

## Insights Delivered:
Identified branches with highest default rate and loan types with highest NPA.
Improved risk monitoring and collection strategy through daily updated dashboards.
Enabled data-driven decision-making for credit policy and loan disbursement.
