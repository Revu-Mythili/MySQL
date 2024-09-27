# WINDOWS FUNCTIONS 
-- windows functions are really powerful and are somewhat like a group by
-- group by - roll everything up into 1 row when grouping.
-- windows functions - they don't roll everything up into 1 row when grouping. 
-- windows functions allow us to look at a partition or a group, but they each keep their own unique rows in the output.
-- we will also look at things like Row Numbers, rank, and dense rank.

select gender, avg(salary) as avg_salary
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender
;

select gender, ROUND(AVG(salary),1)
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender
;

select dem.first_name, dem.last_name, gender, avg(salary) as avg_salary
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by dem.first_name, dem.last_name, gender
;

-- window function
select dem.employee_id, gender, avg(salary) over()
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
;
-- now we can add any columns and it works. We could get this exact same output with a subquery in the select statement,
-- but window functions have a lot more functionality.

select dem.employee_id, gender, avg(salary) over(partition by gender)
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
;
-- if we use partition it's kind of like the group by except it doesn't roll up - it just partitions or breaks based on a column when doing the calculation.

select dem.employee_id, gender, avg(salary) over(partition by gender order by gender desc)
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
;

-- partion 1 (female) every row in this PARTITION has gender value female - sort them asc or desc makes no difference.

select dem.employee_id, gender, avg(salary) over(partition by gender)
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
order by gender desc
;

-- now if we wanted to see what the salaries were for genders we could do that by using sum, but also we could use order by to get a rolling total
select dem.first_name, dem.last_name, gender, sum(salary) over(partition by gender)
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
;

select dem.employee_id, dem.first_name, dem.last_name, gender, salary, 
sum(salary) over(partition by gender order by dem.employee_id) as rolling_total
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
;

select dem.employee_id, dem.first_name, dem.last_name, gender, salary, 
sum(salary) over(order by dem.employee_id) as rolling_total
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
;

-- row number
select dem.employee_id, dem.first_name, dem.last_name, gender, salary, 
row_number() over(partition by gender)
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
;

select dem.employee_id, dem.first_name, dem.last_name, gender, salary, 
row_number() over(partition by gender order by salary desc) as row_num
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
;

-- rank 
select dem.employee_id, dem.first_name, dem.last_name, gender, salary, 
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) as rank_num
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
;

-- dense rank 
select dem.employee_id, dem.first_name, dem.last_name, gender, salary, 
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) as rank_num,
dense_rank() over(partition by gender order by salary desc) as rank_num
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
;

-- row number - unique sequential number over partition
-- rank - notice rank repeats on tom and jerry at 5, but then skips 6 to go to 7 - based on positional rank
-- dense rank - this is numerically ordered 







