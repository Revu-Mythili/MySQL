-- HAVING VS WHERE 
-- both were created to filter rows, but they filter 2 separate things:
-- where is going to filters rows before grouping.
-- having is going to filter groups after grouping.

# filter on the avg age using where
SELECT gender, AVG(age)
FROM parks_and_recreation.employee_demographics
WHERE AVG(age) > 40
GROUP BY gender
;
# error - where comes before the group by, you can't filter on data that hasn't been grouped yet.

# having and order by comes after group by 
SELECT gender, AVG(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

# both where and having
SELECT occupation, AVG(salary)
FROM parks_and_recreation.employee_salary
GROUP BY occupation
;
# 50000 and 60000 avg 55000

SELECT occupation, AVG(salary)
FROM parks_and_recreation.employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
;

SELECT occupation, AVG(salary)
FROM parks_and_recreation.employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000
;
