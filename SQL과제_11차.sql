-- DEPT ���̺� ������ �μ���, ����, �μ���ȣ ������������ �����ؼ� ���
-- CASE 1. Į���� ��� ORDER BY �� ���
SELECT DNAME, LOC, DEPTNO
FROM DEPT
ORDER BY DNAME, LOC, DEPTNO DESC;

-- CASE 2. Į���� + ALIAS �� ��� ORDER BY �� ���
SELECT DNAME AS DEPT, LOC AS AREA, DEPTNO
FROM DEPT
ORDER BY DNAME, AREA, DEPTNO DESC;

-- CASE 3. Į�� ������ȣ + ALIAS �� ��� ORDER BY �� ���
SELECT DNAME, LOC AS AREA, DEPTNO
FROM DEPT
ORDER BY 1, AREA, 3 DESC;

-- SELECT ���� ���� MGR Į���� ORDER BY ���� ���
SELECT EMPNO, ENAME
FROM EMP
ORDER BY MGR;

-- �ζ��� �信 ���ǵ� SELECT Į���� ���� �������� ���
SELECT EMPNO
FROM (SELECT EMPNO, ENAME FROM EMP ORDER BY MGR);

-- GROUP BY �� ���� SELECT ���� �Ϲ� Į���� ���
SELECT JOB, SAL
FROM EMP
GROUP BY JOB
HAVING COUNT (*) > 0
ORDER BY SAL;
-- ��� : ���� �߻�, GROUP BY ǥ������ �ƴմϴ�. 

-- GROUP BY �� ���� ORDER BY ���� �Ϲ� Į���� ���
SELECT JOB
FROM EMP
GROUP BY JOB 
HAVING COUNT (*) > 0
ORDER BY SAL;
-- ��� : ���� �߻�, GROUP BY ǥ������ �ƴմϴ�.

--GROUP BY �� ���� ORDER BY ���� ���� Į���� ���
SELECT JOB, SUM(SAL) AS SALARY_SUM
FROM EMP
GROUP BY JOB
HAVING SUM (SAL) > 5000
ORDER BY SUM (SAL);

-- ���� ���̺�� �� ���̺��� ���� �̸��� �Ҽӵ� ���� �̸��� ����Ͻÿ�
SELECT PLAYER.PLAYER_NAME AS ������, TEAM.TEAM_NAME AS �Ҽ�����
FROM PLAYER, TEAM
WHERE TEAM.TEAM_ID = PLAYER.TEAM_ID;

-- ������ ���� �����͸� ����ϱ� ���� SELECT SQL ���� �ۼ�
SELECT PLAYER.PLAYER_NAME, PLAYER.BACK_NO, PLAYER.TEAM_ID,
        TEAM.TEAM_NAME, TEAM.REGION_NAME
FROM PLAYER, TEAM
WHERE TEAM.TEAM_ID = PLAYER.TEAM_ID;

-- Į���� ���̺� ALIAS ������ �� SQL ���� 
SELECT A.PLAYER_NAME ������, A.BACK_NO ��ѹ�, A.TEAM_ID ���ڵ�,
       B.TEAM_NAME ����, B.REGION_NAME ������
FROM PLAYER A, TEAM B
WHERE B.TEAM_ID = A.TEAM_ID;
-- �������� ALIAS ���� ���� ����