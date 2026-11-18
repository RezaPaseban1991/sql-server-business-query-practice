-- ==========================================================================
-- Question 17 — Warehouse Shipping Summary
-- ==========================================================================
-- Intermediate Practice
-- Business Scenario
-- The operations manager wants to evaluate shipping activity across all warehouses during 2025.
-- Prepare a report showing each warehouse's name, state, number of shipments sent during 2025, and total shipping cost.
-- Include every warehouse, even those with zero shipments during 2025. For those warehouses, report zero shipments and zero shipping cost.
-- Rank warehouses from highest to lowest by number of shipments.

SELECT 
	W.WarehouseName,
	W.State,
	COUNT(S.ShipmentID) AS NrShipments,
	ISNULL(SUM(S.ShippingCost),0) AS TotalCost

FROM Warehouses AS W
LEFT JOIN Shipments AS S
	ON S.WarehouseID = W.WarehouseID
	AND (S.ShipDate >= '2025-01-01'
	AND S.ShipDate < '2026-01-01')

GROUP BY
	W.WarehouseName,
	W.State
ORDER BY 
	COUNT(S.ShipmentID) DESC
