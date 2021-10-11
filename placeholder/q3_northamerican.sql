SELECT DISTINCT Id, ShipCountry, (SELECT 'NorthAmerica' WHERE ShipCountry IN('USA','Mexico','Canada')  UNION SELECT 'OtherPlace' WHERE ShipCountry NOT IN ('USA','Mexico','Canada') )as Place
FROM "Order"
WHERE Id>=15445
ORDER BY Id
LIMIT 20;