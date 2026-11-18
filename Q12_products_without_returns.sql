-- ==========================================================================
-- Question 12 — Products Without Returns
-- ==========================================================================
-- Intermediate Practice · LEFT JOIN
-- Business Scenario
-- The quality assurance manager wants to identify active products that had no return requests during 2025, even if those products were returned in other years.
-- For each qualifying product, show its ID, name, and category. Sort the results alphabetically by product name.

SELECT 
	P.ProductID,
	P.ProductName,
	P.Category,
	R.ReturnID,
	R.ReturnDate
	

FROM Products AS P 
LEFT JOIN Returns AS R 
	ON P.ProductID = R.ProductID
	AND R.ReturnDate >= '2025-01-01'
	AND R.ReturnDate < '2026-01-01'
WHERE P.ProductStatus = 'Active'
AND R.ReturnID IS NULL
ORDER BY P.ProductName ASC
