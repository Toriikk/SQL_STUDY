-- WHERE 절에 포지션이 골키퍼인(골키퍼에 대한 포지션 코드는 'GK')선수들 데이터만 백넘버 순으로 출력
SELECT
    A.PLAYER_NAME AS 선수명, A.BACK_NO AS 백넘버, 
    B.REGION_NAME AS 연고지, B.TEAM_NAME AS 팀명
FROM PLAYER A, TEAM B
WHERE A.POSITION = 'GK'
    AND B.TEAM_ID = A.TEAM_ID
ORDER BY A.BACK_NO;

-- FROM 절에서 테이블에 대한 ALIAS를 정의했는데, 
-- SELECT 절이나 WHERE 절에서 테이블명을 사용하면 오류 발생
SELECT PLAYER.PLAYER_NAME AS 선수명, A.BACK_NO AS 백넘버,
       B.REGION_NAME AS 연고지, B.TEAM_NAME AS 팀명
FROM PLAYER A, TEAM B
WHERE A.POSITION = 'GK'
    AND B.TEAM_ID = A.TEAM_ID
    ORDER BY A.BACK_NO;
    
-- 팀 테이블과 경기장 테이블의 관계를 이용해 소속팀이 갖고 있는 전용구장 정보를 팀과 함께 출력
SELECT TEAM.REGION_NAME, TEAM.TEAM_NAME, TEAM.STADIUM_ID,
       STADIUM.STADIUM_NAME, STADIUM.SEAT_COUNT
FROM TEAM, STADIUM
WHERE STADIUM.STADIUM_ID = TEAM.STADIUM_ID;

-- 위 SQL문과 ALIAS를 사용하면 같은 결과 나옴
SELECT A.REGION_NAME, A.TEAM_NAME, A.STADIUM_ID,
       B.STADIUM_NAME, B.SEAT_COUNT
FROM TEAM A, STADIUM B
WHERE B.STADIUM_ID = A.STADIUM_ID;

-- 가독성 및 일관성 측면에서 SELECT 절에 기술된 모든 칼럼에 대해 ALIAS를 사용하는 것이 바람직함
SELECT REGION_NAME, TEAM_NAME, A.STADIUM_ID,
       STADIUM_NAME, SEAT_COUNT
FROM TEAM A, STADIUM B
WHERE B.STADIUM_ID = A.STADIUM_ID;

-- 어떤 사원이 받고 있는 급여가 어느 등급에 속하는지 알고 싶은 요구사항에 대한 Non EQUI JOIN의 사례
SELECT A.ENAME, A.JOB, A.SAL, B.GRADE
FROM EMP A, SALGRADE B
WHERE A.SAL BETWEEN B.LOSAL AND B.HISAL;

-- 사원 14명 모두에 대한 급여와 급여등급 알아보기
SELECT A.ENAME AS 사원명, A.SAL AS 급여, B.GRADE AS 급여등급    
FROM EMP A, SALGRADE B
WHERE A.SAL BETWEEN B.LOSAL AND B.HISAL;

-- 선수 테이블의 소속팀 ID가 팀 테이블의 팀ID와 PK-FK의 관계가 있음
-- 경기장 테이블의 경기장ID와 팀 테이블의 전용구장ID가 PK-FK 관계인 것을 생각하며 작성
SELECT A.PLAYER_NAME AS 선수명, A.POSITION AS 포지션,
       B.REGION_NAME AS 연고지, B.TEAM_NAME AS 팀명,
       C.STADIUM_NAME AS 구장명
FROM PLAYER A, TEAM B, STADIUM C
WHERE B.TEAM_ID = A.TEAM_ID
    AND C.STADIUM_ID = B.STADIUM_ID
ORDER BY 선수명;

-- STADIUM과 TEAM을 조인하되 홈팀이 없는 경기장의 정보도 같이 출력
SELECT A.STADIUM_NAME, A.STADIUM_ID, A.SEAT_COUNT, A.HOMETEAM_ID,
       B.TEAM_NAME
FROM STADIUM A, TEAM B
WHERE B.TEAM_ID(+) = A.HOMETEAM_ID
ORDER BY A.HOMETEAM_ID;

-- DEPT와 EMP를 조인하되 사원이 없는 부서 정보도 같이 출력
SELECT A.ENAME, A.DEPTNO, B.DNAME, B.LOC
FROM EMP A, DEPT B
WHERE B.DEPTNO = A.DEPTNO(+);

-- 사원 번호와 사원 이름, 소속부서 번호와 소속부서 이름을 찾기(WHERE 절 조인 조건)
SELECT A.EMPNO, A.ENAME, B.DEPTNO, B.DNAME
FROM EMP A, DEPT B
WHERE B.DEPTNO = A.DEPTNO;

-- 위와 같은 결과 얻을 수 있음(FROM 절 조인 조건)
SELECT A.EMPNO, A.ENAME, B.DEPTNO, B.DNAME
FROM EMP A INNER JOIN DEPT B
        ON B.DEPTNO = A.DEPTNO;

-- INNNER는 JOIN의 디폴트 옵션으로 아래와 같이 생략 가능
SELECT A.EMPNO, A.ENAME, B.DEPTNO, B.DNAME
FROM EMP A JOIN DEPT B
    ON B.DEPTNO = A.DEPTNO;

-- 사원 번호와 사원 이름, 소속부서 번호와 소속부서 이름을 찾기
SELECT A.EMPNO, A.ENAME, DEPTNO, B.DNAME
FROM EMP A NATURAL  JOIN DEPT B;