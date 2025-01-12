# **Clinipet Project**

HealthTail, one of the largest veterinary hospitals, approached Clinipet to automate their manual auditing process for medications and gain insights into disease trends. This project addresses their two primary challenges:
1. **Auditing Medication Purchases and Expenses**:
   - Track and analyze medication spending efficiently.
2. **Monitoring Diagnoses and Disease Trends**:
   - Identify the most common diagnoses and diseases across pet types and breeds to optimize staffing and medication procurement.

## **What I Did**
This project was completed in three steps:

### **Step 1: Data Cleaning and Aggregation**
- Cleaned and standardized the provided datasets to ensure consistency and accuracy.
- Created a new table, `med_audit`, to track monthly medication movements (`stock_in` and `stock_out`).
- [View SQL Queries for Step 1](./Step1.sql)

---

### **Step 2: Answering Research Questions**
- Wrote SQL queries to address HealthTail's key questions, such as:
  - What diseases have the highest costs?
  - What is the average spending on the disease generating the most revenue?
  - Which months saw the highest medication usage?
- [View SQL Queries for Step 2](./Step%202.sql)

---

### **Step 3: Interactive Dashboard in Looker Studio**
- Built a fully interactive dashboard to provide HealthTail managers with real-time insights into:
  - Most common diagnoses and diseases overall.
  - Disease trends by pet type and breed.
  - Spending trends on medications over time.
  - Age-related disease prevalence.
- The dashboard includes interactive filters (pet type, diagnosis, breed, date range) and diverse visualizations (bar charts, line charts, tables).
- [Access the Interactive Dashboard](https://lookerstudio.google.com/u/0/reporting/761c9d73-2b69-4651-a80c-4cab8b4136cd/page/hlgcE/edit)

---

## **Files in This Repository**
1. **SQL Queries**:
   - [Step 1 SQL Queries (Data Cleaning and Aggregation)](./Step%201.sql)
   - [Step 2 SQL Queries (Research Questions)](./Step%202.sql)
2. **Datasets**:
   - [HealthTail Registration Cards (Raw)](./healthtail_reg_cards.csv)
   - [Invoices (Raw)](./invoices.csv)
   - [Visits (Raw)](./visits.csv)
   - [Registration Cards (Cleaned)](./registration_clean.csv)
   - [Medication Audit Table](./med_audit.csv)
3. **README.md**:
   - This document.

---

## **Skills Used**
- **BigQuery**: For data cleaning, transformation, and SQL analysis.
- **SQL**: To answer research questions and create insights.
- **Looker Studio**: For building the interactive dashboard.

