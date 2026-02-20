CREATE VIEW vw_clasificacion_productos AS
SELECT 
    p.ProductName,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalVentas,
    CASE 
        WHEN SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) >
             (SELECT AVG(TotalProducto)
              FROM (
                    SELECT SUM(UnitPrice * Quantity * (1 - Discount)) AS TotalProducto
                    FROM [Order Details]
                    GROUP BY ProductID
                   ) AS Promedios)
        THEN 'Sobre el promedio'
        ELSE 'Bajo el promedio'
    END AS Clasificacion
FROM Products p
JOIN [Order Details] od 
    ON p.ProductID = od.ProductID
GROUP BY p.ProductName;

SELECT * FROM vw_clasificacion_productos;