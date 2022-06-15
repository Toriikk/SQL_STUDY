-- ������ �����Լ��� ã�Ƽ� nvl �Լ� ��� ����
SELECT MAX(MGR) AS MGR
FROM EMP
WHERE ENAME = 'JSC';

-- �����Լ��� �μ��� �� NVL/ISNULL �Լ��� �̿��ؼ� �������� ��쿡�� ��ĭ�� �ƴ� 9999�� ���
SELECT NVL (MAX (MGR), 9999) AS MGR
FROM EMP
WHERE ENAME = 'JSC';

-- ��� ���̺��� MGR�� 7698�� ������ NULL�� ǥ��, ���� ������ MGR ǥ��
SELECT ENAME, EMPNO, MGR, NULLIF (MGR, 7698) AS NUIF
FROM EMP;

SELECT ENAME, EMPNO, MGR,
    CASE
    WHEN MGR = 7698 THEN NULL
    ELSE MGR
    END AS NUIF
FROM EMP;

-- COALESCE �Լ��� �� ���� ��ø�� CASE �������� ǥ�� ����
SELECT ENAME, COMM, SAL, 
    CASE
    WHEN COMM IS NOT NULL THEN COMM
    ELSE (CASE WHEN SAL IS NOT NULL THEN SAL ELSE NULL END)
    END AS COAL
FROM EMP;

