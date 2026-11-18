-- ==========================================================================
-- Question 04 — Product Return Analysis
-- ==========================================================================
-- Business Scenario
-- The quality assurance manager wants to identify the 5 products with the highest number of returned units during 2025.
-- For each product, report its name, category, total returned units, and total refund amount.
-- Include only returns requested during 2025 and rank products by total returned units, from highest to lowest.

SELECT TOP 5
	P.ProductID,
	P.ProductName,
	p.Category,
	SUM(R.ReturnQuantity) AS NrRetrun,
	SUM(R.RefundAmount) AS TotalRefund
	
	
FROM  Returns AS R

INNER JOIN Products AS P	
	ON R.ProductID = P.ProductID

WHERE (R.ReturnDate >= '2025-01-01'
	AND R.ReturnDate  < '2026-01-01')

GROUP BY
	P.ProductID,
	P.ProductName,
	p.Category
ORDER BY SUM(R.ReturnQuantity) DESC
