--ù ��° �䱸 ������ �Ҽ����� �Ｚ��������� ������ WHERE �������� �Űܼ� SQL ���� �ϼ��� ����
SELECT PLAYER_NAME AS ������, POSITION AS ������, BACK_NO AS ��ѹ�, HEIGHT AS Ű
FROM PLAYER
WHERE TEAM_ID=K02;

-- ù ��° �䱸 ������ ������ �ٽ� ����
SELECT PLAYER_NAME AS ������, POSITION AS ������, BACK_NO AS ��ѹ�, HEIGHT AS Ű
FROM PLAYER
WHERE TEAM_ID='K02';

-- ��� ���̺��� JOB�� MANAGER�̸鼭 20�� �μ��� ���ϰų�, JOB�� CLERK�̸鼭
-- 30�� �μ��� ���ϴ� ����� ������ IN �������� ���� ����Ʈ�� �̿��� ���
SELECT ENAME, JOB, DEPTNO
FROM EMP
WHERE (JOB, DEPTNO) IN(('MANAGER', 20), ('CLERK', 30));

SELECT ENAME, JOB, DEPTNO
FROM EMP
WHERE JOB IN ('MANAGER', 'CLERK') AND DEPTNO IN (20, 30);