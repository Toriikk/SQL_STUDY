-- 팀(TEAM) 테이블의 ZIP코드 1과 ZIP 코드2를 숫자로 변환한 후 두 항목을 더한 숫자 출력
SELECT TEAM_ID AS 팀ID,
       TO_NUMBER (ZIP_CODE1, '999') + TO_NUMBER (ZIP_CODE2, '999') AS 우편번호합
FROM TEAM;

-- Oracle의 SYSDATE 함수와 SQL Server의 GETDATE() 함수를 사용해 데이터베이스에서 사용하는 현재의 날짜 데이터 확인
-- 날짜 데이터는 시스템 구성에 따라 다양하게 표현될 수 있음 사용자마다 다른 결과 나올 수 있음
--  TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS PM')
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS PM')
FROM DUAL;

-- 사원(EMP) 테이블의 입사일자에서 년, 월, 일 데이터를 각각 출력
-- 아래 두 개 문장은 같은 기능하는 문장
SELECT ENAME AS 사원명, HIREDATE AS 입사일자,
       EXTRACT (YEAR FROM HIREDATE) AS 입사년도,
       EXTRACT (MONTH FROM HIREDATE) AS 입사월,
       EXTRACT (DAY FROM HIREDATE) AS 입사일
FROM EMP;

SELECT ENAME AS 사원명, HIREDATE AS 입사일자, 
       TO_NUMBER (TO_CHAR (HIREDATE, 'YYYY')) AS 입사년도, 
       TO_NUMBER (TO_CHAR (HIREDATE, 'MM')) AS 입사월,
       TO_NUMBER (TO_CHAR (HIREDATE, 'DD')) AS 입사일    
FROM EMP;

-- 날짜를 정해진 문자 형태로 변형
SELECT TO_CHAR (SYSDATE, 'YYYY/MM/DD') AS 날짜,
       TO_CHAR (SYSDATE, 'YYYY. MON, DAY') AS 문자형
FROM DUAL;

-- 금액을 달러와 원화로 표시, 두 번째 칼럼의 L999에서 L은 로컬화페단위 의미
SELECT TO_CHAR (123456789 / 1200, '$999,999,99.99') AS 환율반영달러,
       TO_CHAR (123456789, 'L999,999,999') AS 원화
FROM DUAL;

-- 반올림 및 올림해 정수 기준으로 출력
SELECT ENAME, ROUND(SAL / 12) AS SAL_ROUND, CEIL (SA L / 12) AS SAL_CEIL
FROM EMP;