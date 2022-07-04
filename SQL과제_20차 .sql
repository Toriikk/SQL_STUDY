-- 사원들의 급여와 같은 매니저를 두고 있는 사원들의 SALARY 중 최댓값 구하기 
SELECT mgr, ename, sal
    , max(sal) over (PARTITION BY MGR) AS MAX_SAL
FROM emp;

-- INLINE VIEW를 이용해 파티션별 최댓값을 가진 행만 추출하기 
SELECT mgr, ename, sal
FROM (select mgr, ename, sal
        , max(sal) over (partition by mgr) as max_sal
        FROM EMP)
WHERE SAL = MAX_SAL;

-- 이전 예제는 쿼리 성능 저하될 수 있음
-- 아래와 같이 순위 함수를 쓰는 것이 바람직
SELECT mgr, ename, sal
FROM (select mgr, ename, sal
        , rank () over (partition by mgr order by sal desc) as sal_rk
        from emp)
    where sal_rk = 1;

-- 사원들의 급여와 같은 매니저를 두고 있는 사원들을 입사일자를 기준으로 정렬하고 
-- SALARY 최솟값을 함께 구하기
SELECT mgr, ename, hiredate, sal
        , min (sal) over (partition by mgr order by hiredate) as min_sal
FROM emp;

--EMP테이블에서 같은 매니저를 두고 있는 사원들의 평균 SALARY 구하기
-- 조건 : 같은 매니저 내에서 자기 바로 앞의 사번과 바라ㅗ 뒤의 사번인 직원만을 대상으로 함 
SELECT mgr, ename, hiredate, sal
    , round(avg (sal) over (partition by mgr order by hiredate
        rows between 1 preceding and 1 following)) as avg_Sal
FROM emp;

-- 사원들을 급여 기준으로 정렬, 급여보다 50 이하가 적거나 150 이하로 많은 급여를 받는 인원수 출력 
SELECT ename, sal
    , count (*) over (order by sal range between 50 preceding and 150
    following) as emp_cnt
FROM emp;

-- 부서별 직원들을 연봉이 높은 순서부터 정렬, 파티션 내에서 가장 먼저 나온 값 출력하기
SELECT deptno, ename, sal
    , first_value (ename) over (partition by deptno order by sal desc
        rows unbounded preceding) as ename_fv
FROM emp;

-- 위의 문장에서 같은 값을 가진 FIRST_VALUE를 처리하기 위해 ORDER BY 정렬 조건 추가 
SELECT deptno, ename, sal
    , first_value (ename) over (partition by deptno order by sal desc, ename
            rows unbounded preceding) as ename_fv
FROM emp;

-- 부서별 직원들을 연봉이 높은 순서부터 정렬하고, 파티션 내에서 가장 마지막에 나온 값 출력
SELECT deptno, ename, sal
     , last_value (ename) over (partition by deptno order by sal desc, ename
            rows between current row and unbounded following) as ename_lv
FROM emp;

-- 직원들을 입사일자가 빠른 기준으로 정렬하고 
-- 본인보다 입사일자가 한 명 앞선 사원의 급여를 본인의 급여와 함께 출력
SELECT ename, hiredate, sal
    , lag (sal) over (order by hiredate) as lag_sal
FROM emp
where job = 'SALESMAN';