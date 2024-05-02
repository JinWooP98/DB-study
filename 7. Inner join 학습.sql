

-- 사원의 사번, 이름, 부서번호, 부서명
SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp;

SELECT
    dept_cd,
    dept_nm
FROM tb_dept;


-- join
SELECT
    *
FROM tb_emp, tb_dept
WHERE tb_emp.dept_cd = tb_dept.dept_cd
;

-- 조인 기초 테스트 데이터
CREATE TABLE TEST_A (
    id NUMBER(10) PRIMARY KEY
    , content VARCHAR2(200)
);

CREATE TABLE TEST_B (
    b_id NUMBER(10) PRIMARY KEY
    , reply VARCHAR2(100)
    , a_id NUMBER(10)
);

INSERT INTO TEST_A  VALUES (1, 'aaa');
INSERT INTO TEST_A  VALUES (2, 'bbb');
INSERT INTO TEST_A  VALUES (3, 'ccc');

INSERT INTO TEST_B  VALUES (1, 'ㄱㄱㄱ', 1);
INSERT INTO TEST_B  VALUES (2, 'ㄴㄴㄴ', 1);
INSERT INTO TEST_B  VALUES (3, 'ㄷㄷㄷ', 2);
INSERT INTO TEST_B  VALUES (4, 'ㄹㄹㄹ', 3);

SELECT * FROM test_a;
SELECT * FROM test_b;

-- 조인은 원리는 곱하기 연산
-- Cartesian production : product 연산
-- Cross join : 가능한 모든 경우의 수를 매칭하여 조회
SELECT
    *
FROM test_a, test_b;

-- INNER JOIN
-- 두 테이블 간에 연관컬럼을 이용하여
-- 관계가 있는 데이터를 매칭하여 조인
SELECT
    *
FROM test_a, test_b
WHERE test_a.id = test_b.a_id;


SELECT
    E.emp_no,
    E.emp_nm,
    E.addr,

    D.dept_cd,
    D.dept_nm
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd
;

-- 사원의 사원번호와 취득한 자격증명을 조회
SELECT
    E.emp_no AS 사원번호,
    E.emp_nm AS 사원명,
    E.sex_cd AS 성별,
    EC.certi_cd AS 자격증번호,
    C.certi_nm AS 자격증명,
    EC.acqu_de AS 취득일자
    
FROM tb_emp E, tb_emp_certi EC, tb_certi C
WHERE E.emp_no = EC.emp_no
    AND EC.certi_cd = C.certi_cd
;

-- 사원의 사원번호와 취득한 자격증명, 부서명을 조회
SELECT
    E.emp_no AS 사원번호,
    E.emp_nm AS 사원명,
    D.dept_nm AS 부서명,
    E.sex_cd AS 성별,
    EC.certi_cd AS 자격증번호,
    C.certi_nm AS 자격증명,
    EC.acqu_de AS 취득일자
    
FROM tb_emp E, tb_emp_certi EC, tb_certi C, tb_dept D
WHERE E.emp_no = EC.emp_no
    AND EC.certi_cd = C.certi_cd
    AND E.dept_cd = D.dept_cd
;

-- 부서별로 총 자격증 취득 개수를 조회
SELECT
 D.dept_cd,
 D.dept_nm,
 COUNT(EC.certi_cd)
FROM tb_dept D, tb_emp_certi EC, tb_emp E
WHERE d.dept_cd = e.dept_cd
    AND ec.emp_no = e.emp_no
GROUP by D.dept_cd, D.dept_nm
ORDER BY D.dept_cd
;

-- # INNER JOIN
-- 1. 2개 이상의 테이블이 공통된 컬럼에 의해 논리적으로 결합되는 조인기법입니다.
-- 2. WHERE절에 사용된 컬럼들이 동등연산자(=)에 의해 조인됩니다.

-- 용인시에 사는 사원의 사원번호, 사원명, 주소, 부서코드, 부서명을 조회하고 싶다.
SELECT
    E.emp_no,
    E.emp_nm,
    E.addr,
    E.dept_cd,
    D.dept_nm
FROM tb_emp E, tb_dept D
WHERE e.addr Like '%용인%'
    AND E.dept_cd = D.dept_cd
;
