# CASE STATEMENTS 
-- A Case Statement allows you to add logic to your Select Statement, sort of like an if else statement in other programming languages.

select first_name, last_name, age,
case
	when age <= 30 then 'young'
end
from employee_demographics
;

-- between includes 31 and 50 
select first_name, last_name, age,
case
	when age <= 30 then 'young'
    when age between 31 and 50 then 'old'
end
from employee_demographics
;

select first_name, last_name, age,
case
	when age <= 30 then 'young'
    when age between 31 and 50 then 'middle age'
    when age >= 50 then 'old age'
end as age_name
from employee_demographics
;

-- use case - Pawnee Council sent out a memo of their bonus and pay increase structure so we need to follow it.
-- < 50000 = 5%
-- > 50000 = 7%
-- finance = 10% bonus
select first_name, last_name, salary,
case
	when salary < 50000 then salary + (salary * 0.05)
end as pay_increase
from employee_salary;

select first_name, last_name, salary,
case
	when salary < 50000 then salary * 1.05
end as pay_increase
from employee_salary;

select first_name, last_name, salary,
case
	when salary < 50000 then salary + (salary * 0.05)
    when salary > 50000 then salary + (salary * 0.07)
end as pay_increase
from employee_salary;
--  tom and jerry was not included in the pay increases, maybe next year.

select * 
from employee_salary;
select * 
from parks_departments;
-- dept_id 6 is finance

select first_name, last_name, salary,
case
	when salary < 50000 then salary * 1.05
    when salary > 50000 then salary * 1.07
end as pay_increase,
case
	when dept_id = 6 then salary * 0.1
end as bonus
from employee_salary;
-- ben is the only one who get's a bonus








