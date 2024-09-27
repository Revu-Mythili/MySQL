-- LIMIT 
# limit - specify how many rows you want in the output.

select *
from parks_and_recreation.employee_demographics
LIMIT 5
;

select *
from parks_and_recreation.employee_demographics
ORDER BY age
LIMIT 5
;

select *
from parks_and_recreation.employee_demographics
ORDER BY age
;

# position, how many rows after that
select *
from parks_and_recreation.employee_demographics
ORDER BY age
LIMIT 2, 2
;
# start at position 2 and take 2 rows after that

-- ALIASING  
# change or give new name to a column. (temporary name)
SELECT gender, AVG(age) AS avg_age
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;

# as is optional, we can write it without as
SELECT gender, AVG(age) avg_age
FROM parks_and_recreation.employee_demographics
GROUP BY gender
HAVING avg_age > 40
;