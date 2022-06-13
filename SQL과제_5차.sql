SELECT NVL (NULL, 'NVL-OK') AS ISNULL_TEST FROM dual;

SELECT NVL('Not-Null', 'NVL-OK') AS ISNULL_TEST FROM dual;

SELECT NVL(NULL, 'NVL-OK') AS ISNULL_TEST FROM dual;

-- ���� ���̺��� ���� ��ȭõ��(K08) �Ҽ� ������ �̸��� �������� ����ϴµ�, �������� ���� ���� '����'���� ǥ��
SELECT PLAYER_NAME AS ������, POSITION AS ������, NVL (POSITION, '����') AS NL������
FROM PLAYER
WHERE TEAM_ID = 'K08';

-- NVL �Լ��� ISNULL �Լ��� ����� SQL ������ ���� ���������� CASE �������� ǥ���� �� ���� 
SELECT PLAYER_NAME ������, POSITION AS ������, 
    CASE
        WHEN POSITION IS NULL THEN '����'
        ELSE POSITION
    END AS NL������
FROM PLAYER
WHERE TEAM_ID = 'K08';

-- �޿��� Ŀ�̼��� ������ ������ ����ϸ鼭 NVL�Լ��� �ʿ伺�� �˾ƺ���
SELECT ENAME AS �����, SAL AS ����, COMM AS Ŀ�̼�, 
       (SAL * 12) + COMM AS ����A, (SAL * 12) + NVL (COMM, 0) AS ����B
FROM EMP;