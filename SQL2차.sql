SELECT * FROM employees WHERE job_id LIKE 'AD___'; -- job_id���� AD ���� �� ����

SELECT * FROM employees WHERE manager_id IS NULL;

SELECT * FROM employees WHERE salary > 4000 AND job_id = 'IT_PROG';

SELECT * FROM employees WHERE salary > 4000 AND job_id = 'IT_PROG' OR job_id = 'FI_ACCOUNT';

SELECT * FROM employees WHERE employee_id < > 105;

SELECT * FROM employees WHERE manager_id IS NOT NULL;

SELECT lower(last_name) LOWER����,
       upper(last_name) UPPER����,
       email,
       initcap(email)   
FROM employees;

SELECT job_id, SUBSTR(job_id, 1, 2) ������ FROM employees;

SELECT job_id, REPLACE(job_id, 'ACCOUNT', 'ACCNT') ������ FROM employees;

SELECT first_name, LPAD(first_name, 12, '*' ) ������ FROM employees;

SELECT 'start' || TRIM (' - space - ') || 'end' ���ŵ�_���� FROM dual;

SELECT
       salary/30 �ϱ�,
       ROUND(salary/30, 0) ������0,
       ROUND(salary/30, 1) ������1,
       ROUND(salary/30, -1) ������MINUS1
FROM   employees;

SELECT
   salary/30 �ϱ�,
   TRUNC(salary/30, 0) ������0,
   TRUNC(salary/30, 1) ������1,
   TRUNC(salary/30, -1) ������2
FROM   employees;






