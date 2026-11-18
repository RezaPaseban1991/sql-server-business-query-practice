-- ==========================================================================
-- Question 09 — Customer Loyalty Analysis
-- ==========================================================================
-- Intermediate Practice
-- Business Scenario
-- The marketing manager wants to compare the purchasing behavior of different customer loyalty tiers during 2025.
-- For each loyalty tier, report the number of unique customers who completed purchases, the total number of completed orders, total revenue, and average order value.
-- Include only loyalty tiers that generated more than $15,000 in revenue. Rank the results from highest to lowest revenue.

SELECT 

	C.LoyaltyTier,
	COUNT(DISTINCT(C.customerID)) AS UniqueCustomers,
	COUNT(O.OrderID) AS TotalCompleted,
	SUM(O.TotalAmount) AS TotalRevenue,
	AVG(O.TotalAmount) AS AVGValue
FROM Customers AS C
LEFT JOIN Orders AS O 
	ON C.CustomerID = O.CustomerID
WHERE (O.OrderDate>= '2025-01-01' AND
		 O.OrderDate< '2026-01-01')
		 AND O.OrderStatus = 'Completed'

GROUP BY 
	C.LoyaltyTier
HAVING SUM(O.TotalAmount) > 15000
ORDER BY  SUM(O.TotalAmount)  DESC
