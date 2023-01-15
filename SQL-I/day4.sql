'
First exercise

Table: Employees

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| employee_id | int     |
| name        | varchar |
+-------------+---------+
employee_id is the primary key for this table.
Each row of this table indicates the name of the employee whose ID is employee_id.

 

Table: Salaries

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| employee_id | int     |
| salary      | int     |
+-------------+---------+
employee_id is the primary key for this table.
Each row of this table indicates the salary of the employee whose ID is employee_id.

 

Write an SQL query to report the IDs of all the employees with missing information. The information of an employee is missing if:

    The employee's name is missing, or
    The employee's salary is missing.

Return the result table ordered by employee_id in ascending order.

'

select 
  employee_id
from
  Employees
where
  employee_id not in (select employee_id from Salaries)
union

select
  employee_id
from
  Salaries
where
  employee_id not in (select employee_id from Employees)
order by employee_id;

'
Second exercise

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_id  | int     |
| store1      | int     |
| store2      | int     |
| store3      | int     |
+-------------+---------+
product_id is the primary key for this table.
Each row in this table indicates the product's price in 3 different stores: store1, store2, and store3.
If the product is not available in a store, the price will be null in that store's column.

 

Write an SQL query to rearrange the Products table so that each row has (product_id, store, price). If a product is not available in a store, do not include a row with that product_id and store combination in the result table.

Return the result table in any order.

'

SELECT product_id, 'store1' store, store1 price 
FROM Products
where store1 is not null
union
SELECT product_id, 'store2' store, store2 price 
FROM Products
where store2 is not null
union
SELECT product_id, 'store3' store, store3 price 
FROM Products
where store3 is not null;


'
Second exercise

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| p_id        | int  |
+-------------+------+
id is the primary key column for this table.
Each row of this table contains information about the id of a node and the id of its parent node in a tree.
The given structure is always a valid tree.

 

Each node in the tree can be one of three types:

    "Leaf": if the node is a leaf node.
    "Root": if the node is the root of the tree.
    "Inner": If the node is neither a leaf node nor a root node.

Write an SQL query to report the type of each node in the tree.

Return the result table in any order.
'

SELECT DISTINCT t1.id,
    CASE
    WHEN t1.p_id IS NULL THEN 'Root'
    WHEN t1.p_id IS NOT NULL AND t2.id IS NOT NULL THEN 'Inner'
    ELSE 'Leaf'
    END AS Type
FROM tree t1 LEFT JOIN tree t2 ON t1.id = t2.p_id
ORDER BY t1.id;

--- Alternative ---

SELECT Id,
    CASE 
      WHEN p_id IS NULL THEN "Root"
      WHEN (p_id IS NOT NULL AND id IN (SELECT p_id FROM Tree)) THEN "Inner"
      ELSE "Leaf"
    END AS Type
FROM tree;



'
Fourth exercise

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key column for this table.
Each row of this table contains information about the salary of an employee.

 

Write an SQL query to report the second highest salary from the Employee table. If there is no second highest salary, the query should report null.
'

select IFNULL(
(select distinct
    Salary
from
    Employee
order by
    Salary desc
limit
    1, 1), NULL) SecondHighestSalary;