-- 1 --
-- create or replace function factorial(n int)
-- returns int as
-- $$
-- begin
-- 	if n<=1 then
-- 		return 1;
-- 	else
-- 		return n * factorial(n-1);
-- 	end if;	
-- end;
-- $$ language plpgsql;

-- select factorial(3);

-- 2 --
-- create or replace function fn_sum_to_n(n INT)
-- returns int as
-- $$
-- begin
-- 	if n <= 1 then
-- 		return 1;
-- 	else 
-- 		return n + fn_sum_to_n(n-1);
-- 	end if;	
-- end;
-- $$ language plpgsql;

-- select fn_sum_to_n(4);

-- 3 --
-- create or replace function fn_power(base int, exponent int)
-- returns int as
-- $$
-- begin
	
-- 	if exponent =0 then
-- 		return 1;
-- 	elsif exponent < 0 then
-- 		return 0;
-- 	else 
-- 		return base * fn_power(base, exponent - 1);
-- 	end if;	
	
-- end;
-- $$ language plpgsql;

-- select fn_power(2, 6);


-- 4 -- 
-- create or replace function fn_reverse_string(str text)
-- returns text as
-- $$
-- begin
-- 	if length(str) <= 1 then
-- 	return str;
-- 	else 
-- 		return right(str, 1) || fn_reverse_string(substring(str, 1, length(str)-1));
-- 	end if;	
-- end;
-- $$ language plpgsql;


-- select fn_reverse_string('Hello');

-- 5 --
-- create or replace function fn_count_char(str text, ch char)
-- returns int as
-- $$
-- begin
-- 	if length(str) <= 1 then
-- 		return 0;
-- 	elsif right(str, 1) = ch then
-- 		return 1 + fn_count_char(left(str, length(str) - 1), ch);
-- 	else 
-- 		return 0 + fn_count_char(left(str, length(str) - 1), ch);
-- 	end if;	
-- end;
-- $$ language plpgsql;

-- select fn_count_char('hello', 'l');

