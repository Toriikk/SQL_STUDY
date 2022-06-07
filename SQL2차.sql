SELECT * FROM employees WHERE job_id LIKE 'AD___'; -- job_id에서 AD 이후 세 글자

SELECT * FROM employees WHERE manager_id IS NULL;

SELECT * FROM employees WHERE salary > 4000 AND job_id = 'IT_PROG';

SELECT * FROM employees WHERE salary > 4000 AND job_id = 'IT_PROG' OR job_id = 'FI_ACCOUNT';

SELECT * FROM employees WHERE employee_id < > 105;

SELECT * FROM employees WHERE manager_id IS NOT NULL;

SELECT lower(last_name) LOWER적용,
       upper(last_name) UPPER적용,
       email,
       initcap(email)   
FROM employees;

SELECT job_id, SUBSTR(job_id, 1, 2) 적용결과 FROM employees;

SELECT job_id, REPLACE(job_id, 'ACCOUNT', 'ACCNT') 적용결과 FROM employees;

SELECT first_name, LPAD(first_name, 12, '*' ) 적용결과 FROM employees;

SELECT 'start' || TRIM (' - space - ') || 'end' 제거된_공백 FROM dual;

SELECT
       salary/30 일급,
       ROUND(salary/30, 0) 적용결과0,
       ROUND(salary/30, 1) 적용결과1,
       ROUND(salary/30, -1) 적용결과MINUS1
FROM   employees;

SELECT
   salary/30 일급,
   TRUNC(salary/30, 0) 적용결과0,
   TRUNC(salary/30, 1) 적용결과1,
   TRUNC(salary/30, -1) 적용결과2
FROM   employees;






