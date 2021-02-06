
create or replace
PROCEDURE proc_emp_cursor is
  CURSOR c_emp_cursor IS 
   SELECT employee_id, last_name FROM employees
   WHERE department_id =30;
  l_empno employees.employee_id%TYPE;
  l_lname employees.last_name%TYPE;
BEGIN  OPEN c_emp_cursor;
  LOOP
    FETCH c_emp_cursor INTO l_empno, l_lname;
    EXIT WHEN c_emp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE( l_empno ||'  '||l_lname);  
  END LOOP;
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE("The query with local did not return a result');
END;
