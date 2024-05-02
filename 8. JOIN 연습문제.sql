

-- 사원의 first_name, employee_id, department_id
SELECT
    E.employee_id,
    E.first_name,
    E.department_id,
    D.department_name
FROM employees E
INNER JOIN DEPARTMENTS D
ON E.department_id = D.department_id
    AND E.manager_id = D.manager_id
ORDER BY E.employee_id
;

-- 사원의 first_name, employee_id, department_id
SELECT
    E.employee_id,
    E.first_name,
    department_id,
    D.department_name
FROM employees E
INNER JOIN DEPARTMENTS D
USING (department_id, manager_id)
ORDER BY E.employee_id
;

-- 1. employees테이블과 departments테이블을 inner join하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
SELECT 
    E.employee_id, E.first_name, E.last_name, E.department_id, D.department_name
FROM employees E
JOIN departments D
ON E.department_id = D.department_id
ORDER BY E.employee_id
;

-- 2. employees테이블과 departments테이블을 natural join하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
SELECT 
    E.employee_id, E.first_name, E.last_name, department_id, D.department_name
FROM employees E
NATURAL JOIN departments D
;

-- 3. employees테이블과 departments테이블을 using절을 사용하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
SELECT 
    E.employee_id, E.first_name, E.last_name, department_id, D.department_name
FROM employees E
JOIN departments D
USING (department_id)
;

-- 4. employees테이블과 departments테이블과 locations 테이블을 
--    join하여 employee_id, first_name, department_name, city를 조회하세요
SELECT 
    E.employee_id, E.first_name, D.department_name, L.city
FROM employees E
JOIN departments D
USING (department_id)
JOIN locations L
ON L.location_id = D.location_id
;

-- 5. employees 테이블과 jobs 테이블을 INNER JOIN하여 
-- 사원의 first_name, last_name, job_title을 조회하세요.
SELECT
    E.first_name, E.last_name, J.job_title
FROM employees E
JOIN jobs J
ON E.job_id = J.job_id
;
-- 6. employees 테이블과 departments 테이블을 INNER JOIN하여 
-- 부서명과 각 부서의 최대 급여값을 조회하세요.
SELECT
    D.department_name,
    MAX(E.salary)
FROM employees E
JOIN departments D
USING (department_id)
GROUP BY D.department_name
ORDER BY MAX(E.salary)DESC
;

-- 7. employees 테이블과 jobs 테이블을 INNER JOIN하여 
--    직무별 평균 급여와 직무 타이틀을 조회하세요.
SELECT
    AVG(E.salary) 평균급여,
    J.job_title 직무
FROM employees E
JOIN jobs J
USING (job_id)
GROUP BY J.job_title
ORDER BY AVG(E.salary)DESC
;
