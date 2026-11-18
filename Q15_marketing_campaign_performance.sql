-- ==========================================================================
-- Question 15 — Marketing Campaign Performance
-- ==========================================================================
-- Intermediate Practice
-- Business Scenario
-- The marketing manager wants to compare the performance and costs of different marketing channels during 2025.
-- For each marketing channel, report the total number of campaign contacts, number of unique customers reached, total marketing cost, and average discount offered.
-- Include only channels with at least 50 campaign contacts during 2025. Rank the channels from highest to lowest by total marketing cost.

SELECT 
	Channel,
	COUNT(CustomerID) AS NrContact,
	CAST(AVG(OfferPercent) AS DECIMAL(10,2)) AS AvgDiscount,
	COUNT(DISTINCT(CustomerID)) AS UniqueCustomer,
	SUM(CostPerContact) AS TotalCost
	

FROM MarketingCampaigns 
WHERE SentDate >= '2025-01-01'
	AND SentDate < '2026-01-01'

GROUP BY 
	Channel
HAVING COUNT(CustomerID) >= 50
ORDER BY SUM(CostPerContact)  DESC
