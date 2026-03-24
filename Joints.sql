
CREATE TABLE Departments (
    Id INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Employees (
    Id INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentId INT,
    Salary INT,
    ManagerId INT NULL,

    CONSTRAINT FK_Employee_Department
    foreign key (DepartmentId) References Departments(Id)
    ON DELETE CASCADE,

    CONSTRAINT FK_Employee_Manager
    foreign key (ManagerId) references Employees(Id) 
);
 INSERT INTO Departments (Id, DepartmentName) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Sales'),
(4, 'Finance'),
(5, 'Admin');

INSERT INTO Employees (Id, Name, DepartmentId, Salary, ManagerId) VALUES
(1, 'Amit', 1, 60000, 5),
(2, 'Ravi', 2, 45000, 6),
(3, 'Sita', 1, 70000, 5),
(4, 'John', 4, 55000, 9),
(5, 'Priya', 1, 90000, NULL),
(6, 'Kiran', 2, 80000, NULL),
(7, 'Neha', 3, 65000, 11),
(8, 'Arjun', 3, 48000, 11),
(9, 'Meena', 4, 95000, NULL),
(10, 'Raj', 1, 80000, 5),

(11, 'Vikas', 3, 88000, NULL),
(12, 'Anita', 2, 39000, 6),
(13, 'Rahul', 4, 58000, 9),
(14, 'Sneha', 1, 62000, 5),
(15, 'Pooja', 3, 51000, 11),
(16, 'Manoj', 2, 61000, 6),
(17, 'Deepak', 1, 55000, 5),
(18, 'Kavya', 4, 47000, 9),
(19, 'Ramesh', 3, 68000, 11),
(20, 'Asha', 2, 53000, 6);

--inner join
 select e.Name,d.DepartmentName
 from Employees e
 inner join Departments d on e.DepartmentId=d.Id;

 --left join
select e.Name,d.departmentName
from Employees e
left join Departments d on e.DepartmentId=d.Id


--right join
select d.departmentName
from Employees e
right join Departments d on e.DepartmentId=d.Id

--full join
select e.Name,d.departmentName
from Employees e
full join Departments d on e.DepartmentId=d.Id;

--

select d.departmentName
from Departments d
left join Employees e on d.Id=e.DepartmentId
where e.Id is null;

select e.Name as Employe,d.Name as Manager
from Employees e
left join Employees d on e.ManagerId=d.Id;

--employees earning less than their manager

select e.Name as Employe ,e.Salary as EmployeeSalary, d.Name as Manger ,d.Salary as ManagerSalary
from Employees e
left join Employees d on e.ManagerId=d.Id
where e.Salary<d.Salary;

select m.Name as Manager ,count(*) as EmployeeCount
from Employees e
join Employees m on e.ManagerId=m.Id
group by m.Name
having count(*)>=3;