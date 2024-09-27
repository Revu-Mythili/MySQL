-- GROUP BY
# group rows that have same values in the specified columns (return unique values). 
# in group by statement, select columns that are part of grouping or use aggregate functions on other columns.

SELECT gender
FROM parks_and_recreation.employee_demographics
;

SELECT gender
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;

SELECT AVG(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;

SELECT first_name
FROM employee_demographics
GROUP BY gender
;
# error - select column that is not in group by clause or not used in aggregate function.

SELECT occupation
FROM employee_salary
GROUP BY occupation
;
# there is only one office manager row

# when we group by 2 columns we now have a row for both office manager because salary is different.
SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary
;

# aggregate functions
SELECT gender, AVG(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age), SUM(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;

-- ORDER BY 
# The order by keyword is used to sort the result-set in ascending (ASC) (by default) or descending order (DESC).

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY first_name 
;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY first_name ASC
;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY first_name DESC
;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY gender
;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY gender, age
;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY gender, age DESC
;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY age, gender
;
# order - by age but not gender 
# order of column is also important in MySQL

# column position instead of column name
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY 5, 4
;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY 5 DESC, 4 ASC;
# best practice - use column names, if columns are added or replaced in this table, it will still use same column position to order on.



