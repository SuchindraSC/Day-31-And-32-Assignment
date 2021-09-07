--UC1
--Creating Database
create database payroll_service

--using created database payroll_service
use payroll_service


--UC2
--Creating Table With Certain Attributes
Create table employee_payroll(Id int identity(1,1) Primary key, Name varchar(50),Salary decimal(12,2) not null,Start Datetime not null)
select * from employee_payroll
exec sp_help employee_payroll


--UC3
--Inserting Values To Tables Under Certain Attributes
insert into employee_payroll(Name, Salary, Start) Values
('Bill','1000000.00','2021-09-03'),
('Terisha','2000000.00','2021-09-03'),
('Charlie','3000000.00','2021-09-04')


--UC4
--Diplaying employee_payroll Table
select * from employee_payroll


--UC5
--Getting Salary Of Individual based on attribute Salary And Sort Employees Based On Start Column
select Salary from employee_payroll where Name = 'bill'
select * from employee_payroll where start between cast('2021-01-01' as date) and getdate()


--UC6
--Creating New Column Named Gender In Table Using Alter Table Operation
Alter table employee_payroll ADD Gender CHAR(1)
select * from employee_payroll

--Updating Gender Column in Table
update employee_payroll set Gender = 'F' where name = 'Terisha'
update employee_payroll set Gender = 'M' where name = 'Bill' or name = 'Charlie'
update employee_payroll set Salary = 3000000.00 where name = 'Terisha'


--UC7
--Doing Some Basinc Operations like MINI, MAX, COUNT AVG
select AVG(Salary) FROM employee_payroll where Gender = 'M'	GROUP BY Gender
select AVG(Salary) FROM employee_payroll GROUP BY Gender
select AVG(Salary) FROM employee_payroll
select Gender, AVG(Salary) FROM employee_payroll GROUP BY Gender
select Gender, COUNT(Name) FROM employee_payroll GROUP BY Gender
select Gender, SUM(Salary) FROM employee_payroll GROUP BY Gender
select Gender, MIN(Salary) FROM employee_payroll GROUP BY Gender
select Gender, MAX(Salary) FROM employee_payroll GROUP BY Gender


--UC8
--Extend Employee_Payroll Table
alter table employee_payroll ADD Phone_Number VARCHAR(250) NULL
alter table employee_payroll ADD Addrss VARCHAR(250) NOT NULL DEFAULT 'TBD'
alter table employee_payroll ADD Department VARCHAR(250) NOT NULL DEFAULT 'NULL'
select * from employee_payroll
exec sp_rename 'employee_payroll.Salary','basic_pay'

--UC9
--Extend Employee_Payroll Table
alter table employee_payroll add Deductions decimal(12,2) not null default 0
alter table employee_payroll add taxable_pay decimal(12,2) not null default 0
alter table employee_payroll add tax decimal(12,2) not null default 0
alter table employee_payroll add net_pay decimal(12,2) not null default 0