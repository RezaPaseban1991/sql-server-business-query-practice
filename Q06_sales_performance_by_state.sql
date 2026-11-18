-- ==========================================================================
-- Question 06 — Sales Performance by State
-- ==========================================================================
-- Intermediate Practice
-- Business Scenario
-- The regional sales manager wants to identify states that generated more than $10,000 in revenue from completed orders during 2025.
-- For each qualifying state, report the number of unique purchasing customers, the total number of completed orders, and total revenue.
-- Rank the states from highest to lowest revenue.

SELECT 
	C.State,
	SUM(O.TotalAmount) AS TotalRevenue,
	COUNT(O.OrderStatus) AS CompletedOrders,
	COUNT(DISTINCT(C.CustomerID)) AS UniqueCustomer 
FROM Orders AS O
LEFT JOIN Customers AS C
	ON O.CustomerID = C.CustomerID
WHERE (O.OrderDate >= '2025-01-01' AND
		O.OrderDate < '2026-01-01')
		AND O.OrderStatus = 'Completed'
GROUP BY C.State
HAVING SUM(O.TotalAmount) > 10000
ORDER BY SUM(O.TotalAmount) DESC
