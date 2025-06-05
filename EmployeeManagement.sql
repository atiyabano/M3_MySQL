create database employee_management;
use employee_management;
create table employee(
employeeId int auto_increment primary key,
ename varchar(50),
department varchar(50),
salary decimal (10,2),
hire_date date,
created_at timestamp default current_timestamp
);

insert into employee ( ename, department, salary, hire_date)
values  
('Priya', 'HR', 150000.00, '2025-02-01'),
('Atiya', 'IT', 450000.00, '2024-11-10'),
('Antima', 'sales', 55000.00, '2024-12-23'),
('Prince', 'technical', 500000.00, '2024-10-06');
select * from employee;

create view employeesview as 
select employeeid, ename, salary
from employee
where salary>100000;
select * from employeesview;
select * from employeesview where employeeid = 4;

-- create a stored procedure_________________________
delimiter $$
create procedure myprocedure(in dept_name varchar (50))
begin 
select employeeid, ename, salary
from employee
where department = dept_name;
end$$
delimiter ;

call myprocedure('HR');
call myprocedure('IT');
call myprocedure('sales');
call myprocedure('Technical');

-- create Function to calculate Average salary
delimiter $$
create function averagesalary()
returns decimal(10.2)
deterministic
begin
	declare avg_salary decimal(10,2);
    select avg(salary) into avg_salary from employee;
    return avg_salary;
end $$
delimiter ;

select averagesalary() as average_salary;

-- createindex ________________
create index idx_department on employee (department);
create index idx_salary on employee (salary);

show index from employee;

explain select * from employee where department = 'technical';