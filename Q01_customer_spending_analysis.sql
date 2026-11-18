-- ==========================================================================
-- Question 01 — Customer Spending Analysis
-- ==========================================================================
-- Business Scenario
-- The sales manager wants to identify customers who spent more than $1,000 on completed orders during 2025.
-- Prepare a report showing each customer's full name, total spending, and number of completed orders. Display the highest-spending customers first.

SELECT 
	C.CustomerID,
	C.FirstName,
	C.LastName,
	count(*) AS Nrsales,
	SUM(O.TotalAmount) AS TotalSale
FROM Customers AS C
INNER JOIN Orders AS O
	ON O.CustomerID = C.CustomerID
WHERE (O.OrderDate >= '2025-01-01'
	AND O.OrderDate < '2026-01-01')
	AND O.OrderStatus = 'Completed'
GROUP BY 
	C.CustomerID,
	C.FirstName,
	C.LastName
HAVING SUM(O.TotalAmount) > 1000
ORDER BY SUM(O.TotalAmount) DESC
