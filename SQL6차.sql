UPDATE departments
SET (manager_id, location_id) = (SELECT manager_id, location_id
                                 FROM departments
                                 WHERE department_id = 40)
WHERE department_name = 'Sample_Dept';

SELECT manager_id, location_id
FROM departments
WHERE department_id=40;

SELECT *
FROM departments
WHERE department_name = 'Sample_Dept';

-- departments_id에는 null이 입력될 수 없기 때문에 오류 발생.
UPDATE departments
SET department_id = null
WHERE department_name = 'Sample_Dept';

-- 일반적인 방법
DELETE FROM departments
WHERE department_name = 'Sample_Dept';

-- 서브쿼리를 사용한 방법
DELETE FROM departments
WHERE department_id IN (SELECT department_id
                        FROM departments
                        WHERE department_name = 'Sample_Dept');
                        
commit;

-- 기본키 제약 조건
INSERT INTO departments
VAlUES (1000, 'Sample_Dept', 200, 1700);

-- 외래키 제약 조건 : 열 값이 부모 테이블의 참조 열의 값을 반드시 참조
-- 111은 부모 테이블의 행에 존재하지 않음
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VAlUES (273, 'Sample_Dept', 200, 111);

-- 유일키 : 중복은 허락하지 않지만 (null 값은 허용 가능)
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary)
VALUES (207, 'fist_name' , 'last_name', 'SKING', '111.111.1111', to_date('030617','YYMMDD'),'IT_PROG', 6000);

SELECT *
FROM employees
WHERE email = 'SKING';

-- NOT NULL : NULL 값을 허용하지 않는다
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (273, null, 200, 700);

-- CHECK : 범위나 조건 등 지정된 값만 사용
-- 맨끝에 같은 0을 초과하는 값만 허용 
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, 
            hire_date, job_id, salary)
VALUES (209, 'fist_name' , 'last_name', 'TEST', '111.111.1111', to_date('030617','YYMMDD'),'IT_PROG', 0);


-- 테이블 생성
CREATE TABLE sample_product
            ( product_id number,
              product_name VARCHAR2(30),
              manu_date date
            );
INSERT INTO sample_product VALUES ( 1, 'television', to_date('140101', 'YYMMDD'));
INSERT INTO sample_product VALUES ( 2, 'washer', to_date('150101', 'YYMMDD'));
INSERT INTO sample_product VALUES ( 3, 'cleaner', to_date('160101', 'YYMMDD'));

SELECT
    *
FROM sample_product; 

DELETE FROM sample_product
WHERE product_name = 'cleaner';

commit;

ALTER TABLE sample_product ADD(factory VARCHAR(10));

ALTER TABLE sample_product MODIFY(factory CHAR(8));

-- 데이터보다 열의 크기를 작게 변경하면 오류
ALTER TABLE sample_product MODIFY(product_name VARCHAR(5));

ALTER TABLE sample_product RENAME COLUMN factory TO factory_name;

-- 열 삭제
ALTER TABLE sample_product DROP COLUMN factory_name;

-- 내용 삭제
TRUNCATE TABLE sample_product;

-- 테이블 삭제
DROP TABLE sample_product;
