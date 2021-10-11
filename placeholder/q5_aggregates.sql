SELECT CategoryName, (SELECT count(*) FROM Product p WHERE p.CategoryId=c.Id) AS number, ROUND(avg(UnitPrice),2) AS average, min(UnitPrice) AS min, MAX(UnitPrice) AS max, SUM(UnitsOnOrder) AS sum 
FROM Product as p1, Category c
WHERE P1.CategoryId=c.Id AND number>10
GROUP BY c.Id
ORDER BY CategoryId;