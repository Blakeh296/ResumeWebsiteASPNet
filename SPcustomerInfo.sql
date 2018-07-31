use AdventureWorks2012
GO


use AdventureWorks2012
go

CREATE PROC CustomerInfo
AS
BEGIN
SELECT A.AddressLine1, A.City, A.PostalCode, SP.[Name] FROM Person.[Address] A
INNER JOIN Person.BusinessEntityAddress BEA
ON BEA.AddressID = A.AddressID
INNER JOIN Person.StateProvince SP
ON SP.StateProvinceID = A.StateProvinceID
INNER JOIN Person.EmailAddress EA
ON EA.BusinessEntityID = BEA.BusinessEntityID
END