-- ==========================================================================
-- Question 23 — Warehouse Late Delivery Analysis
-- ==========================================================================
-- Intermediate — Conditional Aggregation & Business KPIs
-- Business Scenario
-- The logistics manager wants to identify warehouses with the highest late-delivery rates for shipments sent during 2025.
-- For each warehouse, report:
-- Warehouse ID
-- Total number of shipments
-- Number of delivered shipments
-- Number of late-delivered shipments
-- Late-delivery rate as a percentage of delivered shipments within that warehouse, rounded to two decimal places
-- A shipment is considered late if its actual delivery date is after its estimated delivery date. Compare calendar dates, not times.
-- nclude only warehouses with at least 25 delivered shipments during 2025.
-- Rank warehouses from highest to lowest by late-delivery rate.

SELECT 
	WarehouseID,
	COUNT(*) AS NrShipments,
		SUM(
		CASE
			WHEN ShipmentStatus = 'Delivered'
			then 1
			ELSE 0
		END) AS NrDeliveredShipments,

	SUM(
		CASE
			WHEN DATEDIFF(DAY, EstimatedDeliveryDate, ActualDeliveryDate) > 0
				AND ShipmentStatus = 'Delivered'
			then 1
			ELSE 0
		END) AS NrLateShipments,

	CAST(
		SUM(
		CASE
			WHEN DATEDIFF(DAY, EstimatedDeliveryDate, ActualDeliveryDate) > 0
				AND ShipmentStatus = 'Delivered'
			then 1
			ELSE 0
		END) * 100.0 / SUM(
							CASE
								WHEN ShipmentStatus = 'Delivered'
								then 1
								ELSE 0
							END) 
							AS DECIMAL(10,2)) AS LateShipmentRate


FROM Shipments 
WHERE ShipDate >= '2025-01-01'
	AND ShipDate < '2026-01-01'
GROUP BY WarehouseID
HAVING 		
	SUM(
		CASE
			WHEN ShipmentStatus = 'Delivered'
			then 1
			ELSE 0
		END) >= 25
ORDER BY LateShipmentRate DESC
