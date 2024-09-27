# CTEs (common table expressions)
-- A CTE allows you to define a subquery block that can be referenced within the main query. 
-- It is particularly useful for recursive queries or queries that require referencing a higher level.
-- With - name CTE - as - within the parenthesis we build our subquery/table we want.

with cte_example as 
(
SELECT gender, SUM(salary) sum_sal, MIN(salary) as min_sal,
 MAX(salary) as max_sal, COUNT(salary) as count_sal, AVG(salary) as avg_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
select * 
from cte_example;

with cte_example as 
(
SELECT gender, SUM(salary) sum_sal, MIN(salary) as min_sal,
 MAX(salary) as max_sal, COUNT(salary) as count_sal, AVG(salary) as avg_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
-- directly after using it we can query the cte.
select avg(avg_sal)
from cte_example;

select avg(avg_sal)
from cte_example; 
-- error - it won't work because cte_example table doesn't exist.

-- using subquery
select avg(avg_sal)
from 
(SELECT gender, SUM(salary) sum_sal, MIN(salary) as min_sal,
 MAX(salary) as max_sal, COUNT(salary) as count_sal, AVG(salary) as avg_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
) as agg_table;

-- create multiple ctes with just one with expression.
with cte_example as 
(
SELECT employee_id, gender,birth_date
FROM employee_demographics dem
where birth_date > '1985-01-01'
),
cte_example2 as
( 
select employee_id, salary
from employee_salary
where salary >50000
)
select *
from cte_example
join cte_example2
	on cte_example.employee_id = cte_example2.employee_id
;

-- rename column names in the cte.
with cte_example(gender, SUM_sal, MIN_sal, MAX_sal, COUNT_sal, AVG_sal) as 
(
SELECT gender, SUM(salary) sum_sal, MIN(salary) as min_sal,
 MAX(salary) as max_sal, COUNT(salary) as count_sal, AVG(salary) as avg_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
select * 
from cte_example;

with cte_example(gender, SUM_sal, MIN_sal, MAX_sal, COUNT_sal, AVG_sal) as 
(
SELECT gender, SUM(salary), MIN(salary), MAX(salary), COUNT(salary), AVG(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
select * 
from cte_example;









