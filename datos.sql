INSERT INTO medico (nombre, tipo_medico) VALUES
("jose hernandez","titular"),
("pedro gomez","titular"),
("maria diaz","interino"),
("diana perez","sustituto");

INSERT INTO empleado (nombre_empleado, cargo_empleado) values
("pepe perez", "ats"),
("maicol rueda","enfermeria"),
("juan rodriguez","celador"),
("juana vega", "administrativo");

INSERT INTO paciente (nombre_paciente) values
("diana mendez"),
("jose mendez"),
("rafael hidalgo");

INSERT INTO medico_paciente (id_medico,id_paciente) values
(1,1),
(1,2),
(2,2),
(3,3);


INSERT INTO horario_consulta (dia_consulta,hora_inicio,hora_fin,id_medico) values
("lunes","8:00:00","16:00:00",1),
("lunes","8:00:00","16:00:00",2),
("lunes","8:00:00","17:00:00",3),
("martes","7:30:00","15:30:00",1),
("miercoles","7:00:00","20:00:00",1),
("jueves","8:00:00","15:00:00",2),
("viernes","8:30:00","14:30:00",3),
("sabado","9:00:00","22:00:00",2);

INSERT INTO vacaciones (id_medico,id_empleado,fecha_inicio,fecha_fin) values
(null, 2, "2025-05-10", "2025-05-20" ),
(null, 2, "2025-05-10", "2025-05-20" );

INSERT INTO sustituciones (fecha,id_medico) values
("2025-03-14",4);
