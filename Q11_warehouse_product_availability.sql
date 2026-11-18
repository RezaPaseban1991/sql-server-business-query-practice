-- ==========================================================================
-- Question 11 — Warehouse Product Availability
-- ==========================================================================
-- Intermediate Practice
-- Business Scenario
-- The inventory manager wants to identify active products that have no inventory record at Warehouse 3001, even if those products are stocked at other warehouses.
-- For each qualifying product, show its ID, name, and category. Sort the results alphabetically by product name.

SELECT 
	P.ProductID,
	P.ProductName,
	P.Category,
	I.WarehouseID,
	I.InventoryID

FROM Products AS P 
LEFT JOIN Inventory AS I 
	ON P.ProductID = I.ProductID
	AND I.WarehouseID = '3001'
WHERE P.ProductStatus = 'Active'
AND I.InventoryID IS NULL
