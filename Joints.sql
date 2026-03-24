
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
 