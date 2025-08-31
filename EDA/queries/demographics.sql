-- Gender Distribution
SELECT 
    gender,
    COUNT(*) AS customers,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM customer_churn
GROUP BY gender; 

-- Marital Status
SELECT 
	CASE 
		WHEN partner = 'Yes' THEN 'Married'
        WHEN partner = 'No' THEN 'Unmarried'
	END as marital_status,
    COUNT(*) as customers,
    ROUND(COUNT(*) * 100.00 / SUM(COUNT(*)) OVER() , 2) AS percentage
FROM customer_churn
GROUP BY marital_status; 

-- Parental Status
SELECT
	CASE 
		WHEN dependents = 'Yes' THEN 'Have a child'
        WHEN dependents = 'No' THEN 'No child'
	END AS parental_status,
    COUNT(*) as customer,
    ROUND(COUNT(*) * 100.00 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM customer_churn
GROUP BY parental_status;

-- Senior Citizens 
SELECT
	COUNT(*) as senior_customers,
    (SELECT COUNT(*) FROM customer_churn) as total_customers,
    ROUND(COUNT(*) * 100.00 / (SELECT COUNT(*) FROM customer_churn),2) AS percentage
FROM customer_churn-- 
WHERE senior_citizen = 1;

-- Senior_citizen_parental_status
SELECT 
	CASE 
		WHEN dependents= 'Yes' THEN 'Have a child'
        ELSE 'No Child'
	END as parental_status,
    COUNT(*) as customers,
    COUNT(*) * 100.00 / SUM(COUNT(*)) OVER() AS percentage
FROM customer_churn
WHERE senior_citizen = 1
GROUP BY parental_status; 


-- Monthly charges distribution 
SELECT 
	CASE
		WHEN monthly_charges < 30 THEN 'Low(<$30)'
        WHEN monthly_charges BETWEEN 30 AND 60 THEN 'Medium($30 - $70)'
        ELSE 'High(>$70)' END
	AS charges_group,
    COUNT(*) as total_customers,
    ROUND(COUNT(*) * 100.00 / SUM(COUNT(*)) OVER() , 2) AS percentage 
FROM customer_churn
GROUP BY charges_group;





    
