CREATE SCHEMA company;

CREATE TABLE company.employees (
    EmployeelD VARCHAR(10) PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Gender VARCHAR(20),
    Department VARCHAR(100),
    HireDate DATE,
    Salary DECIMAL(10, 2)
);

INSERT INTO
    company.employees (
        EmployeelD,
        FirstName,
        LastName,
        Gender,
        Department,
        HireDate,
        Salary
    )
VALUES (
        '1',
        'John',
        'Doe',
        'Male',
        'IT',
        '2018-05-01',
        60000.00
    ),
    (
        '2',
        'Jane',
        'Smith',
        'Female',
        'HR',
        '2019-06-15',
        50000.00
    ),
    (
        '3',
        'Michael',
        'Johnson',
        'Male',
        'Finance',
        '2017-03-10',
        75000.00
    ),
    (
        '4',
        'Emily',
        'Davis',
        'Female',
        'IT',
        '2020-11-20',
        70000.00
    ),
    (
        '5',
        'Sarah',
        'Brown',
        'Female',
        'Marketing',
        '2016-07-30',
        45000.00
    ),
    (
        '6',
        'David',
        'Wilson',
        'Male',
        'Sales',
        '2019-01-05',
        55000.00
    ),
    (
        '7',
        'Chris',
        'Taylor',
        'Male',
        'IT',
        '2022-02-25',
        65000.00
    );

CREATE TABLE company.products (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(100),
    Price DECIMAL(10, 2),
    Stock INT
);

INSERT INTO
    company.products (
        ProductID,
        ProductName,
        Category,
        Price,
        Stock
    )
VALUES (
        '1',
        'Laptop',
        'Electronics',
        1200.00,
        30
    ),
    (
        '2',
        'Desk',
        'Furniture',
        300.00,
        50
    ),
    (
        '3',
        'Chair',
        'Furniture',
        150.00,
        200
    ),
    (
        '4',
        'Smartphone',
        'Electronics',
        800.00,
        75
    ),
    (
        '5',
        'Monitor',
        'Electronics',
        250.00,
        40
    ),
    (
        '6',
        'Bookshelf',
        'Furniture',
        100.00,
        60
    ),
    (
        '7',
        'Printer',
        'Electronics',
        200.00,
        25
    );

CREATE TABLE company.sales (
    SaleID VARCHAR(10) PRIMARY KEY,
    ProductID VARCHAR,
    EmployeelD VARCHAR,
    SaleDate DATE,
    Quantity INT,
    Total DECIMAL(10, 2),
    FOREIGN KEY (ProductID) REFERENCES company.products (ProductID),
    FOREIGN KEY (EmployeelD) REFERENCES company.employees (EmployeelD)
);

INSERT INTO
    company.sales (
        SaleID,
        ProductID,
        EmployeelD,
        SaleDate,
        Quantity,
        Total
    )
VALUES (
        '1',
        '1',
        '1',
        '2021-01-15',
        2,
        2400.00
    ),
    (
        '2',
        '2',
        '2',
        '2021-03-22',
        1,
        300.00
    ),
    (
        '3',
        '3',
        '3',
        '2021-05-10',
        4,
        600.00
    ),
    (
        '4',
        '4',
        '4',
        '2021-07-18',
        3,
        2400.00
    ),
    (
        '5',
        '5',
        '5',
        '2021-09-25',
        2,
        500.00
    ),
    (
        '6',
        '6',
        '6',
        '2021-11-30',
        1,
        100.00
    ),
    (
        '7',
        '7',
        '1',
        '2022-02-15',
        1,
        200.00
    ),
    (
        '8',
        '1',
        '2',
        '2022-04-10',
        1,
        1200.00
    ),
    (
        '9',
        '2',
        '3',
        '2022-06-20',
        2,
        600.00
    ),
    (
        '10',
        '3',
        '4',
        '2022-08-05',
        3,
        450.00
    ),
    (
        '11',
        '4',
        '5',
        '2022-10-11',
        1,
        800.00
    ),
    (
        '12',
        '5',
        '6',
        '2022-12-29',
        4,
        1000.00
    );

-- 1.Select all columns from the Employees table.
SELECT * FROM company.employees;

-- 2. Select the first names of all employees.
SELECT e.firstname FROM company.employees e;

-- 3. Select distinct departments from the Employees table.
SELECT DISTINCT(e.department) FROM company.employees e;

-- 4. Select the total number of employees.
SELECT COUNT(*) FROM company.employees;

-- 5. Select the total salary paid to all employees.
SELECT SUM(e.salary) FROM company.employees e;

-- 6. Select the average salary of all employees.
SELECT AVG(e.salary) FROM company.employees e;

-- 7. Select the highest salary in the Employees table.
SELECT MAX(e.salary) FROM company.employees e;

