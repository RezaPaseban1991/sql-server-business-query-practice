-- ==========================================================================
-- Question 16 — Payment Method Performance
-- ==========================================================================
-- Intermediate Practice
-- Business Scenario
-- The finance manager wants to compare the performance of different payment methods during 2025.
-- For each payment method, report the number of successful payment transactions, the number of unique customers who made those payments, total successful payment amount, and average successful payment amount.
-- Include only payment methods with at least 100 successful transactions during 2025. Rank payment methods from highest to lowest total payment amount.

SELECT 
	P.PaymentMethod,
	COUNT(P.PaymentID) AS NrSuccessfulPayment, 
	COUNT(DISTINCT(O.CustomerID)) AS NrUniqueCustomers,
	SUM(P.PaymentAmount) AS Total,
	AVG(P.PaymentAmount) AS AvgAmount



FROM Orders AS O
LEFT JOIN Payments AS P 
	ON P.OrderID = O.OrderID
	AND P.PaymentStatus = 'Captured'
WHERE 
	P.PaymentDate >= '2025-01-01'
	AND P.PaymentDate < '2026-01-01'
GROUP BY 
	P.PaymentMethod
HAVING COUNT(P.PaymentID) >= 100
ORDER BY SUM(P.PaymentAmount) DESC
