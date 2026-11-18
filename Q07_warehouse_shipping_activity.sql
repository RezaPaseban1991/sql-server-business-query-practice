-- ==========================================================================
-- Question 07 — Warehouse Shipping Activity
-- ==========================================================================
-- Intermediate Practice
-- Business Scenario
-- The operations manager wants to evaluate warehouse shipping activity during 2025.
-- Identify warehouses that shipped at least 50 packages during that year. For each warehouse, report its name, total shipments, number of unique orders shipped, and total shipping cost.
-- Rank warehouses from highest to lowest by total shipments.

SELECT 
	 W.WarehouseID,
	 W.WarehouseName,
	 COUNT(S.ShipmentID) AS TotalShipment,
	 COUNT(DISTINCT(S.OrderID)) AS  UniqueOrders,
	 SUM(S.ShippingCost) AS TotalShippingCost
FROM Shipments AS S
LEFT JOIN Warehouses AS W
	ON S.WarehouseID = W.WarehouseID
WHERE (s.ShipDate >= '2025-01-01' AND
		s.ShipDate < '2026-01-01')

GROUP BY 
	W.WarehouseID,
	W.WarehouseName
HAVING COUNT(S.ShipmentID) >= 50
ORDER BY  COUNT(S.ShipmentID)  DESC
