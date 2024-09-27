-- SELECT STATEMENET
# select statement is used to work with columns and specify what columns you want to see in your output.

# select everything
select *
from parks_and_recreation.employee_demographics;

select * 
from parks_and_recreation.employee_salary;

select * 
from parks_and_recreation.parks_departments;

# select specific column
select first_name
from parks_and_recreation.employee_demographics;

# add more columns, seperate them with comma
select first_name, last_name, birth_date
from parks_and_recreation.employee_demographics;

# SQL follows PEMDAS order of operations (parenthesis, exponent, multiplication, division, addition, subtraction)
select first_name, 
last_name, 
birth_date,
age,
age + 10 
from parks_and_recreation.employee_demographics;

select first_name, 
last_name, 
birth_date,
age,
(age + 10) * 10 + 10
from parks_and_recreation.employee_demographics;

# distinct - return only unique values, no duplicates
select gender
from parks_and_recreation.employee_demographics;

select distinct gender
from parks_and_recreation.employee_demographics;

select distinct first_name, 
gender
from parks_and_recreation.employee_demographics;
