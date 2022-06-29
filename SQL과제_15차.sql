--ON 조건절과 WHERE 검색 조건은 충돌 없이 사용할 수 있다.
--부서번호 30인 부서의 소속사원 이름 및 소속 부서번호, 부서버
SELECT a.empno, a.ename, b.deptno, b.dname
FROM emp a JOIN dept b
ON (b.deptno = a.deptno)
WHERE b.deptno = 30;

--매니저 사우너번호가 7698번인 사원들의 이름, 매니저 사원번호, 소속 부서번호, 부서 이름을 찾아본다.
SELECT a.empno, a.ename, b.deptno, b.dname
FROM emp a JOIN dept b
ON (b.deptno = a.deptno)
AND a.mgr = 7698;

SELECT a.empno, a.ename, b.deptno, b.dname
FROM emp a JOIN dept b
ON (b.deptno = a.deptno)
WHERE a.mgr = 7698;

--팀과 경기장 테이블을 경기장ID로 조인해 팀이름, 경기장ID, 경기장명을 찾아본다.
SELECT a.team_name, a.stadium_id, b.stadium_name
FROM team a JOIN stadium b
ON (b.stadium_id = a.stadium_id)
ORDER BY a.stadium_id;

--USING 조건절로 구현할 수 있다.
SELECT a.team_name, stadium_id, b.stadium_name
FROM team a JOIN stadium b
USING (stadium_id)
ORDER BY stadium_id;

--팀과 경기장 테이블을 팀ID로 조인해 팀이름,팀ID,경기장명을 찾아본다. 
--경기장에는 팀ID가 HOMETEAM_ID라는 칼럼으로 표시된다.
--USING 조건절을 사용할 수 없다.
SELECT a.team_name, a.team_id, b.stadium_name
FROM team a JOIN stadium b
ON (b.hometeam_id = a.team_id)
ORDER BY a.team_id;

--사원과 DEPT 테이블의 소속 부서명, DEPT_TEMP 테이블의 바뀐 부서명 정보를 출력한다.
SELECT a.empno, a.deptno, b.dname, c.dname AS NEW_DNAME
FROM emp a JOIN dept b
ON (b.deptno = a.deptno)
JOIN dept_temp c
ON c.deptno = b.deptno;

--GK 포지션의 선수별 연고지명, 팀명, 구장명을 출력한다.
SELECT a.player_name 선수명, a.position 포지션, b.team_name 연고지명, b.team_name 팀명, c.stadium_name 구단명
FROM player a JOIN team b
ON (b.team_id = a.team_id)
JOIN stadium c
ON c.stadium_id = b.stadium_id
WHERE a.position = 'GK'
ORDER BY 선수명;

--홈팀이 3점 이상 차이로 승리한 경기의 경기장 이름, 경기일정, 홈팀 이름과 원정팀 이름 정보를 출력한다.
SELECT b.stadium_name, b.stadium_id, a.sche_date, c.team_name, c.team_name, a.home_score, a.away_score
FROM schedule a JOIN stadium b
ON b.stadium_id = a.stadium_id
JOIN team c
ON c.team_id = a.hometeam_id
JOIN team d
ON d.team_id = a.awayteam_id
WHERE a.home_score >= a.away_score + 3;

사원, 부서 테이블을 CROSS JOIN 해 사원 이름 및 소속 부서 이름을 조회해본다.
SELECT a.ename, b.dname
FROM emp a CROSS JOIN dept b
ORDER BY a.ename;