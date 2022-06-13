SELECT NVL (NULL, 'NVL-OK') AS ISNULL_TEST FROM dual;

SELECT NVL('Not-Null', 'NVL-OK') AS ISNULL_TEST FROM dual;

SELECT NVL(NULL, 'NVL-OK') AS ISNULL_TEST FROM dual;

-- 선수 테이블에서 성남 일화천마(K08) 소속 선수의 이름과 포지션을 출력하는데, 포지션이 없는 경우는 '없음'으로 표시
SELECT PLAYER_NAME AS 선수명, POSITION AS 포지션, NVL (POSITION, '없음') AS NL포지션
FROM PLAYER
WHERE TEAM_ID = 'K08';

-- NVL 함수와 ISNULL 함수를 사용한 SQL 문장은 벤더 공통적으로 CASE 문장으로 표현할 수 있음 
SELECT PLAYER_NAME 선수명, POSITION AS 포지션, 
    CASE
        WHEN POSITION IS NULL THEN '없음'
        ELSE POSITION
    END AS NL포지션
FROM PLAYER
WHERE TEAM_ID = 'K08';

-- 급여와 커미션을 포함한 연봉을 계산하면서 NVL함수의 필요성을 알아본다
SELECT ENAME AS 사원명, SAL AS 월급, COMM AS 커미션, 
       (SAL * 12) + COMM AS 연봉A, (SAL * 12) + NVL (COMM, 0) AS 연봉B
FROM EMP;