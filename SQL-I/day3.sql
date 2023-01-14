'
First exercise

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| user_id        | int     |
| name           | varchar |
+----------------+---------+
user_id is the primary key for this table.
This table contains the ID and the name of the user. The name consists of only lowercase and uppercase characters.

 

Write an SQL query to fix the names so that only the first character is uppercase and the rest are lowercase.

Return the result table ordered by user_id.

The query result format is in the following example.

'

select user_id,
       concat(upper(left(name, 1)), lower(right(name, length(name) - 1))) as name
from Users
group by 1
order by 1;


'
Second exeercise

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| sell_date   | date    |
| product     | varchar |
+-------------+---------+
There is no primary key for this table, it may contain duplicates.
Each row of this table contains the product name and the date it was sold in a market.

 

Write an SQL query to find for each date the number of different products sold and their names.

The sold products names for each date should be sorted lexicographically.

Return the result table ordered by sell_date.

'

select sell_date, count(distinct product) as num_sold,
group_concat(distinct product order by product asc) as products
from Activities
group by sell_date
order by sell_date
;

'
Third exercise

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| patient_id   | int     |
| patient_name | varchar |
| conditions   | varchar |
+--------------+---------+
patient_id is the primary key for this table.
'conditions' contains 0 or more code separated by spaces. 
This table contains information of the patients in the hospital.

Write an SQL query to report the patient_id, patient_name and conditions of the patients who have Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix.

Return the result table in any order.

'

select *
from Patients
where conditions like '% DIAB1%' or 
      conditions like 'DIAB1%'