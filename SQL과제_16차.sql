-- NATURAL JOIN�� ��� WHERE������ ���� ������ �߰��� �� ������, CROSS JOIN�� ��� �߰� ����
-- ������ �Ʒ��� ���� CROSS JOIN�� �ƴ϶� INNER JOIN�� ���� ��� ��� ������ �ǰ� ���� ����
SELECT A.ENAME, B.DNAME
FROM EMP A CROSS JOIN DEPT B
WHERE B.DEPTNO = A.DEPTNO;

SELECT A.ENAME, B.DNAME
FROM EMP A INNER JOIN DEPT B
ON B.DEPTNO = A.DEPTNO;

SELECT PLAYER_NAME AS ������, POSITION AS ������, BACK_NO AS ��ѹ�
FROM PLAYER
WHERE TEAM_ID = (SELECT TEAM_ID
                FROM PLAYER
                WHERE PLAYER_NAME = '������')
ORDER BY PLAYER_NAME;