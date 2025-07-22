CREATE database hospital;
use hospital;

CREATE table medico(
	id_medico INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(100),
	tipo_medico varchar(50)
);

CREATE table empleado(
	id_empleado int primary key auto_increment,
	nombre_empleado varchar(100),
	cargo_empleado varchar(100)
);

CREATE table paciente(
	id_paciente int primary key auto_increment,
	nombre_paciente varchar(100)
);

CREATE table medico_paciente(
	id_medico int,
	id_paciente int,
	foreign key (id_medico) references medico(id_medico),
	foreign key (id_paciente) references paciente(id_paciente)
);


CREATE table vacaciones (
	ref_vacaciones int primary key auto_increment,
	id_medico int,
	id_empleado int,
	fecha_inicio date,
	fecha_fin date,
	foreign key (id_medico) references medico(id_medico),
	foreign key (id_empleado) references empleado(id_empleado)
);

CREATE table horario_consulta(
	dia_consulta varchar (50),
	hora_inicio time,
	hora_fin time,
	id_medico int,
	foreign key (id_medico) references medico(id_medico)
);

CREATE table sustituciones(
	fecha date,
	id_medico int,
	foreign key (id_medico) references medico(id_medico)
);