-- ==========================================================================
-- Question 08 — Payment Failure Analysis
-- ==========================================================================
-- Intermediate Practice
-- Business Scenario
-- The finance manager wants to evaluate payment failures during 2025.
-- Identify payment methods with at least 5 failed payment attempts during that year.
-- For each qualifying payment method, report the total number of failed attempts, the number of unique orders affected, and the total amount of failed payments.
-- Rank payment methods from the highest to the lowest number of failed attempts.

SELECT 
	
	PaymentMethod,
	count(PaymentStatus) AS failedPayment,
	SUM(PaymentAmount) AS TotalAmount,
	COUNT(DISTINCT(OrderID)) AS UniqueOrders
FROM Payments 
WHERE (PaymentDate>= '2025-01-01' AND
		 PaymentDate< '2026-01-01')
		 AND PaymentStatus = 'Failed'

GROUP BY 
	PaymentMethod
HAVING count(PaymentStatus) >= 5
ORDER BY  count(PaymentStatus)  DESC
