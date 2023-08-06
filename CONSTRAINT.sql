--TRIGGER constraint
CREATE OR REPLACE TRIGGER vehicles_year_trg
BEFORE INSERT ON Vehicles
FOR EACH ROW
BEGIN
IF (:NEW.year <= 1900 OR :NEW.year > EXTRACT(YEAR FROM SYSDATE)) THEN
RAISE_APPLICATION_ERROR (-20001, 'The year must be greater than 1900 and less than or equal to the current year.');
END IF;
END;
/

--DEFAULT constraint
ALTER TABLE Car_inventory
MODIFY quantity DEFAULT 1
ADD CONSTRAINT car_inventory_quantity_ck CHECK (quantity > 0);

--CHECK constraint
ALTER TABLE Insurance
ADD CONSTRAINT insurance_dates_ck CHECK (start_date < end_date)
ADD CONSTRAINT insurance_policy_number_ck CHECK (REGEXP_LIKE(policy_number, '^\d{6}$'));

--UNIQUE constraint
ALTER TABLE Dealerships
ADD CONSTRAINT dealerships_unique_uk
UNIQUE (name, street_address, city, state, zip_code);

--CASCADE DELETE constraint
ALTER TABLE Sales
DROP CONSTRAINT sales_customer_fk;
ALTER TABLE Sales
ADD CONSTRAINT sales_customer_fk FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE;

--Delete related Car_inventory records when a Dealership information is deleted:
ALTER TABLE Car_inventory
DROP CONSTRAINT car_inventory_dealership_fk;
ALTER TABLE Car_inventory
ADD CONSTRAINT car_inventory_dealership_fk FOREIGN KEY
(dealership_id) REFERENCES Dealerships(dealership_id) ON DELETE CASCADE;

--Delete related Insurance records when a Vehicle information record is deleted:
ALTER TABLE Insurance
DROP CONSTRAINT insurance_vehicle_fk;
ALTER TABLE Insurance
ADD CONSTRAINT insurance_vehicle_fk FOREIGN KEY
(vehicle_id) REFERENCES Vehicles(vehicle_id) ON DELETE CASCADE;

--Delete related Dealership_employees records when a Dealership is deleted:
ALTER TABLE Dp_employees
DROP CONSTRAINT dp_employees_dealership_fk;
ALTER TABLE Dp_employees
ADD CONSTRAINT dp_employees_dealership_fk FOREIGN KEY
(dealership_id) REFERENCES Dealerships(dealership_id) ON DELETE CASCADE;