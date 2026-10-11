CREATE DATABASE Biblioteca
GO

USE Biblioteca 
GO

CREATE TABLE tbl_editora(
	id_editora INT IDENTITY PRIMARY KEY ,
	nome_editora VARCHAR(100) UNIQUE NOT NULL,
	cidade VARCHAR(100) NOT NULL
)
GO

CREATE TABLE tbl_categoria(
	id_categoria INT IDENTITY PRIMARY KEY,
	nome_categoria VARCHAR(100)
)
GO

CREATE TABLE tbl_livro(
	id_livro INT IDENTITY PRIMARY KEY,
	titulo VARCHAR(100),
	ano_lancamento INT NOT NULL,
	id_editora_fk INT NOT NULL,
	id_categoria_fk INT NOT NULL,
	FOREIGN KEY (id_editora_fk) REFERENCES tbl_editora (id_editora),
	FOREIGN KEY (id_categoria_fk) REFERENCES tbl_categoria (id_categoria)
)
GO