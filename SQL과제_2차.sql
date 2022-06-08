SELECT
    LENGTH('SQL Expert') AS LEN
FROM DUAL;

DESC DUAL;

SELECT * FROM DUAL;

-- 선수 테이블에서 CONCAT 문자형 함수를 이용해 축구선수란 문구를 추가
SELECT
    CONCAT(PLAYER_NAME, ' 축구선수') AS 선수명
FROM PLAYER;

-- CONCAT 함수는 Oracle의 '||' 합성 연산자와 같은 기능
SELECT
    PLAYER_NAME || ' 축구선수' AS 선수명
FROM PLAYER;

-- 경기장의 지역번호와 전화번호를 합친 번호의 길이를 구하라. 
-- 연결연산자의 결과가 LENGTH 함수의 인수가 된다.
SELECT STADIUM_ID, DDD || ')' || TEL AS TEL, LENGTH (DDD || '-' || TEL) AS T_LEN
FROM STADIUM;

-- 반올림 및 내림해 소수점 이하 한 자리까지 출력
SELECT ENAME, ROUND (SAL / 12, 1) AS SAL_ROUND, TRUNC (SAL / 12, 1) AS SAL_TRUNC
FROM EMP;

