-- ��(TEAM) ���̺��� ZIP�ڵ� 1�� ZIP �ڵ�2�� ���ڷ� ��ȯ�� �� �� �׸��� ���� ���� ���
SELECT TEAM_ID AS ��ID,
       TO_NUMBER (ZIP_CODE1, '999') + TO_NUMBER (ZIP_CODE2, '999') AS �����ȣ��
FROM TEAM;

-- Oracle�� SYSDATE �Լ��� SQL Server�� GETDATE() �Լ��� ����� �����ͺ��̽����� ����ϴ� ������ ��¥ ������ Ȯ��
-- ��¥ �����ʹ� �ý��� ������ ���� �پ��ϰ� ǥ���� �� ���� ����ڸ��� �ٸ� ��� ���� �� ����
--  TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS PM')
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS PM')
FROM DUAL;

-- ���(EMP) ���̺��� �Ի����ڿ��� ��, ��, �� �����͸� ���� ���
-- �Ʒ� �� �� ������ ���� ����ϴ� ����
SELECT ENAME AS �����, HIREDATE AS �Ի�����,
       EXTRACT (YEAR FROM HIREDATE) AS �Ի�⵵,
       EXTRACT (MONTH FROM HIREDATE) AS �Ի��,
       EXTRACT (DAY FROM HIREDATE) AS �Ի���
FROM EMP;

SELECT ENAME AS �����, HIREDATE AS �Ի�����, 
       TO_NUMBER (TO_CHAR (HIREDATE, 'YYYY')) AS �Ի�⵵, 
       TO_NUMBER (TO_CHAR (HIREDATE, 'MM')) AS �Ի��,
       TO_NUMBER (TO_CHAR (HIREDATE, 'DD')) AS �Ի���    
FROM EMP;

-- ��¥�� ������ ���� ���·� ����
SELECT TO_CHAR (SYSDATE, 'YYYY/MM/DD') AS ��¥,
       TO_CHAR (SYSDATE, 'YYYY. MON, DAY') AS ������
FROM DUAL;

-- �ݾ��� �޷��� ��ȭ�� ǥ��, �� ��° Į���� L999���� L�� ����ȭ����� �ǹ�
SELECT TO_CHAR (123456789 / 1200, '$999,999,99.99') AS ȯ���ݿ��޷�,
       TO_CHAR (123456789, 'L999,999,999') AS ��ȭ
FROM DUAL;

-- �ݿø� �� �ø��� ���� �������� ���
SELECT ENAME, ROUND(SAL / 12) AS SAL_ROUND, CEIL (SA L / 12) AS SAL_CEIL
FROM EMP;