# SUBQUERIES
-- queries within queries.
-- employees who actually work in the Parks and Rec Department, we could join tables together or we could use a subquery.

select * 
from employee_demographics
where employee_id in 
					(select employee_id 
						from employee_salary 
								where dept_id = 1)
;

select * 
from employee_demographics
where employee_id in 
					(select employee_id, dept_id
						from employee_salary 
								where dept_id = 1)
;
-- error : in - operator, select employee_id, dept_id from employee_salary where dept_id = 1 - operand (must contain 1 column)

-- We can also use subqueries in the select and the from statements.

-- look at the salaries and compare them to the average salary
SELECT first_name, salary, AVG(salary)
FROM employee_salary;
-- if we run this it's not going to work, we are using columns with an aggregate function so we need to use group by.
-- if we do that - we don't exactly get what we want.

SELECT first_name, salary, AVG(salary)
FROM employee_salary
GROUP BY first_name, salary;
-- its giving average PER GROUP which we don't want

select avg(salary) 
from employee_salary;
-- without using group by we can use aggregate functions (only aggregate function, no other columns in select list)

select first_name, salary, 
(select avg(salary) 
from employee_salary) as avg_salary
from employee_salary
;

select gender, avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender;
-- it's almost like we are creating a small table we are querying off.

select * from
(select gender, avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender);
# error- every derived table must have its own alias (name).

select * from
(select gender, avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender) as agg_table;

select avg(`max(age)`) from
(select gender, avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender) as agg_table;
# error will show if we dont use ` `(back tick) because age column in field list is unknown

select avg(max_age) from
(select gender, 
avg(age) as avg_age,
max(age) as max_age, 
min(age) as min_age, 
count(age) as count_age
from employee_demographics
group by gender) as agg_table;
# after aliasing we dont need to use ` ` instead use alias name


