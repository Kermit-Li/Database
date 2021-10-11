SELECT ProductName, CompanyName, ContactName
FROM
(SELECT ProductName, CompanyName, ContactName, MIN(OrderDate)
FROM Product p, OrderDetail, "Order" o, Customer
WHERE Discontinued=1 AND p.Id=ProductId AND OrderId=o.Id AND Customer.Id=CustomerId
GROUP BY ProductName
ORDER BY ProductName);