SELECT a.CompanyName, ROUND((SELECT COUNT(*) FROM "Order" o, Shipper b where ShippedDate > RequiredDate and b.Id== o.ShipVia and b.CompanyName == a.CompanyName)*100.0/(SELECT COUNT(*) FROM "Order" o, Shipper b WHERE b.Id== o.ShipVia and b.CompanyName == a.CompanyName), 2) AS Percentage
FROM Shipper a
ORDER BY Percentage