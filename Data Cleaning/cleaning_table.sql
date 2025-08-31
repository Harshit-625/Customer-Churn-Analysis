-- Step 1:  checking the overall count of data 
SELECT COUNT(*) FROM customer_churn;

-- Step 2: Checking missing / null data
SELECT COUNT(*) FROM  customer_churn
WHERE total_charges = '' OR
total_charges IS NULL;

-- Step 3: Removing the NULL Rows
DELETE FROM customer_churn 
WHERE total_charges IS NULL; 

-- Step 4: Checking Duplicates
SELECT customer_id ,  COUNT(*)
FROM customer_churn
GROUP BY customer_id
HAVING COUNT(*) > 1;

