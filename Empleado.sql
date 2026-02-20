CREATE VIEW vw_resumen_empleados AS
SELECT 
    e.FirstName + ' ' + e.LastName AS Empleado,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalVentas,
    AVG(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS PromedioVentaPorPedido
FROM Employees e
JOIN Orders o 
    ON e.EmployeeID = o.EmployeeID
JOIN [Order Details] od 
    ON o.OrderID = od.OrderID
GROUP BY e.FirstName, e.LastName;


SELECT * FROM vw_resumen_empleados;