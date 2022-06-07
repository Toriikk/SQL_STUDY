SELECT
    COUNT(salary)
FROM employees;

SELECT
    SUM(salary) salary합계,
    SUM(salary)/COUNT(salary) 평균 
FROM employees;

SELECT
    MAX(salary) salary최대,
    MIN(salary) salary최소,
    MAX(first_name) 최대문자값,
    MIN(first_name) 최소문자값
FROM employees;

SELECT job_id 직무, SUM(salary) 직무별_총급여, AVG(salary) 직무별_평균급여
FROM employees
WHERE employee_id >=10
GROUP BY job_id 
ORDER BY 직무별_총급여 DESC, 직무별_평균급여; 

SELECT job_id job_id_대그룹,
       manager_id manager_id_중그룹,
       SUM(salary) 그룹핑_총급여,
       AVG(salary) 그룹핑_평균급여
FROM   employees
WHERE  employee_id >= 10
GROUP BY job_id, manager_id 
ORDER BY 그룹핑_총급여 DESC, 그룹핑_평균급여;

SELECT job_id 직무, SUM(salary) 직무별_총급여, AVG(salary) 직무별_평균급여
FROM   employees
WHERE  employee_id >= 10
GROUP BY job_id
HAVING   SUM(salary) > 30000
ORDER BY 직무별_총급여 DESC, 직무별_평균급여;

SELECT a.first_name, a.last_name, B.*
FROM employees A, job_history B
WHERE A.employee_id = b.employee_id
AND A.employee_id = 101;

SELECT
    *
FROM employees A, departments B
WHERE A.department_id = b.department_id;

SELECT a.employee_id, a.department_id, b.department_name, c.location_id, c.city
FROM employees A, departments B, locations C
WHERE a.department_id = b.department_id
AND b.location_id = c.location_id;

SELECT COUNT(*) 조인된건수
FROM employees A, departments B
WHERE a.department_id = b.department_id;

SELECT COUNT(*)
FROM employees; -- 위와 한 명 차이가 나는데 부서 배치 안 받은 사람이 한 명 있다는 것

SELECT a.department_id, a.first_name, b.department_id, b.department_name
FROM employees A, departments B
WHERE a.department_id = b.department_id(+)
ORDER BY a.employee_id;

SELECT a.department_id, a.first_name, b.department_id, b.department_name
FROM employees A, departments B
WHERE a.department_id(+) = b.department_id -- A의 데이터가 B보다 없어서 NULL 값이 더 많이 나옴 
ORDER BY a.employee_id;

SELECT A.employee_id, A.first_name, A.last_name, A.manager_id,
       B.first_name||' '||B.last_name manager_name
FROM   employees A, employees B
WHERE  A.manager_id = B.employee_id 
ORDER BY A.employee_id;