-- 8. Select the lowest salary in the Employees table.
SELECT MIN(e.salary) FROM company.employees e;

-- 9. Select the total number of male employees.
SELECT COUNT(*) FROM company.employees e WHERE e.gender = 'Male';

-- 10. Select the total number of female employees.
SELECT COUNT(*) FROM company.employees e WHERE e.gender = 'Female';

-- 11. Select the total number of employees hired in the year 2020.
SELECT COUNT(*)
FROM company.employees e
WHERE e.hiredate BETWEEN '2020-01-01' AND '2020-12-31'

-- 12. Select the average salary of employees in the 'IT' department.
SELECT AVG(e.salary) FROM company.employees e WHERE e.department = 'IT';

-- 13. Select the number of employees in each department.
SELECT COUNT(*) AS no_of_employees, e.department
FROM company.employees e
GROUP BY
    e.department;

-- 14. Select the total salary paid to employees in each department.
SELECT
    SUM(e.salary) as total_per_department,
    e.department
FROM company.employees e
GROUP BY
    e.salarydepartment;

-- 15. Select the maximum salary in each department.
SELECT
    MAX(e.salary) as highest_per_department,
    e.department
FROM company.employees e
GROUP BY
    e.department;

-- 16. Select the minimum salary in each department.
SELECT
    MIN(e.salary) as lowest_per_department,
    e.department
FROM company.employees e
GROUP BY
    e.department;

-- 17. Select the total number of employees, grouped by gender.
SELECT count(*) AS no_of_employees, gender
FROM company.employees e
GROUP BY
    e.gender;

-- 18. Select the average salary of employees, grouped by gender.
SELECT AVG(e.salary) AS average_salary, e.gender
FROM company.employees e
GROUP BY
    e.gender;

-- 19. Select the top 5 highest-paid employees.
SELECT e.firstname, e.lastname, e.salary
from company.employees e
ORDER BY e.salary DESC
LIMIT 5;

-- 20. Select the total number of unique first names in the Employees table.
SELECT COUNT(DISTINCT (e.firstname)) as no_of_unique_names
FROM company.employees e;

-- 21. Select all employees and their corresponding sales
SELECT company.employees.employeeld, company.sales.total
FROM company.sales
    INNER JOIN company.employees ON company.sales.employeeld = company.employees.employeeld;
-- GROUP BY company.employees.employeeld, company.sales.saleid, company.employees.firstname;

-- 22. Select the first 10 employees hired, ordered by their HireDate.
SELECT * FROM company.employees e ORDER BY e.hiredate LIMIT 10;

-- 23. Select the employees who have not made any sales.
SELECT *
FROM company.employees e
WHERE
    e.employeeld NOT IN e.employeeld;

-- 24. Select the total number of sales made by each employee.
SELECT SUM(s.total) as total_sales, s.employeeld
FROM company.sales s
GROUP BY
    s.employeeld;
-- 25. Select the employee who made the highest total sales.
SELECT e.firstname, e.lastname, SUM(s.total) AS total_sales
FROM company.sales s
    JOIN company.employees e ON s.employeeld = e.employeeld
GROUP BY
    e.firstname,
    e.lastname
ORDER BY total_sales DESC
LIMIT 1;

-- 26. Select the average quantity of products sold by employees in each department.
SELECT e.department, AVG(quantity)
FROM company.employees e
    JOIN company.sales s ON s.employeeld = e.employeeld
GROUP BY
    department;

-- 27. Select the total sales made by each employee in the year 2021.
SELECT EXTRACT(
        YEAR
        FROM s.saledate
    ) AS sales_date, SUM(s.total) AS total_sales, e.firstname, e.lastname
FROM company.employees e
    JOIN company.sales s ON s.employeeld = e.employeeld
WHERE
    EXTRACT(
        YEAR
        FROM s.saledate
    ) = 2021
GROUP BY
    e.firstname,
    e.lastname,
    s.saledate;
-- 28. Select the top 3 employees with the most sales in terms of quantity.
SELECT e.firstname, e.lastname, SUM(s.quantity) AS total_quantity
FROM company.employees e
    JOIN company.sales s ON e.employeeld = s.employeeld
GROUP BY
    e.firstname,
    e.lastname;
-- 29. Select the total quantity of products sold by each department.
SELECT e.department, SUM(s.quantity) AS total_quantity
FROM company.employees e
    JOIN company.sales s ON e.employeeld = s.employeeld
GROUP BY
    e.department;
-- 30. Select the total revenue generated by sales of products in each category.
SELECT p.category, SUM(s.total) as total_revenue
FROM company.products p
    JOIN company.sales s ON p.productid = s.productid
GROUP BY
    p.category;