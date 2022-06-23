-- WHERE ���� �������� ��Ű����(��Ű�ۿ� ���� ������ �ڵ�� 'GK')������ �����͸� ��ѹ� ������ ���
SELECT
    A.PLAYER_NAME AS ������, A.BACK_NO AS ��ѹ�, 
    B.REGION_NAME AS ������, B.TEAM_NAME AS ����
FROM PLAYER A, TEAM B
WHERE A.POSITION = 'GK'
    AND B.TEAM_ID = A.TEAM_ID
ORDER BY A.BACK_NO;

-- FROM ������ ���̺� ���� ALIAS�� �����ߴµ�, 
-- SELECT ���̳� WHERE ������ ���̺���� ����ϸ� ���� �߻�
SELECT PLAYER.PLAYER_NAME AS ������, A.BACK_NO AS ��ѹ�,
       B.REGION_NAME AS ������, B.TEAM_NAME AS ����
FROM PLAYER A, TEAM B
WHERE A.POSITION = 'GK'
    AND B.TEAM_ID = A.TEAM_ID
    ORDER BY A.BACK_NO;
    
-- �� ���̺�� ����� ���̺��� ���踦 �̿��� �Ҽ����� ���� �ִ� ���뱸�� ������ ���� �Բ� ���
SELECT TEAM.REGION_NAME, TEAM.TEAM_NAME, TEAM.STADIUM_ID,
       STADIUM.STADIUM_NAME, STADIUM.SEAT_COUNT
FROM TEAM, STADIUM
WHERE STADIUM.STADIUM_ID = TEAM.STADIUM_ID;

-- �� SQL���� ALIAS�� ����ϸ� ���� ��� ����
SELECT A.REGION_NAME, A.TEAM_NAME, A.STADIUM_ID,
       B.STADIUM_NAME, B.SEAT_COUNT
FROM TEAM A, STADIUM B
WHERE B.STADIUM_ID = A.STADIUM_ID;

-- ������ �� �ϰ��� ���鿡�� SELECT ���� ����� ��� Į���� ���� ALIAS�� ����ϴ� ���� �ٶ�����
SELECT REGION_NAME, TEAM_NAME, A.STADIUM_ID,
       STADIUM_NAME, SEAT_COUNT
FROM TEAM A, STADIUM B
WHERE B.STADIUM_ID = A.STADIUM_ID;

-- � ����� �ް� �ִ� �޿��� ��� ��޿� ���ϴ��� �˰� ���� �䱸���׿� ���� Non EQUI JOIN�� ���
SELECT A.ENAME, A.JOB, A.SAL, B.GRADE
FROM EMP A, SALGRADE B
WHERE A.SAL BETWEEN B.LOSAL AND B.HISAL;

-- ��� 14�� ��ο� ���� �޿��� �޿���� �˾ƺ���
SELECT A.ENAME AS �����, A.SAL AS �޿�, B.GRADE AS �޿����    
FROM EMP A, SALGRADE B
WHERE A.SAL BETWEEN B.LOSAL AND B.HISAL;

-- ���� ���̺��� �Ҽ��� ID�� �� ���̺��� ��ID�� PK-FK�� ���谡 ����
-- ����� ���̺��� �����ID�� �� ���̺��� ���뱸��ID�� PK-FK ������ ���� �����ϸ� �ۼ�
SELECT A.PLAYER_NAME AS ������, A.POSITION AS ������,
       B.REGION_NAME AS ������, B.TEAM_NAME AS ����,
       C.STADIUM_NAME AS �����
FROM PLAYER A, TEAM B, STADIUM C
WHERE B.TEAM_ID = A.TEAM_ID
    AND C.STADIUM_ID = B.STADIUM_ID
ORDER BY ������;

-- STADIUM�� TEAM�� �����ϵ� Ȩ���� ���� ������� ������ ���� ���
SELECT A.STADIUM_NAME, A.STADIUM_ID, A.SEAT_COUNT, A.HOMETEAM_ID,
       B.TEAM_NAME
FROM STADIUM A, TEAM B
WHERE B.TEAM_ID(+) = A.HOMETEAM_ID
ORDER BY A.HOMETEAM_ID;

-- DEPT�� EMP�� �����ϵ� ����� ���� �μ� ������ ���� ���
SELECT A.ENAME, A.DEPTNO, B.DNAME, B.LOC
FROM EMP A, DEPT B
WHERE B.DEPTNO = A.DEPTNO(+);

-- ��� ��ȣ�� ��� �̸�, �ҼӺμ� ��ȣ�� �ҼӺμ� �̸��� ã��(WHERE �� ���� ����)
SELECT A.EMPNO, A.ENAME, B.DEPTNO, B.DNAME
FROM EMP A, DEPT B
WHERE B.DEPTNO = A.DEPTNO;

-- ���� ���� ��� ���� �� ����(FROM �� ���� ����)
SELECT A.EMPNO, A.ENAME, B.DEPTNO, B.DNAME
FROM EMP A INNER JOIN DEPT B
        ON B.DEPTNO = A.DEPTNO;

-- INNNER�� JOIN�� ����Ʈ �ɼ����� �Ʒ��� ���� ���� ����
SELECT A.EMPNO, A.ENAME, B.DEPTNO, B.DNAME
FROM EMP A JOIN DEPT B
    ON B.DEPTNO = A.DEPTNO;

-- ��� ��ȣ�� ��� �̸�, �ҼӺμ� ��ȣ�� �ҼӺμ� �̸��� ã��
SELECT A.EMPNO, A.ENAME, DEPTNO, B.DNAME
FROM EMP A NATURAL  JOIN DEPT B;