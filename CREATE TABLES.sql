CREATE TABLE Vehicles
(
    vehicle_id NUMBER NOT NULL,
    make VARCHAR2(50) NOT NULL,
    model VARCHAR2(50) NOT NULL,
    year NUMBER NOT NULL,
    color VARCHAR2(50) NOT NULL,
    factory_price NUMBER(10,2) NOT NULL,
    CONSTRAINT vehicles_pk PRIMARY KEY (vehicle_id)
);

CREATE TABLE Customers
(
    customer_id NUMBER NOT NULL,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) NOT NULL UNIQUE,
    phone_number VARCHAR2(15) NOT NULL UNIQUE,
    street_address VARCHAR2(100) NOT NULL,
    city VARCHAR2(50) NOT NULL,
    state CHAR(2) NOT NULL,
    zip_code VARCHAR2(10) NOT NULL,
CONSTRAINT customers_pk PRIMARY KEY (customer_id)
);

CREATE TABLE Dealerships
(
    dealership_id NUMBER NOT NULL,
    name VARCHAR2(100) NOT NULL,
    street_address VARCHAR2(100) NOT NULL,
    city VARCHAR2(50) NOT NULL,
    state CHAR(2) NOT NULL,
    ip_code VARCHAR2(10) NOT NULL,
    phone_number VARCHAR2(15) NOT NULL UNIQUE,
    CONSTRAINT dealerships_pk PRIMARY KEY (dealership_id)
);

CREATE TABLE Insurance
(
    insurance_id NUMBER NOT NULL,
    policy_number VARCHAR2(50) NOT NULL UNIQUE,
    coverage_type VARCHAR2(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    price NUMBER(10,2) NOT NULL,
    vehicle_id NUMBER NOT NULL,
    CONSTRAINT insurance_pk PRIMARY KEY (insurance_id),
    CONSTRAINT insurance_vehicle_fk FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id)
);

CREATE TABLE Car_inventory
(
    car_inventory_id NUMBER NOT NULL,
    vehicle_id NUMBER NOT NULL,
    dealership_id NUMBER NOT NULL,
    purchasing_cost NUMBER(10,2) NOT NULL,
    quantity NUMBER NOT NULL,
    CONSTRAINT car_inventory_pk PRIMARY KEY (car_inventory_id),
    CONSTRAINT car_inventory_vehicle_fk FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),
    CONSTRAINT car_inventory_dealership_fk FOREIGN KEY (dealership_id) REFERENCES Dealerships(dealership_id)
);

CREATE TABLE Dp_employees
(
    employee_id NUMBER NOT NULL,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) NOT NULL UNIQUE,
    phone_number VARCHAR2(15) NOT NULL UNIQUE,
    job_title VARCHAR2(50) NOT NULL,
    dealership_id NUMBER NOT NULL,
    CONSTRAINT dp_employees_pk PRIMARY KEY (employee_id),
    CONSTRAINT dp_employees_dealership_fk FOREIGN KEY (dealership_id) REFERENCES Dealerships(dealership_id)
);

CREATE TABLE Sales
(
    sale_id NUMBER NOT NULL,
    customer_id NUMBER NOT NULL,
    car_inventory_id NUMBER NOT NULL,
    employee_id NUMBER NOT NULL,
    sale_date DATE NOT NULL,
    price_paid NUMBER (10,2) NOT NULL,
    CONSTRAINT sales_pk PRIMARY KEY (sale_id),
    CONSTRAINT sales_customer_fk FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    CONSTRAINT sales_car_inventory_fk FOREIGN KEY (car_inventory_id) REFERENCES Car_inventory(car_inventory_id),
    CONSTRAINT sales_employee_fk FOREIGN KEY (employee_id) REFERENCES Dp_employees(employee_id)
);