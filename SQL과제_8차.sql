--첫 번째 요구 사항인 소속팀이 삼성블루윙즈라는 조건을 WHERE 조건절로 옮겨서 SQL 문장 완성해 실행
SELECT PLAYER_NAME AS 선수명, POSITION AS 포지션, BACK_NO AS 백넘버, HEIGHT AS 키
FROM PLAYER
WHERE TEAM_ID=K02;

-- 첫 번째 요구 사항을 수정해 다시 실행
SELECT PLAYER_NAME AS 선수명, POSITION AS 포지션, BACK_NO AS 백넘버, HEIGHT AS 키
FROM PLAYER
WHERE TEAM_ID='K02';

-- 사원 테이블에서 JOB이 MANAGER이면서 20번 부서에 속하거나, JOB이 CLERK이면서
-- 30번 부서에 속하는 사원의 정보를 IN 연산자의 다중 리스트를 이용해 출력
SELECT ENAME, JOB, DEPTNO
FROM EMP
WHERE (JOB, DEPTNO) IN(('MANAGER', 20), ('CLERK', 30));

SELECT ENAME, JOB, DEPTNO
FROM EMP
WHERE JOB IN ('MANAGER', 'CLERK') AND DEPTNO IN (20, 30);