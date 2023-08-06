CREATE INDEX idx_vehicle_make_model ON Vehicles(make, model);
CREATE INDEX idx_customer_last_first ON Customers(last_name, first_name);
CREATE INDEX idx_dealership_city_state ON Dealerships(city, state);
CREATE INDEX idx_insurance_coverage ON Insurance(coverage_type);
CREATE INDEX idx_car_inventory_dealership ON Car_inventory(dealership_id);
CREATE INDEX idx_employee_dealership ON Dp_employees(dealership_id);
CREATE INDEX idx_sale_customer_employee ON Sales(customer_id, employee_id);