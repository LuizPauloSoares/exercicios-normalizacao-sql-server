CREATE DATABASE Clinica
GO

USE Clinica

CREATE TABLE tbl_paciente(
	id_paciente INT IDENTITY PRIMARY KEY,
	nome_paciente VARCHAR(100) NOT NULL,
	cpf CHAR (11) UNIQUE NOT NULL
)
GO

CREATE TABLE tbl_especialidade(
	id_especialidade INT IDENTITY PRIMARY KEY,
	especialidade VARCHAR(100) UNIQUE NOT NULL
)
GO

CREATE TABLE tbl_medico(
	id_medico INT IDENTITY PRIMARY KEY,
	nome_medico VARCHAR(100) NOT NULL,
	crm VARCHAR(15) UNIQUE NOT NULL,
	id_especialidade_fk INT NOT NULL,
	FOREIGN KEY(id_especialidade_fk)REFERENCES tbl_especialidade(id_especialidade)
)
GO

CREATE TABLE tbl_sala(
	id_sala INT IDENTITY PRIMARY KEY,
	nome_sala VARCHAR(100)NOT NULL,
	numero_sala INT UNIQUE NOT NULL
)
GO

CREATE TABLE tbl_consulta(
	id_consulta INT IDENTITY PRIMARY KEY,
	data_consulta DATE NOT NULL,
	id_paciente_fk INT NOT NULL,
	id_medico_fk INT NOT NULL,
	tbl_sala_fk INT NOT NULL,
	FOREIGN KEY(id_paciente_fk) REFERENCES tbl_paciente (id_paciente),
	FOREIGN KEY(id_medico_fk)REFERENCES tbl_medico(id_medico),
	FOREIGN KEY(tbl_sala_fk)REFERENCES tbl_sala(id_sala)

)
GO