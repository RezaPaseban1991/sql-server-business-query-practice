-- ==========================================================================
-- Question 18 — Order Classification
-- ==========================================================================
-- Topic: CASE WHEN
-- Business Scenario
-- The sales manager wants to classify completed orders from 2025 based on their total amount.
-- For each order, display its ID, total amount, and a new column called OrderCategory.
-- Order Amount	Category
-- Below $100	Small
-- $100 to less than $500	Medium
-- $500 or more	Large
-- Show the most expensive orders first.

SELECT 
	OrderID,
	TotalAmount,
	CASE
		WHEN TotalAmount <100 
		THEN 'Small'

		WHEN TotalAmount >= 100 AND TotalAmount <500
		THEN 'Medium'

		When TotalAmount >= 500
		then 'Large'

	END AS Category

FROM Orders
 
WHERE (OrderDate >= '2025-01-01'
	  AND OrderDate < '2026-01-01')
	  AND OrderStatus = 'Completed'
ORDER BY TotalAmount DESC
