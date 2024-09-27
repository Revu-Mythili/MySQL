# TRIGGERS
-- a Trigger is a block of code that executes automatically executes when an event takes place in a table.
-- for example we have these 2 tables, invoice and payments - when a client makes a payment we want it to update the invoice field "total paid".
-- to reflect that the client has indeed paid their invoice.

select * 
from employee_demographics;

select * 
from employee_salary;

-- after / before
-- new /old

delimiter $$
create trigger employee_insert 
	after insert on employee_salary 
    for each row 
begin
	insert into employee_demographics (employee_id, first_name, last_name)
    values (new.employee_id, new.first_name, new.last_name);
end $$
delimiter ;

insert into employee_salary values (13, 'emma', 'watson', 'actress', 100000, NULL);

select * 
from employee_demographics;

select * 
from employee_salary;

# EVENTS
-- Events are task or block of code that gets executed according to a schedule. Importing data on a schedule. 
-- Scheduling reports to be exported to files and so many other things.
-- you can schedule all of this to happen every day, every monday, every first of the month at 10am. Really whenever you want.
-- This really helps with automation in MySQL.

-- let's say Parks and Rec has a policy that anyone over the age of 60 is immediately retired with lifetime pay.
-- All we have to do is delete them from the demographics table.

select *
from employee_demographics;

delimiter $$
create event delete_retirees
on schedule every 30 second
do 
begin
	delete
    from employee_demographics
    where age>=60;
end $$
delimiter ;

show events;

-- if event didnt work then 
show variables like 'event%';
--  must be on 
-- or
-- edit -> preferences -> sql editor (bottom) -> safe updates - uncheck








