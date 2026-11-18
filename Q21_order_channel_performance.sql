-- ==========================================================================
-- Question 21 — Order Channel Performance
-- ==========================================================================
-- Intermediate — Conditional Aggregation & Percentage
-- Business Scenario
-- The sales manager wants to evaluate the performance of different order channels during 2025.
-- For each order channel, report:
-- Total number of orders
-- Number of completed orders
-- Number of cancelled orders
-- Completion rate as a percentage of total orders within each channel
-- Total revenue from completed orders only
-- Include only channels with at least 30 orders during 2025.
-- Rank the channels from highest to lowest by completion rate.

SELECT 
	OrderChannel,
	COUNT(*) AS TotalNumber,
	SUM(CASE
			WHEN OrderStatus = 'Completed'
			THEN 1
			ELSE 0
		END) AS NrCompletedOrders,
	SUM(CASE
			WHEN OrderStatus = 'Cancelled'
			THEN 1
			ELSE 0
		END) AS NrCanceledPayment,
	SUM(CASE
			WHEN OrderStatus = 'Completed'
			THEN TotalAmount
			ELSE 0
		END) AS TotalAmount,
CAST(
	SUM(CASE
			WHEN OrderStatus = 'Completed'
			THEN 1
			ELSE 0
		END) * 100.0 / count(*) AS DECIMAL (10,2)) AS PercentRate

FROM Orders

WHERE OrderDate >= '2025-01-01'
	AND OrderDate < '2026-01-01'
GROUP BY
	OrderChannel
HAVING
	COUNT(*)  >= 30
ORDER BY
	PercentRate DESC
