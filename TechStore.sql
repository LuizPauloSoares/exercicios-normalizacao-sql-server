CREATE DATABASE TechStore
GO

USE TechStore
GO

CREATE TABLE tbl_estado(
	id_estado INT IDENTITY PRIMARY KEY,
	uf CHAR(2) NOT NULL UNIQUE,
	nome_estado VARCHAR(50) NOT NULL UNIQUE
)
GO

CREATE TABLE tbl_cidade(
	id_cidade INT IDENTITY PRIMARY KEY,
	nome_cidade VARCHAR(100) NOT NULL,
	id_estado_fk INT NOT NULL,
	FOREIGN KEY (id_estado_fk) REFERENCES tbl_estado(id_estado)
)
GO

CREATE TABLE tbl_endereco(
	id_endereco INT IDENTITY PRIMARY KEY,
	logradouro VARCHAR(100) NOT NULL,
	id_cidade_fk INT NOT NULL,
	FOREIGN KEY (id_cidade_fk) REFERENCES tbl_cidade (id_cidade) 
)
GO

CREATE TABLE tbl_cliente(
	id_cliente INT IDENTITY PRIMARY KEY,
	nome_cliente VARCHAR(100) NOT NULL,
	cpf CHAR(11) UNIQUE NOT NULL,
	numero_casa VARCHAR(50) NOT NULL,
	id_endereco_fk INT NOT NULL,
	FOREIGN KEY  (id_endereco_fk) REFERENCES tbl_endereco (id_endereco)
)
GO

