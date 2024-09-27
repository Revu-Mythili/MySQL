# STORED PROCEDURES

select * 
from employee_salary
where salary >= 50000
;

create procedure large_salaries()
select * 
from employee_salary
where salary >= 50000
;

call large_salaries();

-- writing a stored procedure you don't have a simple query like that, it's usually more complex.
-- if we tried to add another query to this stored procedure it wouldn't work, it's a separate query

-- create procedure large_salaries2()
-- select * from employee_salary where salary >= 50000;
-- select * from employee_salary where salary >= 10000;


-- use a delimiter and a Begin and End to really control what's in the stored procedure.
-- the delimiter(;) is what separates the queries by default, we can change this to something like two $$.
-- When we change this delimiter it now reads in everything as one whole unit or query instead of stopping after the first semi colon.

delimiter $$
create procedure large_salaries2()
begin
	select * 
	from employee_salary
	where salary >= 50000;
	select * 
	from employee_salary
	where salary >= 10000;
end $$
-- now we change the delimiter back after we use it to make it default again.
delimiter ;

call large_salaries2();

-- we can also add parameters
delimiter $$
create procedure large_salaries3(muffin int)
begin
	select salary
	from employee_salary
    where employee_id = muffin;
end $$
delimiter ;
-- where employee_id (table column) = employee_id (parameter)
-- parameter name can be anything like muffin but recommended is employee_id_param / p_employee_id.

call large_salaries3(1)

delimiter $$
create procedure large_salaries4(p_employee_id int)
begin
	select salary
	from employee_salary
    where employee_id = p_employee_id;
end $$
delimiter ;

call large_salaries4(5);




