# CENG352-Database-Management-Systems
Review of relational model of data, relational algebra, and SQL. Semi-structured data models. Relational database design theory. Query evaluation and optimization. Performance tuning. Transaction management, concurrency control and crash recovery. Client-server architectures. NoSQL databases. 
Here's a comprehensive README.md file for your **CENG 352 - Project 1** submission:

---

# 📊 CENG 352: Database Management Systems – Project 1


## 📁 Project Overview

This project involves working with a relational database using **PostgreSQL** and includes four main components:

1. **Database Creation** from CSV files
2. **Advanced SQL Queries** using functions like PARTITION BY, NTILE, CUBE, and GROUPING SETS
3. **Index Optimization** for query performance improvements
4. **Views and Triggers** to enhance automation and reporting

---

## 📐 Database Schema

The project uses the following schema:

* **Country**: name, code, capital, area, population
* **City**: name, country code, population, elevation
* **Economy**: country code, gdp, agriculture/industry/service %, inflation, unemployment
* **Religion**: country code, name, percentage
* **Spoken**: country code, language, percentage
* **Encompasses**: country code, continent name, percentage
* **Continent**: name, area

---

## ⚙️ Setup Instructions

### Requirements

* PostgreSQL (latest version recommended)
* DBeaver or DataGrip (for visualization)

### Setup Steps

1. Create a new PostgreSQL database.
2. Run task1.sql to create tables.
3. Import provided CSV files using COPY or your DB UI (e.g., DBeaver).
4. Execute each SQL file (task2_x.sql) for individual queries.
5. Use EXPLAIN to analyze queries in Task 3 after creating indexes.
6. Execute Task 4 scripts to create views, triggers, and aggregated tables.

---

## 🧪 Performance Notes

Task 3 includes:

* Index creation (BTREE, HASH)
* Execution plans (EXPLAIN)
* Justification of index choices
* Speedup analysis

Each task3_x.txt file contains:

1. CREATE INDEX statement
2. Rationale for index type
3. EXPLAIN output
4. Performance gain summary

---
