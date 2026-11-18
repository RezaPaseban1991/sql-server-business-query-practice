-- ==========================================================================
-- Question 13 — Marketing Campaign Analysis
-- ==========================================================================
-- Intermediate Practice
-- Business Scenario
-- The marketing manager wants to identify active customers who did not receive any Email marketing campaigns during 2025.
-- These customers may have received SMS or Push campaigns during 2025, or Email campaigns in other years.
-- For each qualifying customer, show their ID, first name, last name, and signup date.
-- Display the most recently registered customers first.

SELECT 
	C.CustomerID,
	C.FirstName,
	C.LastName,
	C.SignupDate,
	mc.Channel

FROM Customers AS C 
LEFT JOIN MarketingCampaigns AS MC 
	ON MC.CustomerID = C.CustomerID
	AND (MC.SentDate >= '2025-01-01'
	AND MC.SentDate < '2026-01-01')
	AND MC.Channel = 'Email'

WHERE C.CustomerStatus = 'Active'
and MC.Channel IS NULL
ORDER BY C.SignupDate DESC
