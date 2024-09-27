-- WHERE CLAUSE
# where clause is used to filter records (rows of data) and extract only those records that fulfill a specified condition. It effect the rows, not the columns.

# conditional operators 
SELECT * 
FROM parks_and_recreation.employee_salary
WHERE first_name = 'tom'
;

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary > 50000
;

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000
;

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary < 50000
;

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary <= 50000
;

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE gender = 'female'
;

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE gender != 'female'
;

# yyyy-mm-dd - default date format
SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
;

# logical operators AND, OR, NOT
SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'male'
;

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
OR gender = 'male'
;

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'male'
;

# PEMDAS applies to logical operators also.
SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE (first_name = 'leslie' AND age = 44) OR age > 55
;

# like statement - two special characters - % (anything) and _ (a specific value).
SELECT * 
FROM parks_and_recreation.employee_salary
WHERE first_name LIKE 'a%'
;

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE first_name LIKE '%i%'
;

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE first_name LIKE '%s'
;

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE first_name LIKE 'je%'
;

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE first_name LIKE '%er%'
;

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE first_name LIKE '%ry'
;

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE first_name LIKE 'a__'
;

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE first_name LIKE '__m'
;

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE first_name LIKE '__ri_'
;

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE first_name LIKE 'a__%'
;
# output - april, ann, andy

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE first_name LIKE '%i_'
;

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE first_name LIKE '_a%'
;

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE birth_date LIKE '1962%'
;

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE first_name LIKE 't_'
;
# no employee has that name










