--1)
--SET SERVEROUTPUT ON
--DEFINE p_country_id='CA'
--SET VERIFY OFF
--DECLARE TYPE record_type_country is record
--    (country_id CHAR(2), country_name VARCHAR2(50));
--record_country record_type_country;
--v_country_id CHAR(2);
--BEGIN
--	FOR i IN 1..4 LOOP
--        IF i=1 THEN
--            v_country_id := '&p_country_id';
--        ELSIF i=2 THEN
--            v_country_id := 'DE';
--        ELSIF i=3 THEN 
--            v_country_id := 'UK';
--        ELSIF i=4 THEN
--            v_country_id := 'US';
--        END IF;
--    
--	SELECT country_id, country_name
--	INTO record_country.country_id, record_country.country_name
--	FROM countries
--	WHERE country_id = v_country_id;
--	DBMS_OUTPUT.PUT_LINE(record_country.country_id ||' '||record_country.country_name);
--	END LOOP;
--END;
--/

--2)
--SET SERVEROUTPUT ON
--DECLARE TYPE dept_table_type is table of departments.department_name%TYPE
--INDEX BY BINARY_INTEGER;
--my_dept_table dept_table_type;
--v_deptno departments.department_id%TYPE;
--BEGIN
--	FOR i in 1..7 LOOP
--	IF i=1 THEN v_deptno := 10;
--	ELSIF i=2 THEN v_deptno := 20;
--	ELSIF i=3 THEN v_deptno := 50;
--	ELSIF i=4 THEN v_deptno := 60;
--	ELSIF i=5 THEN v_deptno := 80;
--	ELSIF i=6 THEN v_deptno := 90;
--	ELSIF i=7 THEN v_deptno := 110;
--	END IF;
--	SELECT department_name
--	INTO my_dept_table(i)
--	FROM departments
--	WHERE department_id = v_deptno;
--	END LOOP;
--	FOR i in 1..7 LOOP
--		DBMS_OUTPUT.PUT_LINE(my_dept_table(i));
--	END LOOP;
--END;
--/

--alter session set nls_numeric_characters='.,'

--3)
--SET SERVEROUTPUT ON
--DECLARE
--TYPE dept_table_type is table of departments%ROWTYPE
--INDEX BY BINARY_INTEGER;
--my_dept_table dept_table_type;
--v_deptno departments.department_id%TYPE;
--BEGIN
--	FOR i in 1..7 LOOP
--        IF i=1 THEN v_deptno := 10;
--        ELSIF i=2 THEN v_deptno := 20;
--        ELSIF i=3 THEN v_deptno := 50;
--        ELSIF i=4 THEN v_deptno := 60;
--        ELSIF i=5 THEN v_deptno := 80;
--        ELSIF i=6 THEN v_deptno := 90;
--        ELSIF i=7 THEN v_deptno := 110;
--        END IF;
--    
--	SELECT *
--	INTO my_dept_table(i)
--	FROM departments
--	WHERE department_id = v_deptno;
--	END LOOP;
--	FOR i in 1..7 LOOP
--		DBMS_OUTPUT.PUT_LINE(my_dept_table(i).department_id||' '||
--                            my_dept_table(i).department_name||' '||
--                            my_dept_table(i).location_id);
--	END LOOP;
--END;
--/

----4)
--SET SERVEROUTPUT ON
--DECLARE
--TYPE manager_table_type IS TABLE OF
--	departments.manager_id%TYPE
--INDEX BY BINARY_INTEGER;
--my_manager_table manager_table_type;
--v_count NUMBER;
--BEGIN
--	SELECT manager_id bulk collect into my_manager_table FROM DEPARTMENTS
--	WHERE manager_id != NULL;
--	v_count := SQL%ROWCOUNT;
--	FOR i IN 1..v_count LOOP
--		DELETE FROM employees WHERE employee_id = my_manager_table(i);
--	END LOOP;
--END;
--/

--Cek dengan
--	SELECT COUNT(*) FROM employees;