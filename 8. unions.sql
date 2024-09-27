# UNIONS 
-- A union is how you can combine rows together not columns.
-- Now you should keep it the same kind of data otherwise if you start mixing it would be really confusing, but you can do it.
-- Let's try it out and use Union to bring together some random data, then we will look at an actual use case.

select age, gender
from employee_demographics
union
select first_name, last_name 
from employee_salary
;
-- So you can see we basically combined the data together, but not side by side in different columns, but one on top of the other in the same columns.
-- This obviously is not good since you're mixing data, but it can be done if you want.

select first_name, last_name 
from employee_demographics
union
select first_name, last_name 
from employee_salary
;
-- it gets rid of duplicates. Union is actually shorthand for Union Distinct.

select first_name, last_name 
from employee_demographics
union distinct
select first_name, last_name 
from employee_salary
;

-- we can use UNION ALL to show all values
select first_name, last_name 
from employee_demographics
union all
select first_name, last_name 
from employee_salary
;

-- Now Let's actually try to use UNION
-- The Parks department is trying to cut their budget and wants to identify older employees they can push out or high paid employees who they can reduce pay or push out.
select first_name, last_name, 'old' as label
from employee_demographics
where age > 40
union
select first_name, last_name, 'highly paid' as label
from employee_salary
where salary >= 70000
;

select first_name, last_name, 'old man' as label
from employee_demographics
where age > 40 and gender = 'male'
union
select first_name, last_name, 'old lady' as label
from employee_demographics
where age > 40 and gender = 'female'
union
select first_name, last_name, 'highly paid' as label
from employee_salary
where salary >= 70000
order by first_name
;





