-- 팀(TEAM) 테이블의 ZIP코드 1과 ZIP코드 2를 숫자로 변환 후 두 항목을 더한 숫자 출력
SELECT
    TEAM_ID AS 팀ID,
    TO_NUMBER (ZIP_CODE1, '999') + TO_NUMBER (ZIP_CODE2, '999') AS 우편번호합
FROM TEAM;

-- CASE 표현
SELECT ENAME,
       CASE
        WHEN SAL > 2000 THEN SAL
        ELSE 2000
    END AS REVISED_SALARY
FROM EMP;

-- 부서 정보에서 부서 위치를 미국의 동부, 중부, 서부로 구분하라
SELECT LOC,
       CASE LOC
        WHEN 'NEW YORK' THEN 'EAST'
        WHEN 'BOSTON' THEN 'EAST'
        WHEN 'CHICAGO' THEN 'CENTER'
        WHEN 'DALLAS' THEN 'CENTER'
        ELSE 'ETC'
    END AS AREA
FROM DEPT;

-- 사원 정보에서 급역가 3000 이상이면 상등급으로, 1000 이상이면 중등급으로, 1000 미만이면 하등급으로 분류
SELECT ENAME,
    CASE
        WHEN SAL >= 3000 THEN 'HIGH'
        WHEN SAL >= 1000 THEN 'MID'
        ELSE 'LOW'
    END AS SALARY_GRADE
FROM EMP;

-- 사원 정보에서 급여가 2000 이상이면 보너스를 1000으로, 1000 이상이면 500으로, 1000 미만이면 0으로 계산
SELECT ENAME, SAL,
       CASE
        WHEN SAL >= 2000 THEN 1000
        ELSE (CASE
                WHEN SAL >= 1000 THEN 500
                ELSE 0
              END)
    END AS BONUS
FROM EMP;