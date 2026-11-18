-- ==========================================================================
-- Question 25 — Average Refund Processing Time
-- ==========================================================================
-- Intermediate — Date Functions & Aggregation
-- Business Scenario
-- The customer service manager wants to evaluate how long customers wait to receive refunds.
-- For each return reason, report:
-- Total number of returns requested during 2025
-- Number of completed refunds
-- Average refund processing time in days, rounded to two decimal places
-- Number of completed refunds that took more than 7 calendar days
-- nclude only return reasons with at least 10 completed refunds.
-- Rank return reasons from highest to lowest by average refund processing time.

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
				 DATEDIFF(DAY, ReturnDate, RefundDate) > 7
				
				THEN 1
				ELSE 0
		END) AS MoreThanSeven,
	CAST(
		AVG(
			CAST(
				DATEDIFF(DAY, ReturnDate, RefundDate)
			AS DECIMAL (10,2)
			)) AS DECIMAL (10,2)
		
		) AS AVGProcess
		
FROM Returns
WHERE ReturnDate >= '2025-01-01'
	AND ReturnDate < '2026-01-01'
GROUP BY ReturnReason 
HAVING 
	SUM(
		CASE
			WHEN 
				RefundDate IS NOT NULL
				THEN 1
				ELSE 0
		END) >= 10
ORDER BY AVGProcess DESC
