-- MONTH 데이터를 Simple Case Expression을 이용해 12개의 칼럼으로 구분
-- 실행 결과에서 보여주는 사원명(ENAME)은 정보의 흐름을 이해하기 위해 부가적으로 보여주는 임시 정보
SELECT ENAME AS 사원명, DEPTNO AS 부서번호, 
       CASE MONTH WHEN 1 THEN SAL END AS M01, CASE MONTH WHEN 2 THEN SAL END AS M02,
       CASE MONTH WHEN 3 THEN SAL END AS M03, CASE MONTH WHEN 4 THEN SAL END AS M04,
       CASE MONTH WHEN 5 THEN SAL END AS M05, CASE MONTH WHEN 6 THEN SAL END AS M06,
       CASE MONTH WHEN 7 THEN SAL END AS M07, CASE MONTH WHEN 8 THEN SAL END AS M08,
       CASE MONTH WHEN 9 THEN SAL END AS M09, CASE MONTH WHEN 10 THEN SAL END AS M10,
       CASE MONTH WHEN 11 THEN SAL END AS M11, CASE MONTH WHEN 12 THEN SAL END AS M12
FROM (SELECT ENAME, DEPTNO, EXTRACT (MONTH FROM HIREDATE) AS MONTH, SAL FROM EMP);

-- 부서별로 월별 입사자의 평균 급여를 알고 싶다는 요구사항 : 부서별 평균값 구하기
-- 직원 개인에 대한 정보는 필요 없으므로 제외
SELECT DEPTNO AS 부서번호,
       AVG (CASE MONTH WHEN 1 THEN SAL END) AS M01, AVG (CASE MONTH WHEN 2 THEN SAL END) AS M02,
       AVG (CASE MONTH WHEN 3 THEN SAL END) AS M03, AVG (CASE MONTH WHEN 4 THEN SAL END) AS M04,
       AVG (CASE MONTH WHEN 5 THEN SAL END) AS M05, AVG (CASE MONTH WHEN 6 THEN SAL END) AS M06,
       AVG (CASE MONTH WHEN 7 THEN SAL END) AS M07, AVG (CASE MONTH WHEN 8 THEN SAL END) AS M08,
       AVG (CASE MONTH WHEN 9 THEN SAL END) AS M09, AVG (CASE MONTH WHEN 10 THEN SAL END) AS M10,
       AVG (CASE MONTH WHEN 11 THEN SAL END) AS M11, AVG (CASE MONTH WHEN 12 THEN SAL END) AS M12
FROM (SELECT ENAME, DEPTNO, EXTRACT (MONTH FROM HIREDATE) AS MONTH, SAL FROM EMP)
GROUP BY DEPTNO;

-- Simple Case Expression으로 표현된 위의 SQL과 같은 내용으로 Oracle의 DECODE 함수를 사용한 SQL 문장 작성
SELECT DEPTNO AS 부서번호,
       AVG (DECODE (MONTH, 1, SAL)) AS M01, AVG (DECODE (MONTH, 2, SAL)) AS M02,
       AVG (DECODE (MONTH, 3, SAL)) AS M03, AVG (DECODE (MONTH, 4, SAL)) AS M04,
       AVG (DECODE (MONTH, 5, SAL)) AS M05, AVG (DECODE (MONTH, 6, SAL)) AS M06,
       AVG (DECODE (MONTH, 7, SAL)) AS M07, AVG (DECODE (MONTH, 8, SAL)) AS M08,
       AVG (DECODE (MONTH, 9, SAL)) AS M09, AVG (DECODE (MONTH, 10, SAL)) AS M10,
       AVG (DECODE (MONTH, 11, SAL)) AS M11, AVG (DECODE (MONTH, 12, SAL)) AS M12
FROM (SELECT ENAME, DEPTNO, EXTRACT (MONTH FROM HIREDATE) AS MONTH, SAL FROM EMP)
GROUP BY DEPTNO;

-- 팀별 포지션별 FW, MF, DF, GK 포지션의 인원수와 팀별 전체 인원수를 구하는 SQL 문장을 작성(데이터가 없는 경우 0)
SELECT TEAM_ID,
        NVL (SUM (CASE POSITION WHEN 'FW' THEN 1 ELSE 0 END), 0) AS FW,
        NVL (SUM (CASE POSITION WHEN 'MF' THEN 1 ELSE 0 END), 0) AS MF,
        NVL (SUM (CASE POSITION WHEN 'DF' THEN 1 ELSE 0 END), 0) AS DF,
        NVL (SUM (CASE POSITION WHEN 'GK' THEN 1 ELSE 0 END), 0) AS GK,
        COUNT(*) AS SUM
FROM PLAYER
GROUP BY TEAM_ID;

-- CASE 표현의 ELSE 0, ELSE NULL 문구는 생략 가능, 더 짧게 SQL 문장 작성 가능해짐
SELECT TEAM_ID,
        NVL (SUM (CASE WHEN POSITION = 'FW' THEN 1 END), 0) AS FW,
        NVL (SUM (CASE WHEN POSITION = 'MF' THEN 1 END), 0) AS MF,
        NVL (SUM (CASE WHEN POSITION = 'DF' THEN 1 END), 0) AS DF,
        NVL (SUM (CASE WHEN POSITION = 'GK' THEN 1 END), 0) AS GK,
        COUNT(*) AS SUM
FROM PLAYER
GROUP BY TEAM_ID;

-- GROUP BY 절 없이 전체 선수들의 포지션별 평균키 및 전체 평균키 출력 가능
SELECT 
    ROUND (AVG (CASE WHEN POSITION = 'MF' THEN HEIGHT END), 2) AS 미드필더,
    ROUND (AVG (CASE WHEN POSITION = 'FW' THEN HEIGHT END), 2) AS 포워드,
    ROUND (AVG (CASE WHEN POSITION = 'DF' THEN HEIGHT END), 2) AS 디펜더,
    ROUND (AVG (CASE WHEN POSITION = 'GK' THEN HEIGHT END), 2) AS 골기퍼,
    ROUND (AVG (HEIGHT), 2) 전체평균키
FROM PLAYER;

-- 선수 테이블에서 선수들의 이름, 포지션, 백넘버를 출력하는데 사람 이름을 내림차순으로 정렬(ORDER BY 사용)
SELECT PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버
FROM player
ORDER BY PLAYER_NAME DESC;

-- 선수 테이블에서 선수들의 이름, 포지션, 백넘버를 출력하는데 사람 이름을 내림차순으로 정렬(칼럼명 아닌 ALIAS 사용)
SELECT PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버
FROM player
ORDER BY 포지션 DESC;

-- 한 개의 칼럼이 아닌 여러 가지 칼럼을 기준으로 정렬 
-- 키가 큰 순서대로, 키가 같은 경우 백넘버 순으로, 키가 NULL인 데이터는 제외(ORDER BY 사용)
SELECT PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버, HEIGHT 키
FROM PLAYER
WHERE HEIGHT IS NOT NULL
ORDER BY HEIGHT DESC, BACK_NO;

-- 선수 테이블에서 선수들의 이름, 포지션, 백넘버를 출력하는데 사람 이름을 내림차순으로 정렬(ORDER BY 사용)
SELECT PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버, HEIGHT 키
FROM PLAYER
WHERE HEIGHT IS NOT NULL
ORDER BY 3 DESC, 2, 1;