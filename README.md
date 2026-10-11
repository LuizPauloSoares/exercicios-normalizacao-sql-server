<div align="center">

[🇧🇷 Português](README.md) | [🇺🇸 English](README.en.md)

</div>

# 🗄️ Exercícios de Normalização de Banco de Dados (SQL Server)

Exercícios práticos de **normalização (1FN, 2FN e 3FN)** com modelagem relacional e scripts de criação de tabelas em **SQL Server (T-SQL)**.

![Status](https://img.shields.io/badge/status-em%20andamento-yellow)
![SQL Server](https://img.shields.io/badge/SQL%20Server-T--SQL-red)
![License](https://img.shields.io/badge/license-MIT-blue)

---

## 📌 Sumário

- [Contatos](#-contatos)
- [Sobre o projeto](#-sobre-o-projeto)
- [Tecnologias utilizadas](#-tecnologias-utilizadas)
- [Como o sistema funciona](#-como-o-sistema-funciona)
- [O que o código faz](#-o-que-o-código-faz)
- [Estrutura de dados](#-estrutura-de-dados)
- [Estrutura do repositório](#-estrutura-do-repositório)
- [Pré-requisitos](#-pré-requisitos)
- [Como clonar o projeto](#-como-clonar-o-projeto)
- [Instalação e configuração](#-instalação-e-configuração)
- [Exemplos de uso](#-exemplos-de-uso)
- [Screenshots e diagramas](#-screenshots-e-diagramas)
- [Status do projeto](#-status-do-projeto)
- [Roadmap](#-roadmap)
- [Licença](#-licença)
- [Autor e créditos](#-autor-e-créditos)

---

## 📬 Contatos

- 📧 E-mail: `seu-email@exemplo.com`
- 📸 Instagram: [@seu-usuario](https://instagram.com/seu-usuario)
- 💼 LinkedIn: [seu-perfil](https://linkedin.com/in/seu-perfil)
- 🐙 GitHub: [seu-usuario](https://github.com/seu-usuario)

---

## 📖 Sobre o projeto

Cada exercício parte de uma **tabela única, com dados repetidos**, e pede para reorganizá-la em tabelas separadas, eliminando redundâncias e anomalias de **inserção, atualização e exclusão**.

Para cada exercício foram feitos:

1. Identificação dos problemas de redundância e anomalias.
2. Divisão em tabelas por entidade.
3. Definição de chaves primárias (PK) e estrangeiras (FK).
4. Diagrama lógico (MER).
5. Script SQL de criação das tabelas.

---

## 🛠️ Tecnologias utilizadas

- **SQL Server** (T-SQL)
- **SSMS** (SQL Server Management Studio)
- **Git** e **GitHub**

---

## ⚙️ Como o sistema funciona

A normalização é aplicada em três etapas:

- **1FN:** cada campo guarda um único valor (sem listas nem repetição).
- **2FN:** todo campo depende da chave primária inteira.
- **3FN:** nenhum campo depende de outro campo que não seja chave (sem dependência transitiva).

Regra usada para posicionar as chaves estrangeiras:

- Em relacionamentos **1:N**, a FK fica no lado **N** (quem aponta para o "um").
- Em relacionamentos **N:N**, cria-se uma **tabela associativa** com as duas FKs.

---

## 💻 O que o código faz

Cada arquivo `.sql`:

- Cria o banco de dados do exercício.
- Cria as tabelas na ordem correta (tabelas referenciadas primeiro).
- Define `PRIMARY KEY` com `IDENTITY`, `FOREIGN KEY`, `UNIQUE` e `NOT NULL`.

---

## 🧩 Estrutura de dados

| # | Exercício | Banco | Tabelas | Relacionamentos |
|---|---|---|---|---|
| 1 | Escola técnica | `InovaTec` | `tbl_professor`, `tbl_curso`, `tbl_aluno` | Professor 1:N Curso · Curso 1:N Aluno |
| 2 | Cadastro de clientes | `TechStore` | `tbl_estado`, `tbl_cidade`, `tbl_endereco`, `tbl_cliente` | Estado 1:N Cidade · Cidade 1:N Endereço · Endereço 1:N Cliente |
| 3 | Biblioteca | `Biblioteca` | `tbl_editora`, `tbl_categoria`, `tbl_livro` | Editora 1:N Livro · Categoria 1:N Livro |
| 4 | Clínica médica | `Clinica` | `tbl_paciente`, `tbl_especialidade`, `tbl_medico`, `tbl_sala`, `tbl_consulta` | Especialidade 1:N Médico · Paciente 1:N Consulta · Médico 1:N Consulta · Sala 1:N Consulta |
| 5 | Loja de pedidos | `TechLoja` | `tbl_cliente`, `tbl_produto`, `tbl_pedidos`, `tbl_pedidoProduto` | Cliente 1:N Pedido · Pedido N:N Produto (via `tbl_pedidoProduto`) |

### Decisões de modelagem

- **Clínica:** a sala foi tratada como entidade própria e ligada à consulta, pois a sala é um recurso físico que pode variar por atendimento.
- **Loja:** `tbl_pedidoProduto` guarda `quantidade` e `preco_unitario` (preço cobrado na compra), preservando o histórico caso o preço do produto mude. O total do pedido não é armazenado, pois pode ser calculado.

---

## 📁 Estrutura do repositório

```
.
├── sql/
│   ├── InovaTec.sql
│   ├── TechStore.sql
│   ├── Biblioteca.sql
│   ├── Clinica.sql
│   └── TechLoja.sql
├── docs/
│   └── (diagramas MER)
├── README.md
├── README.en.md
└── LICENSE
```

---

## ✅ Pré-requisitos

- SQL Server (Express, Developer ou outra edição)
- SSMS ou Azure Data Studio
- Git

---

## 📥 Como clonar o projeto

```bash
git clone https://github.com/seu-usuario/exercicios-normalizacao-sql-server.git
cd exercicios-normalizacao-sql-server
```

---

## 🔧 Instalação e configuração

1. Abra o **SSMS** e conecte na sua instância do SQL Server.
2. Abra um dos arquivos da pasta `sql/` (por exemplo, `InovaTec.sql`).
3. Execute o script completo (**F5**).
4. No **Pesquisador de Objetos**, atualize e confira o banco e as tabelas criadas.
5. Repita para os demais exercícios.

> Cada script cria o próprio banco. Se o banco já existir, apague-o antes ou remova a linha `CREATE DATABASE`.

---

## 🚀 Exemplos de uso

Ordem de inserção: sempre das tabelas referenciadas para as que referenciam (por exemplo, estado → cidade → endereço → cliente).

Total de cada pedido no exercício da loja:

```sql
SELECT id_pedido_fk,
       SUM(quantidade * preco_unitario) AS total
FROM tbl_pedidoProduto
GROUP BY id_pedido_fk;
```

---

## 🖼️ Screenshots e diagramas

Adicione os diagramas MER na pasta `docs/` e referencie aqui:

```
![MER InovaTec](docs/mer-inovatec.png)
```

---

## 📊 Status do projeto

🚧 **Em andamento.** Scripts SQL concluídos; diagramas MER e documentação das anomalias em elaboração.

---

## 🗺️ Roadmap

- [ ] Adicionar diagramas MER de cada exercício
- [ ] Documentar as anomalias de cada tabela original
- [ ] Adicionar scripts de `INSERT` com dados de exemplo
- [ ] Adicionar consultas (`SELECT` com `JOIN`)
- [ ] Novos exercícios de normalização

---

## 📄 Licença

Distribuído sob a licença **MIT**. Veja o arquivo `LICENSE` para mais informações.

---

## 👤 Autor e créditos

- **Luiz**: modelagem e scripts
- Situações-problema baseadas em atividades do curso técnico.
