# JOINS 
-- joins allow you to combine 2 tables together (or more) if they have a common column.
-- doesn't mean they need the same column name, but the data in it are the same and can be used to join the tables together.

select * 
from employee_demographics
;

select * 
from employee_salary
;

-- inner join - inner join return rows that are the same in both columns.
-- since we have the same columns we need to specify which table they're coming from.
select * 
from employee_demographics
inner join employee_salary
	on employee_id = employee_id
;

select * 
from employee_demographics
join employee_salary
	on employee_demographics.employee_id = employee_salary.employee_id
;
-- join - by defauly inner join
-- Ron Swanson isn't in the results? This is because he doesn't have an employee id in the demographics table. He refused to give his birth date or age or gender.

select * 
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id
;

select employee_id, age, occupation 
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id
;

select dem.employee_id, age, occupation 
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id
;

# outer joins
-- outer joins we have a left join (left outer join) and a right join (right outer join)
-- a left join will take everything from the left table even if there is no match in the join, but will only return matches from the right table.
-- a right join will take everything from the right table even if there is no match in the join, but will only return matches from the left table.

select *
from employee_demographics as dem
left join employee_salary as sal
	on dem.employee_id = sal.employee_id
;
-- left join it basically just looks like an inner join
-- that's because we are taking everything from the left table and only matches from the right table.

-- we have everything from the right table. Even though there is no match to ron swanson. 
-- Since there is not match on the left table it's just all nulls.
select *
from employee_demographics as dem
right join employee_salary as sal
	on dem.employee_id = sal.employee_id
;

# self join 
-- a self join is where you tie a table to itself.

select *
from employee_salary emp1
join employee_salary emp2
	on emp1.employee_id = emp2.employee_id
;

-- case study - secret santa so the person with the higher ID is the next person's secret santa.
select *
from employee_salary emp1
join employee_salary emp2
	on emp1.employee_id + 1 = emp2.employee_id
;

-- So leslie is Ron's secret santa and so on - Mark Brandanowitz didn't get a secret santa, but he doesn't deserve one because he broke Ann's heart so it's all good.
select emp1.employee_id as emp_santa,
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
emp2.employee_id as employee,
emp2.first_name as first_name,
emp2.last_name as last_name
from employee_salary emp1
join employee_salary emp2
	on emp1.employee_id + 1 = emp2.employee_id
;

# joining multiple table

select *
from parks_departments
;

select *
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id
inner join parks_departments as pd 
	on sal.dept_id = pd.department_id
;
-- since it's an inner join it got rid of andy because he wasn't a part of any department.

select *
from employee_demographics as dem
right join employee_salary as sal
	on dem.employee_id = sal.employee_id
left join parks_departments as pd 
	on sal.dept_id = pd.department_id
;


