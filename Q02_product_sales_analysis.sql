-- ==========================================================================
-- Question 02 — Product Sales Analysis
-- ==========================================================================
-- Business Scenario
-- The sales manager wants to identify product categories that generated more than $10,000 in revenue from completed orders during 2025.
-- For each qualifying category, show the category name, total units sold, total revenue, and number of unique orders. Display categories from highest to lowest revenue.

SELECT 
	P.Category,
	count(DISTINCT(O.OrderID)) AS UniqueSale,
	SUM(OI.Quantity) AS Nrsales,
	SUM(OI.LineTotal) AS TotalSale
FROM OrderItems AS OI
INNER JOIN Products AS P
	ON P.ProductID = OI.ProductID
INNER JOIN Orders AS O
	ON O.OrderID = OI.OrderID
WHERE (O.OrderDate >= '2025-01-01'
	AND O.OrderDate < '2026-01-01')
	AND O.OrderStatus = 'Completed'
GROUP BY 
	P.Category
HAVING SUM(OI.LineTotal) > 10000
ORDER BY SUM(OI.LineTotal) DESC
