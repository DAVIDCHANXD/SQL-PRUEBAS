CREATE VIEW vw_resumen_paises AS
SELECT 
    o.ShipCountry AS Pais,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalVentas,
    AVG(DATEDIFF(DAY, o.OrderDate, o.ShippedDate)) AS TiempoPromedioEnvio
FROM Orders o
JOIN [Order Details] od 
    ON o.OrderID = od.OrderID
GROUP BY o.ShipCountry;

SELECT * FROM vw_resumen_paises;