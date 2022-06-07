SELECT department_id
FROM employees
UNION
SELECT department_id
FROM departments;

SELECT department_id
FROM employees
UNION ALL
SELECT department_id
FROM departments;

SELECT department_id
FROM employees
INTERSECT
SELECT department_id
FROM departments;

SELECT department_id
FROM employees
MINUS
SELECT department_id
FROM departments;


SELECT *
FROM employees A
WHERE a.salary = (SELECT salary 
                  FROM employees
                  WHERE last_name = 'De Haan');
                  
SELECT *
FROM employees A
WHERE a.salary =17000; -- 위의 코드와 동일한 결과 출력

-- 이름만 바꿨을 뿐인데 에러남 -> 다중행(동일한 이름을 가진 사람이 여럿 존재)
SELECT *
FROM employees A
WHERE a.salary = (SELECT salary 
                  FROM employees
                  WHERE last_name = 'Taylor');
                  
SELECT *
FROM employees A
WHERE a.salary IN (SELECT salary 
                  FROM employees
                  WHERE last_name = 'Taylor');                  

SELECT
    *
FROM employees A
WHERE a.salary IN ( SELECT MIN(salary) 최저급여
                    FROM employees
                    GROUP BY department_id 
                   )
ORDER BY a.salary DESC;


SELECT
    *
FROM employees A
WHERE ( a.job_id, a.salary ) IN ( 
                                    SELECT job_id, MIN(salary) 그룹별_급여
                                    FROM employees
                                    GROUP BY job_id
                                 )
ORDER BY a.salary DESC;


SELECT *
FROM employees A,
               ( SELECT department_id
                 FROM departments
                 WHERE department_name = 'IT' ) B -- 얘를 B 테이블이라고 하자(인라인뷰, 가상뷰)
WHERE a.department_id = B.department_id;

INSERT INTO departments ( department_id, department_name, manager_id, location_id)
VALUES (271, 'Sample_Dept', 200, 1700);

SELECT *
FROM departments
ORDER BY department_id DESC;

INSERT INTO departments
VALUES (272, 'Sample_Dept', 200, 1700);

commit;

UPDATE departments
SET manager_id = 201,
    location_id = 1800
WHERE department_name = 'Sample_Dept';


