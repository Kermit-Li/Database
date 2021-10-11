SELECT Id, OrderDate, PreviousOrderDate, ROUND(julianday(OrderDate) - julianday(PreviousOrderDate),2)
FROM
(SELECT Id, OrderDate, LAG(OrderDate,1,OrderDate) OVER (ORDER BY OrderDate) as PreviousOrderDate
FROM [Order]
WHERE CustomerId='BLONP'
ORDER BY OrderDate
LIMIT 10);