-- ==========================================================================
-- Question 22 — Payment Failure Rate
-- ==========================================================================
-- Business Scenario
-- The finance manager wants to identify payment gateways with high transaction failure rates during 2025.
-- For each payment gateway, report:
-- Total number of payment transactions
-- Number of failed transactions
-- Number of successful (Captured) transactions
-- Failure rate as a percentage of total transactions, rounded to two decimal places
-- Include only gateways with at least 25 payment transactions during 2025.
-- Rank the gateways from highest to lowest by failure rate.

SELECT 
	PaymentGateway,
	COUNT(*) AS Total ,
	SUM(CASE
		WHEN PaymentStatus = 'Captured' THEN 1
		ELSE 0
	END) AS NrCaptured,
	SUM(CASE
		WHEN PaymentStatus = 'Failed' THEN 1
		ELSE 0
	END) AS NrFailed,
	CAST(
	SUM(CASE
			WHEN PaymentStatus = 'Failed'
			THEN 1
			ELSE 0
		END) * 100.0 / count(*) AS DECIMAL (10,2)) AS PercentRate

FROM Payments
WHERE PaymentDate >= '2025-01-01'
	AND PaymentDate < '2026-01-01'
GROUP BY
	PaymentGateway
HAVING COUNT(*) >= 25
ORDER BY PercentRate DESC
