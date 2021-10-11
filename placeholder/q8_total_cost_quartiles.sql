WITH TotalExpenditures AS
(SELECT IFNULL(CompanyName, 'MISSING_NAME') AS CompanyNameFull, CustomerId, ROUND(SUM(Quantity*UnitPrice),2) AS TotalCost
FROM 'Order' AS od
INNER JOIN OrderDetail ON OrderDetail.OrderId = od.Id
LEFT JOIN Customer ON Customer.Id = od.CustomerId
GROUP BY CustomerId),
Quartiles AS (SELECT *, NTILE(4) OVER (ORDER BY TotalCost) AS ExpQuartiles FROM TotalExpenditures)
SELECT CompanyNameFull, CustomerId, TotalCost
FROM Quartiles
WHERE ExpQuartiles = 1
ORDER BY TotalCost;