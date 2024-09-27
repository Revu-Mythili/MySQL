# TEMPORARY TABLES 
-- Temporary tables are tables that are only visible to the session that created them. 
-- They can be used to store intermediate results for complex queries or to manipulate data before inserting it into a permanent table.

-- There's 2 ways to create temp tables:
-- 1. This is the less commonly used way - which is to build it exactly like a real table and insert data into it.

create temporary table temp_table 
(
	first_name varchar(50),
    last_name varchar(50),
    movie varchar(100)
);

select * 
from temp_table;

-- notice that if we refresh out tables it isn't there. It isn't an actual table.

insert into temp_table values
('mythili', 'revu', 'ice age');

select * 
from temp_table;

-- 2. build it by inserting data into it - easier and faster.

select * 
from employee_salary;

create temporary table salary_over_50k
select * 
from employee_salary
where salary >= 50000
;

select * 
from salary_over_50k;
-- temp tables - in session gets deleted after session is over.

-- ctes - simple things one level transformation or one level of advance thing.
-- temp tables - more advance things 




