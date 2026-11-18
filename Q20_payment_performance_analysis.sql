-- ==========================================================================
-- Question 20 — Payment Performance Analysis
-- ==========================================================================
-- Intermediate Practice
-- Business Scenario
-- The finance manager wants to compare successful and failed payment transactions across different payment methods during 2025.
-- For each payment method, report the number of successful transactions, number of failed transactions, and total amount of successful payments.
-- Include only payment methods with at least 20 successful transactions and rank them from highest to lowest by successful payment amount.

SELECT 
	PaymentMethod,
	COUNT(*) AS TotalNumber,
	SUM(CASE
			WHEN PaymentStatus = 'Captured'
			THEN 1
			ELSE 0
		END) AS NrSuccessfulPayment,
	SUM(CASE
			WHEN PaymentStatus = 'Failed'
			THEN 1
			ELSE 0
		END) AS NrFailPayment,
	SUM(CASE
			WHEN PaymentStatus = 'Captured'
			THEN PaymentAmount
			ELSE 0
		END) AS TotalAmount

FROM Payments
WHERE PaymentDate >= '2025-01-01'
	AND PaymentDate < '2026-01-01'
GROUP BY
	PaymentMethod
HAVING
	SUM(CASE
			WHEN PaymentStatus = 'Captured'
			THEN 1
			ELSE 0
		END) >= 20
ORDER BY
	TotalAmount DESC
