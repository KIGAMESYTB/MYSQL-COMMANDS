-- create database
create database CommandMySQL;

-- create table
create table CommandMySQL.Users(

	id bigint not null primary key auto_increment,
	name NVARCHAR(255),
	enabled bool,
	_date datetime
);

-- insert in the table
insert into CommandMySQL.Users(name, enabled, _date)
values ("KIGAMES", true, now());

-- select in the table
select id, name, enabled, _date from CommandMySQL.Users;

-- update in the table
update CommandMySQL.Users set name = "CHRIS" where id = 1;

-- delete in the table
delete from CommandMySQL.Users where id = 1;


-- ------------ --
--   TRIGGERS   --
-- ------------ --
-- create trigger insert 
create trigger users_insert_trigger
before insert 
on CommandMySQL.Users for each row 
begin 
	set 
	new._date = now();
end;


-- create trigger update 
create trigger users_update_trigger
before update
on CommandMySQL.Users for each row 
begin 
	set 
	new._date = now();
end;

-- ------------- --
--   Procedure   --
-- ------------- --

-- create procedure
create procedure InsertAndSelectTableUsers(x_name NVARCHAR(255), x_enabled bool)
begin
	insert CommandMySQL.Users(name, enabled)
	values (x_name, x_enabled);
	select id, name, enabled, _date from CommandMySQL.Users;
end;

-- call procedure 
call InsertAndSelectTableUsers("KIGAMES", false);
call InsertAndSelectTableUsers("CHRIS", TRUE);

-- -------- --
--   VIEW   --
-- -------- --

-- create view
create view users_view as (select name from CommandMySQL.Users);

-- call view 
select * from users_view;

-- ---------- --
--   SEARCH   --
-- ---------- --

select * from commandmysql.users;

-- command like --
select * from commandmysql.users where name like "%KIG%" and enabled = false;



































































































































	





















































