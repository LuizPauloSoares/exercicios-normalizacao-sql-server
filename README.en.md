<div align="center">

[🇧🇷 Português](README.md) | [🇺🇸 English](README.en.md)

</div>

# 🗄️ Database Normalization Exercises (SQL Server)

Hands-on **normalization (1NF, 2NF and 3NF)** exercises with relational modeling and table creation scripts in **SQL Server (T-SQL)**.

![Status](https://img.shields.io/badge/status-in%20progress-yellow)
![SQL Server](https://img.shields.io/badge/SQL%20Server-T--SQL-red)
![License](https://img.shields.io/badge/license-MIT-blue)

---

## 📌 Table of Contents

- [Contact](#-contact)
- [About the project](#-about-the-project)
- [Technologies used](#-technologies-used)
- [How it works](#-how-it-works)
- [What the code does](#-what-the-code-does)
- [Data structure](#-data-structure)
- [Repository structure](#-repository-structure)
- [Prerequisites](#-prerequisites)
- [How to clone](#-how-to-clone)
- [Installation and setup](#-installation-and-setup)
- [Usage examples](#-usage-examples)
- [Screenshots and diagrams](#-screenshots-and-diagrams)
- [Project status](#-project-status)
- [Roadmap](#-roadmap)
- [License](#-license)
- [Author and credits](#-author-and-credits)

---

## 📬 Contact

- 📧 Email: `your-email@example.com`
- 📸 Instagram: [@your-username](https://instagram.com/your-username)
- 💼 LinkedIn: [your-profile](https://linkedin.com/in/your-profile)
- 🐙 GitHub: [your-username](https://github.com/your-username)

---

## 📖 About the project

Each exercise starts from a **single table with repeated data** and asks you to reorganize it into separate tables, removing redundancy and **insertion, update and deletion anomalies**.

For each exercise the following were done:

1. Identification of redundancy problems and anomalies.
2. Split into tables by entity.
3. Definition of primary keys (PK) and foreign keys (FK).
4. Logical diagram (ERD).
5. SQL script to create the tables.

---

## 🛠️ Technologies used

- **SQL Server** (T-SQL)
- **SSMS** (SQL Server Management Studio)
- **Git** and **GitHub**

---

## ⚙️ How it works

Normalization is applied in three steps:

- **1NF:** each field holds a single value (no lists, no repetition).
- **2NF:** every field depends on the entire primary key.
- **3NF:** no field depends on another non-key field (no transitive dependency).

Rule used to place foreign keys:

- In **1:N** relationships, the FK goes on the **N** side (the side that points to the "one").
- In **N:N** relationships, an **associative table** holds both FKs.

---

## 💻 What the code does

Each `.sql` file:

- Creates the exercise database.
- Creates the tables in the correct order (referenced tables first).
- Defines `PRIMARY KEY` with `IDENTITY`, `FOREIGN KEY`, `UNIQUE` and `NOT NULL`.

---

## 🧩 Data structure

| # | Exercise | Database | Tables | Relationships |
|---|---|---|---|---|
| 1 | Technical school | `InovaTec` | `tbl_professor`, `tbl_curso`, `tbl_aluno` | Teacher 1:N Course · Course 1:N Student |
| 2 | Customer registry | `TechStore` | `tbl_estado`, `tbl_cidade`, `tbl_endereco`, `tbl_cliente` | State 1:N City · City 1:N Address · Address 1:N Customer |
| 3 | Library | `Biblioteca` | `tbl_editora`, `tbl_categoria`, `tbl_livro` | Publisher 1:N Book · Category 1:N Book |
| 4 | Medical clinic | `Clinica` | `tbl_paciente`, `tbl_especialidade`, `tbl_medico`, `tbl_sala`, `tbl_consulta` | Specialty 1:N Doctor · Patient 1:N Appointment · Doctor 1:N Appointment · Room 1:N Appointment |
| 5 | Order store | `TechLoja` | `tbl_cliente`, `tbl_produto`, `tbl_pedidos`, `tbl_pedidoProduto` | Customer 1:N Order · Order N:N Product (via `tbl_pedidoProduto`) |

### Modeling decisions

- **Clinic:** the room is its own entity linked to the appointment, since a room is a physical resource that can vary per appointment.
- **Store:** `tbl_pedidoProduto` stores `quantidade` and `preco_unitario` (price charged at purchase time), preserving history if the product price changes. The order total is not stored because it can be calculated.

---

## 📁 Repository structure

```
.
├── sql/
│   ├── InovaTec.sql
│   ├── TechStore.sql
│   ├── Biblioteca.sql
│   ├── Clinica.sql
│   └── TechLoja.sql
├── docs/
│   └── (ERD diagrams)
├── README.md
├── README.en.md
└── LICENSE
```

---

## ✅ Prerequisites

- SQL Server (Express, Developer or any other edition)
- SSMS or Azure Data Studio
- Git

---

## 📥 How to clone

```bash
git clone https://github.com/your-username/exercicios-normalizacao-sql-server.git
cd exercicios-normalizacao-sql-server
```

---

## 🔧 Installation and setup

1. Open **SSMS** and connect to your SQL Server instance.
2. Open one of the files in the `sql/` folder (for example, `InovaTec.sql`).
3. Run the whole script (**F5**).
4. In **Object Explorer**, refresh and check the database and tables created.
5. Repeat for the other exercises.

> Each script creates its own database. If it already exists, drop it first or remove the `CREATE DATABASE` line.

---

## 🚀 Usage examples

Insertion order: always from referenced tables to referencing ones (for example, state → city → address → customer).

Total of each order in the store exercise:

```sql
SELECT id_pedido_fk,
       SUM(quantidade * preco_unitario) AS total
FROM tbl_pedidoProduto
GROUP BY id_pedido_fk;
```

---

## 🖼️ Screenshots and diagrams

Add the ERD diagrams to the `docs/` folder and reference them here:

```
![InovaTec ERD](docs/mer-inovatec.png)
```

---

## 📊 Project status

🚧 **In progress.** SQL scripts are done; ERD diagrams and anomaly write-ups are being prepared.

---

## 🗺️ Roadmap

- [ ] Add ERD diagrams for each exercise
- [ ] Document the anomalies of each original table
- [ ] Add `INSERT` scripts with sample data
- [ ] Add queries (`SELECT` with `JOIN`)
- [ ] New normalization exercises

---

## 📄 License

Distributed under the **MIT** license. See the `LICENSE` file for more information.

---

## 👤 Author and credits

- **Luiz**: modeling and scripts
- Problem statements based on technical course activities.
