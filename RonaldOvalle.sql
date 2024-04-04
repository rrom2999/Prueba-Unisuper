USE empresa;

SELECT * FROM departamento;
SELECT * FROM empleado;

-- 1. Obtener todos los apellidos de los empleados.
SELECT apellidos 
FROM empleado;

-- 2. Obtener los apellidos de los empleados sin repeticiones.
SELECT DISTINCT(apellidos)
FROM empleado;

-- 3. Obtener todos los datos de los empleados que se apellidan "Pérez".
-- NOTA: Buscando "Perez", no existe "Pérez".
SELECT *
FROM empleado
WHERE apellidos LIKE '%Perez%';

-- 4. Obtener todos los datos de los empleados que se apellidan "Pérez" o "López".
-- NOTA: Buscando "Perez" y "Lopez", no existe "Pérez" o "López".
SELECT *
FROM empleado
WHERE apellidos LIKE '%Perez%' 
	OR apellidos LIKE '%Lopez%';

-- 5. Obtener todos los datos de los empleados que trabajan para el departamento "Contabilidad".
SELECT emp.dpi, emp.nombre, emp.apellidos, emp.cod_depto
FROM empleado AS emp
INNER JOIN departamento AS dept
	ON emp.cod_depto = dept.codigo_departamento
WHERE dept.nombre_depto = "Contabilidad";

-- 6. Obtener todos los datos de los empleados que trabajan para el departamento de "Contabilidad" y "Gerencia General".
-- NOTA: Buscando "Gerencia", no existe "Gerencia General".
SELECT emp.dpi, emp.nombre, emp.apellidos, emp.cod_depto, dept.nombre_depto
FROM empleado AS emp
INNER JOIN departamento AS dept
	ON emp.cod_depto = dept.codigo_departamento
WHERE dept.nombre_depto = "Contabilidad" 
	OR dept.nombre_depto = "Gerencia";

-- 7. Obtener todos los datos de los empleados cuyo apellido comienza por la letra "P".
SELECT *
FROM empleado
WHERE apellidos LIKE "P%"
	OR apellidos LIKE "% P%";

-- 8. Obtener el presupuesto total de todos los departamentos.
SELECT SUM(presupuesto) as 'Presupuesto Total'
FROM departamento;

-- 9. Obtener el número de empleados por cada departamento.
SELECT dept.nombre_depto AS "Departamento", COUNT(*)
FROM empleado AS emp
INNER JOIN departamento AS dept
	ON emp.cod_depto = dept.codigo_departamento
GROUP BY dept.nombre_depto;

-- 10. Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento.
-- NOTA: Se uso LEFT JOIN con empleado para obtener todos los empleados en el caso exista alguno sin un departamento asociado.
SELECT emp.dpi, emp.nombre, emp.apellidos, dept.codigo_departamento, dept.nombre_depto, dept.presupuesto
FROM empleado as emp
LEFT JOIN departamento AS dept
	ON emp.cod_depto = dept.codigo_departamento;

-- 11. Obtener un listado completo de empleados, mostrando su nombre y apellido, junto con el nombre y presupuesto del departamento. Todo ordenado descendentemente por el apellido.
-- NOTA: Se uso LEFT JOIN con empleado para obtener todos los empleados en el caso exista alguno sin un departamento asociado.
SELECT emp.nombre AS "Nombre", emp.apellidos AS "Apellidos",  dept.nombre_depto AS "Departamento", dept.presupuesto AS "Presupuesto"
FROM empleado AS emp
LEFT JOIN departamento AS dept
	ON emp.cod_depto = dept.codigo_departamento
ORDER BY apellidos DESC;

-- 12. Obtener los nombres y apellidos de los empleados que trabajen en departamentos cuyo presupuesto sea mayor a 60,000.
SELECT emp.nombre, emp.apellidos, dept.nombre_depto, dept.presupuesto
FROM empleado AS emp
INNER JOIN departamento AS dept
	ON emp.cod_depto = dept.codigo_departamento
WHERE dept.presupuesto > 60000;

-- 13. Obtener los datos de los departamentos cuyo presupuesto es superior al presupuesto medio de todos los departamentos
SELECT *
FROM departamento
WHERE presupuesto > (
    SELECT AVG(presupuesto)
    FROM departamento
);

-- 14. Obtener los nombres de los departamentos que tienen más de 2 empleados
SELECT dept.nombre_depto AS "Departamento", COUNT(*) AS "Empleados"
FROM empleado AS emp
INNER JOIN departamento AS dept
	ON emp.cod_depto = dept.codigo_departamento
GROUP BY dept.nombre_depto
HAVING COUNT(*) > 2;

-- 15. Agregar un nuevo departamento "Control de calidad", con presupuesto de 40,000 y codigo 11. Y agregar un empleado vinculado a este departamento de nombre Esther Vásquez y con DNI: 28948238

INSERT INTO departamento(codigo_departamento,nombre_depto,presupuesto) VALUES (011,'Control de Calidad',40000);
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES (28948238,'Esther','Vasquez',11);










