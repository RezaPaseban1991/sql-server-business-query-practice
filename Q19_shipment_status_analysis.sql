-- ==========================================================================
-- Question 19 — Shipment Status Analysis
-- ==========================================================================
-- Topic: CASE WHEN + Aggregation
-- Business Scenario
-- The operations manager wants to compare shipment statuses across warehouses during 2025.
-- For each warehouse, report the total number of shipments, the number of delivered shipments, and the number of shipments still in transit.
-- Include only shipments sent during 2025 and rank warehouses from highest to lowest by the number of delivered shipments.

SELECT 
	WarehouseID,
	COUNT(*) AS TotalNumber,
	SUM(CASE
			WHEN ShipmentStatus = 'Delivered'
			THEN 1
			ELSE 0
		END) AS NrDeliveredShipments,
	SUM(CASE
			WHEN ShipmentStatus = 'InTransit'
			THEN 1
			ELSE 0
		END) AS NrTransitShipments

FROM Shipments
WHERE ShipDate >= '2025-01-01'
	AND ShipDate < '2026-01-01'
GROUP BY
	WarehouseID
ORDER BY
	NrDeliveredShipments DESC
