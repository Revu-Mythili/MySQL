# STRING FUNCTIONS
-- length - length of each value

select length('skyfall');

-- use case - phone numbers 

select first_name, length(first_name)
from employee_demographics
order by 1
;

select first_name, length(first_name)
from employee_demographics
order by 2
;

-- upper and lower
-- upper - all the string characters to upper case.
-- lower - all the string characters to lower case.
--  simplify standardization issues
select upper('sky');
select lower('sky');
select lower('SKY');

select first_name, upper(first_name)
from employee_demographics
order by 2
;

-- trim - if you have values that have white space on the front or end, we can get rid of that white space.
select ('    sky    ');
select trim('    sky    ');
-- if we have white space in the middle it doesn't work
select trim(' i     love     sky ');
-- trimming just the left side
select ltrim('    sky    ');
-- trimming just the right side
select rtrim('    sky    ');

-- Left - take a certain amount of characters from the left hand side.
-- Right - take a certain amount of characters from the right hand side.
select first_name, 
left(first_name, 3),
right(first_name, 2)
from employee_demographics;

-- substring
-- starting point and how many characters you want
select first_name, 
left(first_name, 3),
right(first_name, 2),
substring(first_name, 2, 3),
birth_date,
substring(birth_date, 6, 2) as birth_month
from employee_demographics;

-- replace
select first_name, replace(first_name, 'a', 'z')
from employee_demographics;

-- locate - specify character that we are searching for, it will return the position of that character in the string.
select locate('n', 'alexander');
select locate('a', 'alexander');
-- It will return the location of just the first position.

select first_name, locate('a', first_name)
from employee_demographics;

select first_name, locate('rk', first_name)
from employee_demographics;

-- concat - it will combine the strings together
select first_name, last_name,
concat(first_name,' ',last_name) as full_name
from employee_demographics;


