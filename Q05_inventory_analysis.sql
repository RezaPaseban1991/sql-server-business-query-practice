-- ==========================================================================
-- Question 05 — Inventory Analysis
-- ==========================================================================
-- Business Scenario
-- The inventory manager wants to identify warehouses holding more than $20,000 worth of available inventory.
-- For each qualifying warehouse, report its name, state, total available units, and total available inventory value. Rank warehouses from highest to lowest inventory value.

WITH Holding AS(
	SELECT 
	WarehouseID,
	SUM((QuantityOnHand - QuantityReserved) * UnitCost) AS TotalAmount,
	SUM(QuantityOnHand - QuantityReserved) AS AvailableUnits
	FROM Inventory
	GROUP BY WarehouseID
	)
SELECT 
H.WarehouseID,
W.WarehouseName,
W.State,
AvailableUnits,
TotalAmount
FROM Holding AS H
LEFT JOIN Warehouses AS W
	ON H.WarehouseID = W.WarehouseID
WHERE TotalAmount > 20000
ORDER BY TotalAmount desc
