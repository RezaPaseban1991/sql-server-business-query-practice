-- ==========================================================================
-- Question 14 — Customer Order Analysis
-- ==========================================================================
-- Intermediate Practice
-- Business Scenario
-- The customer retention manager wants to identify active customers who did not cancel any orders during 2025.
-- These customers may have completed orders, placed pending orders, or cancelled orders in other years.
-- For each qualifying customer, display their ID, first name, last name, and loyalty tier.
-- Sort the results alphabetically by last name.

SELECT 
	c.CustomerID,
	c.FirstName,
	c.LastName,
	c.LoyaltyTier,
	O.OrderStatus

FROM Customers AS C 
LEFT JOIN Orders AS O
	ON C.CustomerID = O.CustomerID
	AND (O.OrderDate >= '2025-01-01'
	AND O.OrderDate < '2026-01-01')
	AND OrderStatus = 'Cancelled'
WHERE OrderStatus IS NULL
AND C.CustomerStatus = 'Active'
ORDER BY C.LastName ASC
