SELECT
    LENGTH('SQL Expert') AS LEN
FROM DUAL;

DESC DUAL;

SELECT * FROM DUAL;

-- ���� ���̺��� CONCAT ������ �Լ��� �̿��� �౸������ ������ �߰�
SELECT
    CONCAT(PLAYER_NAME, ' �౸����') AS ������
FROM PLAYER;

-- CONCAT �Լ��� Oracle�� '||' �ռ� �����ڿ� ���� ���
SELECT
    PLAYER_NAME || ' �౸����' AS ������
FROM PLAYER;

-- ������� ������ȣ�� ��ȭ��ȣ�� ��ģ ��ȣ�� ���̸� ���϶�. 
-- ���Ῥ������ ����� LENGTH �Լ��� �μ��� �ȴ�.
SELECT STADIUM_ID, DDD || ')' || TEL AS TEL, LENGTH (DDD || '-' || TEL) AS T_LEN
FROM STADIUM;

-- �ݿø� �� ������ �Ҽ��� ���� �� �ڸ����� ���
SELECT ENAME, ROUND (SAL / 12, 1) AS SAL_ROUND, TRUNC (SAL / 12, 1) AS SAL_TRUNC
FROM EMP;

