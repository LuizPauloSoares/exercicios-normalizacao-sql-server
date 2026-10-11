CREATE DATABASE	InovaTec
GO
	
USE InovaTec
GO


CREATE TABLE tbl_professor(
	id_professor INT IDENTITY PRIMARY KEY,
	nome_professor VARCHAR(100) NOT NULL,
	email_professor VARCHAR(100) UNIQUE NOT NULL
) 
GO

CREATE TABLE tbl_curso(
	id_curso INT IDENTITY PRIMARY KEY,
	curso VARCHAR(100) NOT NULL,
	carga_horaria INT,
	id_professor_fk INT,
	FOREIGN KEY (id_professor_fk) REFERENCES tbl_professor (id_professor)
)
GO

CREATE TABLE tbl_aluno(
	id_aluno INT IDENTITY PRIMARY KEY,
	nome_aluno VARCHAR(100) NOT NULL,
	id_curso_fk INT,
	FOREIGN KEY (id_curso_fk) REFERENCES tbl_curso (id_curso)
)
GO
