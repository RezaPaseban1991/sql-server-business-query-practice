-- ==========================================================================
-- Question 24 — Return Refund Analysis
-- ==========================================================================
-- termediate — NULL Handling
-- Business Scenario
-- The customer service manager wants to evaluate the refund process for product returns requested during 2025.
-- For each return reason, report:
-- Total number of returns
-- Number of returns with a completed refund (RefundDate is not NULL)
-- Number of returns still awaiting a refund (RefundDate is NULL)
-- Total refunded amount for completed refunds only
-- Completed refund rate as a percentage of all returns within that return reason, rounded to two decimal places
-- Include only return reasons with at least 10 returns during 2025.
-- Rank the return reasons from highest to lowest by the number of returns awaiting a refund.

SELECT 
	ReturnReason,
	COUNT(*) AS TotalReturns,
	SUM(
		CASE
			WHEN 
				RefundDate IS NOT NULL
				
				THEN 1
				ELSE 0
		END) AS NrCompletedRefund,
	SUM(
		CASE
			WHEN 
				 RefundDate IS NULL
				
				THEN 1
				ELSE 0
		END) AS NrAwaitedRefund,
	SUM(
		CASE
			WHEN 
				RefundDate IS NOT NULL
				THEN RefundAmount
				ELSE 0
		END) AS AmountCompletedRefund,
	CAST(
		SUM(
			CASE
				WHEN RefundDate IS NOT NULL
				THEN 1
				ELSE 0
		END) * 100.0 / COUNT(*)
								AS DECIMAL(10,2)
		) AS Rate
		
FROM Returns
WHERE ReturnDate >= '2025-01-01'
	AND ReturnDate < '2026-01-01'
GROUP BY ReturnReason 
HAVING 
	COUNT(*) >= 10
ORDER BY NrAwaitedRefund DESC
