

-- ����� first_name, employee_id, department_id
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

-- ����� first_name, employee_id, department_id
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

-- 1. employees���̺�� departments���̺��� inner join�Ͽ�
--    ���, first_name, last_name, department_id, department_name�� ��ȸ�ϼ���.
SELECT 
    E.employee_id, E.first_name, E.last_name, E.department_id, D.department_name
FROM employees E
JOIN departments D
ON E.department_id = D.department_id
ORDER BY E.employee_id
;

-- 2. employees���̺�� departments���̺��� natural join�Ͽ�
--    ���, first_name, last_name, department_id, department_name�� ��ȸ�ϼ���.
SELECT 
    E.employee_id, E.first_name, E.last_name, department_id, D.department_name
FROM employees E
NATURAL JOIN departments D
;

-- 3. employees���̺�� departments���̺��� using���� ����Ͽ�
--    ���, first_name, last_name, department_id, department_name�� ��ȸ�ϼ���.
SELECT 
    E.employee_id, E.first_name, E.last_name, department_id, D.department_name
FROM employees E
JOIN departments D
USING (department_id)
;

-- 4. employees���̺�� departments���̺�� locations ���̺��� 
--    join�Ͽ� employee_id, first_name, department_name, city�� ��ȸ�ϼ���
SELECT 
    E.employee_id, E.first_name, D.department_name, L.city
FROM employees E
JOIN departments D
USING (department_id)
JOIN locations L
ON L.location_id = D.location_id
;

-- 5. employees ���̺�� jobs ���̺��� INNER JOIN�Ͽ� 
-- ����� first_name, last_name, job_title�� ��ȸ�ϼ���.
SELECT
    E.first_name, E.last_name, J.job_title
FROM employees E
JOIN jobs J
ON E.job_id = J.job_id
;
-- 6. employees ���̺�� departments ���̺��� INNER JOIN�Ͽ� 
-- �μ���� �� �μ��� �ִ� �޿����� ��ȸ�ϼ���.
SELECT
    D.department_name,
    MAX(E.salary)
FROM employees E
JOIN departments D
USING (department_id)
GROUP BY D.department_name
ORDER BY MAX(E.salary)DESC
;

-- 7. employees ���̺�� jobs ���̺��� INNER JOIN�Ͽ� 
--    ������ ��� �޿��� ���� Ÿ��Ʋ�� ��ȸ�ϼ���.
SELECT
    AVG(E.salary) ��ձ޿�,
    J.job_title ����
FROM employees E
JOIN jobs J
USING (job_id)
GROUP BY J.job_title
ORDER BY AVG(E.salary)DESC
;
