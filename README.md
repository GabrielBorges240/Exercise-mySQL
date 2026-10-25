# MySQL / SQL - CS50 SQL

Repository with my lessons and exercises from the **CS50's Introduction to Databases with SQL** course (Harvard), organized by worlds.

- Author: [GabrielBorges240](https://github.com/GabrielBorges240)
- Course: [cs50.harvard.edu/sql](https://cs50.harvard.edu/sql)

---

## Repository structure

```
MySQL/
├── Mundo 1 - atividade/
│   ├── Consulta (Querying)/
│   └── Relacionamento (Relating)/
├── Mundo 2 - atividade/
│   ├── Projeto de Banco (Designing)/
│   └── Escrita (Writing)/
└── Mundo 3 - atividade/
    ├── Views (Viewing)/
    ├── Otimização (Optimizing)/
    ├── Escalabilidade (Scaling)/
    └── Projeto Final/
```

Each topic folder contains:

- `Aula N - Name.sql`: lesson summary, written as comments.
- `Exercício N - Name.sql`: the queries for the exercises.

Folder names are in Portuguese. "Mundo" means "World", "Aula" means "Lesson", and "Exercício" means "Exercise".

---

## Content

| World | Lesson | Topics |
|---|---|---|
| 1 | 0 - Querying | SELECT, LIMIT, WHERE, NULL, LIKE, ORDER BY, aggregate functions |
| 1 | 1 - Relating | Keys, JOIN, subqueries, UNION, GROUP BY, HAVING |
| 2 | 2 - Designing | CREATE TABLE, data types, constraints, normalization |
| 2 | 3 - Writing | INSERT, UPDATE, DELETE, triggers, soft delete |
| 3 | 4 - Viewing | Views, CTE, temporary views |
| 3 | 5 - Optimizing | Indexes, EXPLAIN QUERY PLAN, transactions |
| 3 | 6 - Scaling | MySQL, access control, SQL injection, replication, sharding |

---

## Progress

### World 1
- [x] Cyberchase
- [ ] 36 Views or Normals
- [ ] Players
- [ ] Packages, Please
- [ ] DESE
- [ ] Moneyball

### World 2
- [ ] ATL
- [ ] Happy to Connect
- [ ] Union Square Donuts
- [ ] Don't Panic
- [ ] Meteorites Cleanup

### World 3
- [ ] Census
- [ ] The Private Eye
- [ ] Bed and Breakfast
- [ ] In a Snap
- [ ] your.harvard
- [ ] Don't Panic (Sentimental)
- [ ] From the Deep
- [ ] Happy to Connect (Sentimental)
- [ ] Final Project

---

## Tools

- SQLite (weeks 0 to 5)
- MySQL (week 6)
- VS Code
- Git and GitHub

---

## How to use

1. Clone the repository:
   ```bash
   git clone https://github.com/GabrielBorges240/MySQL.git
   ```
2. Open the folder in VS Code.
3. Open the exercise database in the terminal:
   ```bash
   sqlite3 database-name.db
   ```
4. Run the queries from the `.sql` file:
   ```sql
   .read "Exercício 1 - Cyberchase.sql"
   ```

---

## Note

This repository is for study purposes only. The solutions are my own, written in accordance with CS50's academic honesty policy.
