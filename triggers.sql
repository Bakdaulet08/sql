--- TRIGGERS ---
--1--
-- create or replace function fn_notify_student_deleted()
-- returns trigger as $$
-- begin
-- 	raise notice 'student deleted';
-- 	return new;
-- end;
-- $$ language plpgsql;

-- create trigger tr_notify_student_deleted
-- after delete on STUDENT
-- execute function fn_notify_student_deleted();

-- delete from STUDENT where student_id = 3;

--2--
-- create or replace function fn_check_student_first_name()
-- returns trigger as 
-- $$
-- begin
-- 	if NEW.first_name = null or NEW.first_name = '' then
-- 		RAISE EXCEPTION 'First Name cannot be null';
-- 	end if;
-- 	return new;
-- end;
-- $$
-- language plpgsql;

-- create trigger tr_check_student_first_name
-- before insert on STUDENT
-- for each row
-- execute function fn_check_student_first_name();

-- insert into STUDENT (student_id, first_name, last_name, email, department_id)
-- values (10, '', 'Kadrolov', 'kadrol@gmail.com', 1);


-- 3 --
-- create or replace function fn_warn_student_deleted()
-- returns trigger as
-- $$
-- begin
-- 	raise notice 'Student was deleted';
-- 	return old;
-- end;
-- $$ language plpgsql;

-- create or replace trigger tr_warn_student_deleted
-- after delete on STUDENT
-- for each row
-- execute function fn_warn_student_deleted();

-- delete from STUDENT where student_id = 4;


-- 4 --
-- create or replace function fn_log_insert_delete_student()
-- returns trigger as
-- $$
-- begin
-- 	IF (TG_OP = 'INSERT') then
-- 		insert into student_log(student_id, action_type, action_time)
-- 		values (NEW.student_id, 'INSERT', NOW());
-- 		return new;
-- 	ELSIF (TG_OP = 'DELETE') then
-- 		insert into student_log(student_ID, action_typem, action_time)
-- 		values (OLD.student_id, 'DELETE', NOW());
-- 		return OLD;
-- 	END IF;
-- 	return NULL;
-- end;
-- $$ language plpgsql;

-- create trigger tr_log_insert_delete_student
-- after insert or delete on STUDENT
-- for each row
-- execute function fn_log_insert_delete_student();

-- insert into STUDENT (student_id, first_name, last_name, email, department_id)
-- values (10, 'Kadrol', 'Kadrolov', 'kadrol@gmail.com', 1);

-- alter table student_log
-- rename column action_text to action_type;

-- 5 -- 
-- create table email_log(student_id int, prev_email varchar, new_email varchar, time_changed TIMESTAMP);

-- create or replace function fn_email_logging()
-- returns trigger as
-- $$
-- begin
-- 	insert into email_log(student_id, prev_email, new_email, time_changed)
-- 	values (OLD.student_id, OLD.email, NEW.email, NOW());
-- 	return new;
-- end;
-- $$ language plpgsql;

-- create trigger tr_email_logging
-- after update on student
-- for each row
-- execute function fn_email_logging();

-- update STUDENT set email = 'kadrolov@gmail.com' where student_id = 10;

-- select * from email_log;


-- 6 --
-- create table last_modified(student_id int, first_name varchar, modified_time TIMESTAMP);
-- insert into last_modified(student_id, first_name, modified_time)
-- values (null, null, null);

-- create or replace function fn_last_modified()
-- returns trigger as
-- $$
-- begin
-- 	update last_modified set student_id = NEW.student_id, first_name = NEW.first_name, modified_time = NOW();
-- 	return new;
-- end;
-- $$
-- language plpgsql;

-- create trigger tr_last_modified
-- after update on STUDENT
-- for each row
-- execute function fn_last_modified();

-- update STUDENT set email = 'bakdaulet_zh@gmail.com' where student_id = 1;

-- select * from last_modified;