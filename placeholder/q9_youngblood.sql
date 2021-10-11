SELECT RegionDescription, FirstName, LastName, BirthDate
FROM
(SELECT RegionDescription, FirstName, LastName, BirthDate, RegionId
FROM Employee, EmployeeTerritory, Territory, Region
WHERE Employee.Id = EmployeeTerritory.EmployeeId AND EmployeeTerritory.TerritoryId = Territory.Id AND Territory.RegionId = Region.Id
GROUP BY RegionId 
HAVING MAX(BirthDate))
ORDER BY RegionId;