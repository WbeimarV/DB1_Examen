# El pryecto propone una base de datos para almanecar y gestionar informaciòn de un hospital la cual incluye:
- Datos de mèdicos y sus horarios y tiempos de sustituciòn
- Datos de empleados
- Datos de pacientes
- Sistema de verificaciòn de vacaciones
- Relaciòn entre medicos y pacientes, asì como mèdicos y empleados segùn sus vacaciones y horarios.

## Para verificar el funcionamiento de la base de datos:
1. Se corre el còdigo encontrado en "estructura.sql" el cual permite crear la base de datos y las diferentes tablas
2. Se corre el còdigo encontrado en "datos.sql" el cuàl permite insertar datos dentro de las tablas para realizar diferentes consultas

## A continuacuòn se muestran algunas consultas que se pueden realizar segùn nuestra base de datos ya creada previamente.


-- numero de pacientes atendidos por cada medico

SELECT m.id_medico, m.nombre,
(select COUNT(mp2.id_medico) 
		FROM medico_paciente mp2
		WHERE mp2.id_medico=m.id_medico) as cantidad_pacientes	
FROM medico m;

-- total de dias de vacaciones planificadas y disfrutadas por cada empleado

SELECT (fecha_fin-fecha_inicio) as dias_vacaiciones, e.nombre_empleado, e.cargo_empleado 
FROM vacaciones v
join empleado e on e.id_empleado  = v.id_empleado; --Se debe tener en cuenta que se habla solo de empleados y no de médicos

-- medicos con mayor canditdad de horas de consulta a la semana

SELECT m.nombre, 
(SELECT SUM( (hc.hora_fin - hc.hora_inicio)/10 )
	from horario_consulta hc  
	WHERE hc.id_medico = m.id_medico) as horas_consulta
FROM medico m;

-- numero de sustituciones realizadas por cada mèdico sustituto
SELECT m.id_medico, m.nombre,
(select COUNT(s.id_medico) 
		FROM sustituciones s
		WHERE s.id_medico=m.id_medico) as cantidad_sustituciones
FROM medico m
WHERE m.tipo_medico = 'sustituto';


-- horas totales de consulta por medico por dia de la semana

SELECT m.nombre, (hc.hora_fin - hc.hora_inicio)/10 as horas, hc.dia_consulta 
FROM medico m
join horario_consulta hc on hc.id_medico = m.id_medico;


--medico con mayor cantidad de pacientes asignados

SELECT m.id_medico, m.nombre,
(select COUNT(mp2.id_medico) 
		FROM medico_paciente mp2
		WHERE mp2.id_medico=m.id_medico) as cantidad_pacientes	
FROM medico m
order by cantidad_pacientes desc
limit 1;


-- empleados con mas de 10 dias de vacaciones asignadas

SELECT (fecha_fin-fecha_inicio) as dias_vacaiciones, e.nombre_empleado, e.cargo_empleado 
FROM vacaciones v
join empleado e on e.id_empleado  = v.id_empleado
WHERE (fecha_fin-fecha_inicio) > 10; -- aplica solo para empleados, no para mèdicos pues estos tienen sus propias consultas

-- promedio de horas de consuta por medico por dia de la semana

SELECT m.nombre, 
(SELECT SUM( (hc.hora_fin - hc.hora_inicio)/10/7 )
	from horario_consulta hc  
	WHERE hc.id_medico = m.id_medico) as promedio_horas
FROM medico m;

--medicos con mas de 5 pacientes y total de horas de consulta a la semana

SELECT m.id_medico, m.nombre,
(select COUNT(mp2.id_medico) 
		FROM medico_paciente mp2
		WHERE mp2.id_medico=m.id_medico) as cantidad_pacientes,
		(SELECT SUM( (hc.hora_fin - hc.hora_inicio)/10 )
	from horario_consulta hc  
	WHERE hc.id_medico = m.id_medico) as horas_consulta
FROM medico m
WHERE (select COUNT(mp2.id_medico) 
		FROM medico_paciente mp2
		WHERE mp2.id_medico=m.id_medico) > 5; -- En este caso para verificar quesi funciona se puede cambiar el 5 por 0, ya que ningùn mèdico tiene màs de 5 pacientes

-- total de dias de vacaciones planificadas y disfrutadas por cada medico

SELECT (fecha_fin-fecha_inicio) as dias_vacaiciones, m.nombre, m.tipo_medico  
FROM vacaciones v
join medico m  on m.id_medico  = v.id_medico ; -- se hace una separaciòn entre mèdicos y empleados

-- total de pacientes por cada mèdico



