
# Customer Churn Analysis

## 📌 Overview
This project focuses on analyzing **customer churn** in **Telco company** using **SQL**.

Customer Churn (when customer leave compaby) is a critical business problem, and reducing it directly impact revenue and customer retention.

The goal of this project was to calculate churn rates across different customer segments and uncover insights that can guide strateguc decisions.

## 🎯 Objectives
- Calculate **overall churn rate**.
- Analyze churn across **demographics** (gender, senior citizens, marital and parental status).
- Study churn pattern by **contract type, internet service, tenure and monhtly charges**.
- Provide **actionable insights** that business can use to improve customer retention.

## 🛠️ Tools & Technologies
- **Database**: MySQL
- **Data Handling**: CSV(query ouptuts)

## 🔄 Project Workflow
1. Loaded the Telco Customer Churn dataset into MySQL.  
2. Wrote SQL queries to calculate churn rates across multiple dimensions:
   - Overall churn  
   - Gender-based churn  
   - Senior citizen churn (with and without dependents)  
   - Churn by contract type  
   - Churn by internet service type  
   - Tenure-based churn  
   - Monthly charges-based churn  
3. Exported query results to CSV files for reporting and dashboarding.  
4. Summarized the analysis and findings in an **EDA Report**.

## Examples
-  Churn Rate (Contract type)
```sql 
SELECT contract, COUNT(*) AS total_customers,
       SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) AS churned_customers,
       ROUND(SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM customers
GROUP BY contract;
```
Output: 

| contract      | total_customers |churned_cutomer| churn_rate|
|---------------|---------------- |---------------|-----------|
| Month-to-month| 3875            | 1655          |42.71      |
| One year      | 1473            | 166           |11.2       |
| Two year      | 1695            | 48            |2.83       | 
			

-  Churn Rate (Senior Citizens with dependents)
```sql 
SELECT 
	CASE
		WHEN dependents = 'Yes' THEN 'Have a child'
        ELSE 'No Child'
	END AS senior_parental_status,
    COUNT(*) as total_customer,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.00 / COUNT(*),2) AS churn_rate
FROM customer_churn
WHERE senior_citizen = 1
GROUP BY senior_parental
```
Output: 

| senior_parental_status| total_customers|churned_cutomer|curn_rate|
|-----------------------|----------------|---------------|---------|
| No child              | 1051           | 454           |43.20    |
| Have a child          | 91             | 22            |24.18    |

			
## 🔑 Key Insights
- **Overall churn rate**: 26.5% of customers left the company.  
- Customers on **month-to-month contracts** had the highest churn (**42.7%**) compared to one-year (**11.3%**) and two-year (**2.8%**) contracts.  
- Senior citizen **without dependents** have a higher churn (**43.20%**) compared to **with dependents** (**24.18%**).
- Customers tends to churn more within **first 2 years** (**<50%**) as compared to other.
- **High monthly charges** were strongly correlated with higher churn rates.  

## 📂 Deliverables
- **EDA/Queries** → SQL scripts for each churn analysis.  
- **EDA/data** → Query results saved as CSV.  
- **EDA_Report.md** → Detailed explanation of findings. 


