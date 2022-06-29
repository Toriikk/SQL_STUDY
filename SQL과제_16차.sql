-- NATURAL JOIN의 경우 WHERE절에서 조인 조건을 추가할 수 없지만, CROSS JOIN의 경우 추가 가능
-- 하지만 아래의 경우는 CROSS JOIN이 아니라 INNER JOIN과 같은 결과 얻기 때문에 권고 하지 않음
SELECT A.ENAME, B.DNAME
FROM EMP A CROSS JOIN DEPT B
WHERE B.DEPTNO = A.DEPTNO;

SELECT A.ENAME, B.DNAME
FROM EMP A INNER JOIN DEPT B
ON B.DEPTNO = A.DEPTNO;

SELECT PLAYER_NAME AS 선수명, POSITION AS 포지션, BACK_NO AS 백넘버
FROM PLAYER
WHERE TEAM_ID = (SELECT TEAM_ID
                FROM PLAYER
                WHERE PLAYER_NAME = '정남일')
ORDER BY PLAYER_NAME;