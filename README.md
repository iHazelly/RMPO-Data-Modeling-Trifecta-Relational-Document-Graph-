# 🗄️ RMPO Data Modeling Trifecta

![MySQL](https://img.shields.io/badge/MySQL-8.0-blue)
![MongoDB](https://img.shields.io/badge/MongoDB-7.0-green)
![Neo4j](https://img.shields.io/badge/Neo4j-5.0-red)
![License](https://img.shields.io/badge/License-Academic%20Use-brightgreen)

**Relational · Document · Graph** — One case study, three database paradigms. Complete data modeling for Research Project Management Office (RMPO) at Kookle University.

---

## 📌 Overview

- **Problem**: RMPO needs to track research projects, donors, staff, student assistants, installments, and domains — but different queries favor different data models.  
- **Solution**: We implemented the **same business requirements** in three database systems: MySQL (relational), MongoDB (document), Neo4j (graph).  
- **Outcome**: A side‑by‑side comparison of modeling choices, query performance, and best‑use scenarios for each paradigm.


---

## 🚀 What's Inside

| Model | Technology | Key Feature |
|-------|------------|--------------|
| **Relational** | MySQL 8.0 | 3NF normalization, 8 core tables + junction tables, 22 SQL queries |
| **Document** | MongoDB 7.0 | Two collections (projects embedded, users referenced), aggregation pipeline |
| **Graph** | Neo4j 5.0 | 10 node labels, 11 relationship types, Cypher queries for network insights |

---

## 📊 Sample Query Performance (Mental Model)

| Query Type | MySQL | MongoDB | Neo4j |
|------------|-------|---------|-------|
| Project details + donor + installments | 3-4 JOINs | 1 document read | traverse 2-3 hops |
| Staff expertise in active projects | complex JOIN + GROUP BY | `$unwind` + `$group` | simple path match |
| Funding received by donor type | GROUP BY with subquery | `$group` + `$project` | relationship aggregation |

> Actual execution times depend on data volume and indexes; this table highlights the **conceptual** complexity of each paradigm.
--- 

## 🐳 How to Run Each Model

### 1️⃣ Relational (MySQL)

```bash
cd relational
mysql -u root -p < create_database.sql
mysql -u root -p mydb < mockup_data.sql
mysql -u root -p mydb < Final_Implementation.sql
```

### 2️⃣ Document (MongoDB Atlas)

Connection string...
mongodb+srv://st125843:Ny47gEN86MZWFrAa@dmmcluster0.xqqoaey.mongodb.net/
Then:
use rmpo
db.users.insertMany([...])      # load users.json etc.
db.projects.insertMany([...])   # load Projects.json etc.
```

