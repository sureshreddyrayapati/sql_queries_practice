CREATE TABLE Officers (
    Id INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    HireDate DATE,
    Email VARCHAR(100)
);

EXEC sp_rename 'Officers', 'Officers';

INSERT INTO Officers(Id, Name, Department, Salary, HireDate, Email) VALUES
(1, 'Amit', 'IT', 60000, '2022-01-10', 'amit@gmail.com'),
(2, 'Ravi', 'HR', 45000, '2021-03-15', 'ravi@gmail.com'),
(3, 'Sita', 'IT', 70000, '2020-07-20', 'sita@gmail.com'),
(4, 'John', 'Finance', 55000, '2019-11-05', 'john@gmail.com'),
(5, 'Priya', 'IT', 40000, '2023-02-12', 'priya@gmail.com'),
(6, 'Kiran', 'HR', 52000, '2022-06-18', 'kiran@gmail.com'),
(7, 'Neha', 'Sales', 65000, '2021-09-25', 'neha@gmail.com'),
(8, 'Arjun', 'Sales', 48000, '2020-12-30', 'arjun@gmail.com'),
(9, 'Meena', 'Finance', 75000, '2018-08-14', 'meena@gmail.com'),
(10, 'Raj', 'IT', 80000, '2017-05-21', 'raj@gmail.com'),

(11, 'Vikas', 'Sales', 72000, '2022-04-11', 'vikas@gmail.com'),
(12, 'Anita', 'HR', 39000, '2023-01-19', 'anita@gmail.com'),
(13, 'Rahul', 'Finance', 58000, '2021-07-07', 'rahul@gmail.com'),
(14, 'Sneha', 'IT', 62000, '2020-10-01', 'sneha@gmail.com'),
(15, 'Pooja', 'Sales', 51000, '2019-03-23', 'pooja@gmail.com'),
(16, 'Manoj', 'HR', 61000, '2018-09-09', 'manoj@gmail.com'),
(17, 'Deepak', 'IT', 55000, '2022-11-11', 'deepak@gmail.com'),
(18, 'Kavya', 'Finance', 47000, '2023-06-06', 'kavya@gmail.com'),
(19, 'Ramesh', 'Sales', 68000, '2021-02-02', 'ramesh@gmail.com'),
(20, 'Asha', 'HR', 53000, '2020-04-04', 'asha@gmail.com');
--total Officers in each group
Select Department, count(*) As TotalOfficers
from Officers
group by Department;


select * from Officers;
--Departments with >5 Officers

select Department, count(*) As TotalOfficers
from Officers
group by Department
having count(*)>5;

--High salary Officers per department

select Department, count(*) As TotalEmployes
from Officers
where Salary>50000
group by Department
having count(*)>2;

--2nd hightst salary

select e1.Department, max(e1.Salary) As SecondHighestSalary
from Officers e1
where Salary<(Select max(Salary) from Officers e2 where e2.Department=e1.Department)
group by e1.Department;


select Department, Salary
from(
    Select Department,Salary,DENSE_RANK() 
    OVER(PARTITION BY Department order by Salary DESC) as  rnk
    from Officers) temp
where rnk=2;
--Officers earning more than their department average

select Name,Department, Salary
from Officers e1
where Salary>(select Avg(Salary) from Officers e2 where e2.Department=e1.Department);

select Name,Department, Salary
from(select *, AVG(Salary) over( partition by Department ) as Avgsal
    from Officers) t

where Salary>Avgsal;




--Officers who earn the highest salary in their department
SELECT Department, Salary
 from(select Department, Salary, DENSE_RANK()
      over(partition by Department order by Salary DESC) as rak
      from Officers
      ) t

where rak=1;

SELECT Name,Department, Salary
from
 (
    select Name,Department, Salary, ROW_NUMBER()
      over(partition by Department order by Salary DESC) as rak
      from Officers) t
where rak<=2;


--Employees Above Department Average

select Name, Department
from Officers o
where Salary >(select AVG(Salary) from Officers e where e.Department=o.Department);



