-- ==========================================================================
-- Question 10 — Inactive Purchasing Behavior
-- ==========================================================================
-- Intermediate Practice
-- Business Scenario
-- The customer retention manager wants to identify active customers who did not complete any orders during 2025.
-- These customers may have placed cancelled or pending orders, or made purchases in other years.
-- For each customer, show their ID, first name, last name, and signup date. Display the most recently registered customers first.

SELECT 
	C.CustomerID,
	C.FirstName,
	C.LastName,
	C.SignupDate,
	O.OrderStatus
	
FROM Customers AS C
LEFT JOIN Orders AS O 
	ON C.CustomerID = O.CustomerID
 AND (O.OrderDate>= '2025-01-01' AND
		 O.OrderDate< '2026-01-01')
		  AND O.OrderStatus = 'Completed'
	WHERE  C.CustomerStatus = 'Active'
		 AND O.OrderID IS NULL
		 
ORDER BY C.SignupDate DESC
