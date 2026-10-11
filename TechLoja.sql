CREATE DATABASE TechLoja
GO

USE TechLoja
GO

CREATE TABLE tbl_cliente(
	id_cliente INT IDENTITY PRIMARY KEY,
	nome_cliente VARCHAR(100) NOT NULL,
	email_cliente VARCHAR(100) UNIQUE NOT NULL
)
GO

CREATE TABLE tbl_produto(
	id_produto INT IDENTITY PRIMARY KEY,
	produto VARCHAR(100) NOT NULL,
	preco_unitario DECIMAL(10,2) NOT NULL,
	quantidade_disponivel INT NOT NULL
)
GO

CREATE TABLE tbl_pedidos(
	id_pedido INT IDENTITY PRIMARY KEY,
	data_pedido DATE NOT NULL,
	id_cliente_fk INT NOT NULL,
	FOREIGN KEY(id_cliente_fk)REFERENCES  tbl_cliente(id_cliente)
)	
GO

CREATE TABLE tbl_pedidoProduto(
	id_pedidoProduto INT IDENTITY PRIMARY KEY,
	quantidade INT NOT NULL,
	preco_unitario DECIMAL(10,2) NOT NULL,
	id_produto_fk INT NOT NULL,
	id_pedido_fk INT NOT NULL,
	FOREIGN KEY(id_produto_fk)REFERENCES tbl_produto (id_produto),
	FOREIGN KEY(id_pedido_fk)REFERENCES tbl_pedidos(id_pedido)
)
GO