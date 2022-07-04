-- ������� �޿��� ���� �Ŵ����� �ΰ� �ִ� ������� SALARY �� �ִ� ���ϱ� 
SELECT mgr, ename, sal
    , max(sal) over (PARTITION BY MGR) AS MAX_SAL
FROM emp;

-- INLINE VIEW�� �̿��� ��Ƽ�Ǻ� �ִ��� ���� �ุ �����ϱ� 
SELECT mgr, ename, sal
FROM (select mgr, ename, sal
        , max(sal) over (partition by mgr) as max_sal
        FROM EMP)
WHERE SAL = MAX_SAL;

-- ���� ������ ���� ���� ���ϵ� �� ����
-- �Ʒ��� ���� ���� �Լ��� ���� ���� �ٶ���
SELECT mgr, ename, sal
FROM (select mgr, ename, sal
        , rank () over (partition by mgr order by sal desc) as sal_rk
        from emp)
    where sal_rk = 1;

-- ������� �޿��� ���� �Ŵ����� �ΰ� �ִ� ������� �Ի����ڸ� �������� �����ϰ� 
-- SALARY �ּڰ��� �Բ� ���ϱ�
SELECT mgr, ename, hiredate, sal
        , min (sal) over (partition by mgr order by hiredate) as min_sal
FROM emp;

--EMP���̺��� ���� �Ŵ����� �ΰ� �ִ� ������� ��� SALARY ���ϱ�
-- ���� : ���� �Ŵ��� ������ �ڱ� �ٷ� ���� ����� �ٶ�� ���� ����� �������� ������� �� 
SELECT mgr, ename, hiredate, sal
    , round(avg (sal) over (partition by mgr order by hiredate
        rows between 1 preceding and 1 following)) as avg_Sal
FROM emp;

-- ������� �޿� �������� ����, �޿����� 50 ���ϰ� ���ų� 150 ���Ϸ� ���� �޿��� �޴� �ο��� ��� 
SELECT ename, sal
    , count (*) over (order by sal range between 50 preceding and 150
    following) as emp_cnt
FROM emp;

-- �μ��� �������� ������ ���� �������� ����, ��Ƽ�� ������ ���� ���� ���� �� ����ϱ�
SELECT deptno, ename, sal
    , first_value (ename) over (partition by deptno order by sal desc
        rows unbounded preceding) as ename_fv
FROM emp;

-- ���� ���忡�� ���� ���� ���� FIRST_VALUE�� ó���ϱ� ���� ORDER BY ���� ���� �߰� 
SELECT deptno, ename, sal
    , first_value (ename) over (partition by deptno order by sal desc, ename
            rows unbounded preceding) as ename_fv
FROM emp;

-- �μ��� �������� ������ ���� �������� �����ϰ�, ��Ƽ�� ������ ���� �������� ���� �� ���
SELECT deptno, ename, sal
     , last_value (ename) over (partition by deptno order by sal desc, ename
            rows between current row and unbounded following) as ename_lv
FROM emp;

-- �������� �Ի����ڰ� ���� �������� �����ϰ� 
-- ���κ��� �Ի����ڰ� �� �� �ռ� ����� �޿��� ������ �޿��� �Բ� ���
SELECT ename, hiredate, sal
    , lag (sal) over (order by hiredate) as lag_sal
FROM emp
where job = 'SALESMAN';