-- Churn rate: Overall 
SELECT 
	COUNT(*) AS total_customer,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) as churned_customers,
	ROUND((SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.00 / COUNT(*)),2) AS churn_rate
FROM customer_churn;


-- Churn rate: Male vs Female 
SELECT 
	gender,
	COUNT(*) as total_cutomers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) as churned_customers,
    ROUND((SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.00 / COUNT(*)),2) AS churn_rate
FROM customer_churn
GROUP BY Gender;

-- Churn rate: Marital Status
SELECT 
	CASE
		WHEN partner = 'Yes' THEN 'Married'
        WHEN partner = 'No' THEN 'Unmarried'
	END AS marital_status,
    COUNT(*) as total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) as churned_customers,
    ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.00 / COUNT(*), 2) AS churn_rate
FROM customer_churn
GROUP BY marital_status;

-- Churn Rate : Parental Status
SELECT 
	CASE
		WHEN dependents = 'Yes' THEN 'Have a child'
        ELSE 'No Child'
	END AS parental_status,
    COUNT(*) as total_customer,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.00 / COUNT(*),2) AS churn_rate
FROM customer_churn
GROUP BY parental_status;



-- Churn Rate: Senior Citizen 
SELECT 
	SUM(CASE WHEN senior_citizen = 1 THEN 1 ELSE 0 END)  as total_senior_citizen_customers,
    SUM(CASE WHEN churn = 'Yes' AND senior_citizen = 1 THEN 1 ELSE 0 END) as churned_customers,
	ROUND((SUM(CASE WHEN senior_citizen = 1 AND churn = 'Yes' THEN 1 ELSE 0 END) * 100.00 / SUM(CASE WHEN senior_citizen = 1 THEN 1 ELSE 0 END)),2) AS seniors_churn_rate
FROM customer_churn;

-- Churn Rate : Parental Status in Senior Citizens
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
GROUP BY senior_parental_status;


-- Churn rate : Payment Method
SELECT 
	payment_method,
    COUNT(*) as total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_cutomer,
    ROUND((SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.00 / COUNT(*)),2) AS churn_rate
FROM customer_churn
GROUP BY payment_method
ORDER BY churn_rate DESC;

-- Churn rate : contract
SELECT 
	contract,
    COUNT(*) as total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_cutomer,
    ROUND((SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.00 / COUNT(*)),2) AS churn_rate
FROM customer_churn
GROUP BY contract
ORDER BY churn_rate DESC;

-- Churn Rate : Monthly
SELECT 
    CASE 
        WHEN tenure BETWEEN 0 AND 12 THEN '0-12 months'
        WHEN tenure BETWEEN 13 AND 24 THEN '13-24 months'
        WHEN tenure BETWEEN 25 AND 36 THEN '25-36 months'
        WHEN tenure BETWEEN 37 AND 48 THEN '37-48 months'
        WHEN tenure BETWEEN 49 AND 60 THEN '49-60 months'
        ELSE '60+ months'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND((SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) AS churn_rate
FROM customer_churn
GROUP BY tenure_group
ORDER BY churn_rate DESC;

-- Churn rate : monthly charges

SELECT
	 CASE 
		WHEN monthly_charges < 30 THEN 'Low(<$30)'
        WHEN monthly_charges BETWEEN 30 AND 60 THEN 'Medium($30-$70)'
        ELSE 'High(>$70)'
	END AS charge_plan,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) as churned_customers,
    SUM(CASE WHEN churn = 'YES' THEN 1 ELSE 0 END) * 100.00 / COUNT(*) AS churn_rate
FROM customer_churn
GROUP BY charge_plan;
