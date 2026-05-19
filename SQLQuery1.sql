CREATE DATABASE Company
USE Company
CREATE TABLE Employee(
SSN int PRIMARY KEY,
F_Name varchar(10),
L_Name varchar(10),
gender varchar(8),
Date_of_Birth date,
Supervised_id int,
D_Num int, 
FOREIGN KEY (Supervised_id) REFERENCES Employee(SSN));


CREATE TABLE DEPARTMENT(
Dep_Num int identity(1,1) PRIMARY KEY,
Dep_name varchar(12),
Manager_id int,
Hiring_date date,
FOREIGN KEY (Manager_id) REFERENCES Employee(SSN));


ALTER TABLE Employee
ADD CONSTRAINT FK_EMP_DEP
FOREIGN KEY (D_Num) REFERENCES Department(Dep_Num);


CREATE TABLE Department_Location(
Department_Num int,
loc varchar(100),
PRIMARY KEY(Department_Num, loc),
FOREIGN KEY (Department_Num) REFERENCES Department(Dep_Num)
);


CREATE TABLE Project(
p_number int IDENTITY(100,1) PRIMARY KEY,
p_name varchar(12),
p_location varchar(100),
city varchar(15),
dept_num int,
FOREIGN KEY (dept_num) REFERENCES DEPARTMENT(Dep_Num)
);


CREATE TABLE Dependent(
dependent_name varchar(15),
SSN int,
gender varchar(8) CHECK (GENDER IN ('Male', 'Female')),
date_of_birth date,
FOREIGN KEY (SSN) REFERENCES Employee(SSN)
);


CREATE TABLE WorkingHours(
SSN int,
project_number int,
working_hours decimal(5,2),

PRIMARY KEY(SSN, project_number),
FOREIGN KEY (SSN) REFERENCES Employee(SSN),
FOREIGN KEY (project_number) REFERENCES Project(p_number)
);