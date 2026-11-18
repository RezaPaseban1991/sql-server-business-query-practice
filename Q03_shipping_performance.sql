-- ==========================================================================
-- Question 03 — Shipping Performance
-- ==========================================================================
-- Business Scenario
-- The operations manager wants to compare shipping companies' delivery performance during 2025.
-- For each carrier, report the number of delivered shipments, average delivery time in days, and total shipping cost.
-- Include only shipments actually delivered during 2025, and rank carriers from fastest to slowest based on average delivery time.

SELECT 
	S.Carrier,
	COUNT(*) AS NrShipment,
	AVG(DATEDIFF(DAY,S.ShipDate,S.ActualDeliveryDate)) AS AVGShippingDay,
	SUM(S.ShippingCost) AS TotalCost
	
FROM  Shipments AS S

WHERE (S.ActualDeliveryDate >= '2025-01-01'
	AND S.ActualDeliveryDate  < '2026-01-01')

	AND S.ShipmentStatus = 'Delivered'
GROUP BY S.Carrier
ORDER BY AVG(DATEDIFF(DAY,S.ShipDate,S.ActualDeliveryDate))
