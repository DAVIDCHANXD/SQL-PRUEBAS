CREATE VIEW vw_resumen_clientes AS
SELECT 
    c.CompanyName AS Cliente,
    COUNT(o.OrderID) AS TotalPedidos,
    MAX(o.OrderDate) AS UltimaFechaCompra
FROM Customers c
LEFT JOIN Orders o 
    ON c.CustomerID = o.CustomerID
GROUP BY c.CompanyName;


SELECT * FROM vw_resumen_clientes;