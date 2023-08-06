--Find the total sales of which dealership_id is number 8
SELECT d.name, SUM(s.price_paid) as total_sales
FROM Sales s
INNER JOIN Car_inventory ci ON s.car_inventory_id = ci.car_inventory_id
INNER JOIN Dealerships d ON ci.dealership_id = d.dealership_id
WHERE d.dealership_id = 8
GROUP BY d.name;

--Find the top 5 salespeople with the highest total sales value:
SELECT de.first_name, de.last_name, SUM(s.price_paid) as total_sales_value
FROM Sales s
INNER JOIN dp_employees de ON s.employee_id = de.employee_id
WHERE de.job_title = 'salesperson'
GROUP BY de.employee_id, de.first_name, de.last_name
ORDER BY total_sales_value DESC
FETCH FIRST 5 ROWS ONLY;

--Find the dealership with the highest inventory value:
SELECT d.name, SUM(ci.purchasing_cost * ci.quantity) as inventory_value
FROM Dealerships d
INNER JOIN Car_inventory ci ON d.dealership_id = ci.dealership_id
INNER JOIN Vehicles v ON ci.vehicle_id = v.vehicle_id
GROUP BY d.name
ORDER BY inventory_value DESC;