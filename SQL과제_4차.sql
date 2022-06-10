-- ��(TEAM) ���̺��� ZIP�ڵ� 1�� ZIP�ڵ� 2�� ���ڷ� ��ȯ �� �� �׸��� ���� ���� ���
SELECT
    TEAM_ID AS ��ID,
    TO_NUMBER (ZIP_CODE1, '999') + TO_NUMBER (ZIP_CODE2, '999') AS �����ȣ��
FROM TEAM;

-- CASE ǥ��
SELECT ENAME,
       CASE
        WHEN SAL > 2000 THEN SAL
        ELSE 2000
    END AS REVISED_SALARY
FROM EMP;

-- �μ� �������� �μ� ��ġ�� �̱��� ����, �ߺ�, ���η� �����϶�
SELECT LOC,
       CASE LOC
        WHEN 'NEW YORK' THEN 'EAST'
        WHEN 'BOSTON' THEN 'EAST'
        WHEN 'CHICAGO' THEN 'CENTER'
        WHEN 'DALLAS' THEN 'CENTER'
        ELSE 'ETC'
    END AS AREA
FROM DEPT;

-- ��� �������� �޿��� 3000 �̻��̸� ��������, 1000 �̻��̸� �ߵ������, 1000 �̸��̸� �ϵ������ �з�
SELECT ENAME,
    CASE
        WHEN SAL >= 3000 THEN 'HIGH'
        WHEN SAL >= 1000 THEN 'MID'
        ELSE 'LOW'
    END AS SALARY_GRADE
FROM EMP;

-- ��� �������� �޿��� 2000 �̻��̸� ���ʽ��� 1000����, 1000 �̻��̸� 500����, 1000 �̸��̸� 0���� ���
SELECT ENAME, SAL,
       CASE
        WHEN SAL >= 2000 THEN 1000
        ELSE (CASE
                WHEN SAL >= 1000 THEN 500
                ELSE 0
              END)
    END AS BONUS
FROM EMP;