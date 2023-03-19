CREATE DATABASE employee_mngmnt;

--   creating jobs table

CREATE TABLE jobs(
job_id INT PRIMARY KEY NOT NULL,
job_title VARCHAR(255),
min_salary FLOAT,
max_salary FLOAT,
CONSTRAINT min_salary check (min_salary>1000)
);

-- inserting rows into jobs table 

INSERT INTO jobs VALUES (1,'SDE',20000,100000),
(2,'SDE2', 40000,200000),
(3,'SDE1', 25000,250000),
(4,'SDE3', 55000,550000),
(5,'QA' ,15000,90000)


-- creating  regions  table

CREATE TABLE regions(
    region_id VARCHAR(255) PRIMARY KEY,
    region_name VARCHAR(255)

);

-- inserting rows into regions table
INSERT INTO regions VALUES ('JH','Jharkhand'),
('WB','West Bengal'),
('RJ','Rajasthan'),
('MP','Madhyya Pradesh'),
('BR','Bihar')



--creating countries table

CREATE TABLE countries (
 country_id VARCHAR(255) PRIMARY KEY,
 country_name VARCHAR(255),
 region_id VARCHAR ,
 FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

--inserting rows in countries table

INSERT INTO countries VALUES 
('IN','India','JH'),
('PAK','Pakistan','BR'),
('BAN','Bengladesh','WB'),
('UK','United Kingdom','MP'),
('NP','Nepal','RJ');

--creating locations table

CREATE TABLE locations (
    location_id INT PRIMARY KEY NOT NULL,
    street_address VARCHAR(255),
    postal_code INT(10),
    city VARCHAR(255),
    state_province VARCHAR(255),
    country_id VARCHAR(255)
    FOREIGN KEY (country_id) REFERENCES countries(country_id),
    

);

--inserting rows in locations table

INSERT INTO locations VALUES (101,'Mahatma road',825167,'Dhanbad','Jharkhand','IN'),
 (102,'Park Street',300019,'Kolkata','West Bengal','UK'),
 (103,'Bengladesh street',78638,'Dhaka','Mirpur','BAN'),
 (104,'kath road',825178,'Kathmandu','Nepal state','NP'),
(105,'Jinna street',908167,'Peshawar','Punjab','PAK');

--creating departments table

CREATE TABLE departments(
  department_id VARCHAR(255) PRIMARY KEY ,
  department_name VARCHAR(255),
  location_id INT ,
  FOREIGN KEY (location_id) REFERENCES locations(location_id) 
);

--inserting rows in departments table

INSERT INTO departments VALUES
('d_id1','Tech',101),
('d_id2','Tech',102),
('d_id3','Tester',103),
('d_id4','Accounts',104),
('d_id5','Account',105);

--creating employees table

CREATE TABLE employees(
    employee_id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) ,
    phone_number VARCHAR(255) ,
    hire_date DATE,
    job_id INT,
    slary FLOAT,
    manager_id INT,
    department_id VARCHAR(255),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)

);

--inserting rows in employees

INSERT INTO employees VALUES 
(1001,'Mahfuz','Alam','Mahfuz@kreeti.com','8578877405','2023-02-15',1,15000,1001,'d_id1'),
(1002,'Lokesh','chaman','Lokesh@kreeti.com','9898877405','2023-02-15',2,15000,1002,'d_id2'),
(1003,'Gourav','pareek','Gourav@kreeti.com','9898877404','2023-02-15',3,16000,1003,'d_id3'),
(1004,'Jabra','ram','Jabra@kreeti.com','9998877404','2023-02-15',4,18000,1004,'d_id4'),
(1005,'Sayan','das','Sayan@kreeti.com','9998987404','2022-02-15',5,12000,1005,'d_id5');

--creating table dependents

CREATE TABLE dependents(
 dependent_id INT PRIMARY KEY,
 first_name VARCHAR(255) NOT NULL,
 last_name VARCHAR(255) NOT NULL,
 relationship VARCHAR(255),
 employee_id INT

 FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

--inserting rows in table dependents

INSERT INTO dependents VALUES 
(5001,'person1 fname','person1 lname''brother',1001),
(5002,'person2 fname','person2 lname''brother',1002),
(5003,'person3 fname','person3 lname''brother',1003),
(5004,'person4 fname','person4 lname''brother',1004),
(5005,'person5 fname','person5 lname''brother',1005)

--QUESTION 3
--(a)

ALTER TABLE departments
ADD COLUMN manager_name VARCHAR(255);

--(b)

ALTER TABLE jobs
DROP COLUMN max_salary;

--(c)

ALTER TABLE locations 
RENAME COLUMN postal_code TO pincode;
