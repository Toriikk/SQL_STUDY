-- 일반적으로 집계함수는 GROUP BY 절과 같이 사용되지만 아래와 같이 테이블 전체가 하나의 그룹이 되는 경우에는 
-- GROUP BY 절 업싱 단독으로 사용 가능
SELECT COUNT (*) AS 전체행수, COUNT (HEIGHT) AS 키건수,
            MAX (HEIGHT) AS 최대키, MIN(HEIGHT) AS 최소키, ROUND(AVG (HEIGHT), 2) AS 평균키
FROM PLAYER;

-- 케이리그 선수들의 포지션별 평균키는 어떻게 되는가?란 요구 사항을 접수
-- GROUP BY 절을 사용하지 않고 집계함수를 사용했을 때 어떤 결과를 보이는지 포지션별 평균키 구하라
SELECT POSITION AS 포지션, AVG (HEIGHT) AS 평균키
FROM PLAYER;
-- 오류 발생 '단일 그룹의 그룹 함수가 아님'
-- SELECT 절에서 사용된 포지션이라는 한글 ALIAS를 GROUP BY 절의 기준으로 사용
SELECT POSITION AS 포지션, AVG (HEIGHT) AS 평균키
FROM PLAYER
GROUP BY 포지션;
-- 오류 발생 "포지션" : 부적합한 식별자 

-- 포지션별 최대키, 최소키, 평균키 출력(포지션별이란 소그룹의 조건을 제시했기 때문에 GROUP BY 절 사용
SELECT POSITION AS 포지션, COUNT(*) AS 인원수, COUNT (HEIGHT) AS 키대상,
       MAX(HEIGHT) AS 최대키, MIN(HEIGHT) AS 최소키, 
       ROUND(AVG(HEIGHT), 2) AS 평균키
FROM PLAYER
GROUP BY POSITION;

-- 케이리그 선수들의 포지션별 평균키를 구하는데, 평균키가 180CM 이상인 정보만 표시 
SELECT POSITION AS 포지션, ROUND(AVG(HEIGHT), 2) AS 평균키
FROM PLAYER
WHERE AVG (HEIGHT) >= 180
GROUP BY POSITION;
-- 오류 발생 : 그룹 함수는 허가되지 않습니다

-- HAVING 조건절에는 GROUP BY 절에서 정의한 소그룹의 집계함수를 이용한 조건을 표시할 수 있음
SELECT POSITION AS 포지션, ROUND(AVG(HEIGHT), 2) AS 평균키
FROM PLAYER
GROUP BY POSITION
    HAVING AVG (HEIGHT) >= 180;

-- SQL 문장은 GROUP BY 절과 HAVING 절의 순서를 바꾸어서 수행
SELECT POSITION AS 포지션, ROUND(AVG(HEIGHT), 2) AS 평균키
FROM PLAYER
    HAVING AVG (HEIGHT) >= 180
GROUP BY POSITION;

-- 케이리그의 선수들 중 삼성블루윙즈와 FC서울의 인원수는 얼마인가란 요구사항 접수 
SELECT TEAM_ID AS 팀ID, COUNT (*) AS 인원수
FROM PLAYER
WHERE TEAM_ID IN ('K09', 'K02')
GROUP BY TEAM_ID;

SELECT TEAM_ID AS 팀ID, COUNT (*) AS 인원수
    FROM PLAYER
GROUP BY TEAM_ID
    HAVING TEAM_ID IN ('K09', 'K02');

-- 포지션별 평균키만 출력하는데 최대키가 190CM 이상인 선수를 갖곡 있는 포지션의 정보만 출력
SELECT POSITION AS 포지션, ROUND(AVG (HEIGHT), 2) AS 평균키
    FROM PLAYER
GROUP BY POSITION
    HAVING MAX (HEIGHT) >= 190;
    
-- 먼저 개별 입사정보에서 월별 데이터를 추출하는 작업을 진행, 월별 정보가 있다면 생략 가능
SELECT ENAME AS 사원명, DEPTNO AS 부서번호,
       EXTRACT (MONTH FROM HIREDATE) AS 입사월, SAL AS 급여
FROM EMP;