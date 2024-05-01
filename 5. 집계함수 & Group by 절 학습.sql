SELECT * FROM tb_sal_his;

-- 집계 함수 (다중행 함수)
-- 여러 행을 묶어서 한번에 함수를 적용

SELECT
    COUNT(*) AS "지급 횟수",
    SUM(pay_amt) "지급 총액",
    AVG(pay_amt) "평균 지급액",
    MAX(pay_amt) "최대 지급액",
    MIN(pay_amt) "최소 지급액"
FROM tb_sal_his
;

SELECT
    SUBSTR(emp_nm, 1, 1)
FROM tb_emp
;

SELECT
    *
FROM tb_emp
;

SELECT
    COUNT(*)
FROM tb_emp
;

SELECT
    emp_nm
FROM tb_emp
;

SELECT
   COUNT(emp_nm)
FROM tb_emp
;

SELECT
    emp_nm
FROM tb_emp
WHERE emp_nm LIKE '김%'
;

SELECT
    COUNT(emp_nm)
FROM tb_emp
WHERE emp_nm LIKE '김%'
;

SELECT
    direct_manager_emp_no
FROM tb_emp;

SELECT
    COUNT(direct_manager_emp_no)
FROM tb_emp;

SELECT
    COUNT(emp_no) "총 사원수",
    MIN(birth_de) "최연장자 생일",
    MAX(birth_de) "최연소자 생일"
FROM tb_emp;

-- 부서별로 사원수가 몇명인지
-- 부서별로 최연장자의 생일은 언젠지?

-- GROUP BY : 지정된 컬럼으로 소그룹화 한 후
-- 각 그룹별로 집계함수를 각각 적용

SELECT
    emp_no,
    emp_nm,
    birth_de,
    dept_cd
FROM tb_emp
ORDER BY dept_cd
;

SELECT
    dept_cd,
    COUNT(*) "부서별 사원수",
    MIN(birth_de) "부서별 최연장자"
FROM tb_emp
GROUP BY dept_cd;

SELECT
    emp_no, 
    TO_CHAR(SUM(pay_amt), 'L999,999,999') "사원별 총급여액",
    TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999') "사원별 평균급여액",
    TO_CHAR(MAX(pay_amt), 'L999,999,999') "사원별 최고급여액",
    COUNT(pay_de) "급여 수령횟수"
FROM tb_sal_his
GROUP BY emp_no
ORDER BY emp_no;

SELECT
    emp_no
FROM tb_emp;

SELECT
    COUNT(*)
FROM tb_emp;

-- GROUP BY 절에 사용한 컬럼만
-- SELECT에서 직접조회 가능
SELECT
    emp_no,
    COUNT(*)
FROM tb_emp
GROUP BY emp_no
;

SELECT
    dept_cd, sex_cd, COUNT(*), MAX(birth_De)
FROM tb_emp
GROUP BY dept_cd, sex_cd
ORDER BY dept_cd;
