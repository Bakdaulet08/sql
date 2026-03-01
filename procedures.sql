-- -- 1 --
-- create or replace procedure pr_add_student(int, varchar, varchar, varchar, int)
-- language plpgsql as
-- $$
-- declare p_student_id alias for $1;
-- 		p_first_name alias for $2;
-- 		p_last_name alias for $3;
-- 		p_email alias for $4;
-- 		p_department_id alias for $5 ;
-- begin
-- 	if p_email is null then
-- 		Raise exception 'Email cannot be null';
-- 	end if;		
-- 	insert into student(student_id, first_name, last_name, email, department_id)
-- 	values (p_student_id, p_first_name, p_last_name, p_email,p_department_id);
-- end;
-- $$;

-- call pr_add_student(11, 'John', 'Doe', 'dow@gmail.com', 2);

-- 2 --
-- create or replace procedure update_email(p_student_id int, p_new_email varchar)
-- language plpgsql as
-- $$
-- begin
-- 	if NOT EXISTS(select 1 from student s where s.student_id = p_student_id) then
-- 		RAISE EXCEPTION 'Student doesnt exists';
-- 	end if;
-- 	update student set email = p_new_email where student_id = p_student_id;

-- 	-- commit;
-- end;
-- $$;

-- call update_email(100, 'baha@gmail.com');

-- 3 --
-- create or replace procedure pr_delete_student(p_student_id int)
-- language plpgsql as
-- $$
-- begin
-- 	if EXISTS(select 1 from student where student_id = p_student_id)then
-- 		delete from student where student_id = p_student_id;
-- 	end if;

	
-- end;
-- $$;

-- call pr_delete_student(10);

-- 4 --
-- create or replace procedure increase_by_department(p_department_id int, p_increment int)
-- language plpgsql as
-- $$
-- begin
	
-- 	update course 
-- 	set credits =  case 
-- 		when (credits + p_increment) > 30 then 30
-- 		else credits + p_increment
-- 	end
-- 	where department_id = p_department_id;

-- 	RAISE NOTICE 'Credits updated for department %', p_department_id;
	
-- end;
-- $$;

-- call increase_by_department(1, 5);

-- 5 --
-- create or replace procedure pr_transfer_student(p_student_id int, p_new_department_id int)
-- language plpgsql as
-- $$
-- begin
-- 	update student
-- 	set department_id = case
-- 		when (department_id <> null) then p_new_department_id
		
-- 	end
-- 	where student_id = p_student_id;
-- end;
-- $$;


-- call pr_transfer_student(1, 2);








