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

### Relational (MySQL)

```bash
cd relational
mysql -u root -p < create_database.sql
mysql -u root -p mydb < mockup_data.sql
mysql -u root -p mydb < Final_Implementation.sql
```

---
### Document (MongoDB Atlas)
Connection (see d**ocument/Database - MongoDB Server.txt**):
```bash
mongodb+srv://st125843:Ny47gEN86MZWFrAa@dmmcluster0.xqqoaey.mongodb.net/
```
Then:
```bash
use rmpo
db.users.insertMany([...])      # load users.json etc.
db.projects.insertMany([...])   # load Projects.json etc.
```

---
### Graph (Neo4j)
- Open Neo4j Browser (local or Aura)
- Copy the content of **graph/Neo4j_MockUpData.csv** (the query column) and run it to create nodes & relationships.
- Execute any query from **graph/Cypher_Query.pdf.**
---

### Conclusion
- Use **MongoDB** when your primary need is to view/manage projects as whole units (project form → one document).
- Use **Neo4j** when you need to explore relationships: “find staff with certain expertise not assigned to active projects”, “funding network analysis”.
- Use **MySQL** when financial integrity, complex cross‑entity reporting, and ACID transactions are mandatory.
For the RMPO use case, **MongoDB** offers the most natural fit.
---

### AI Use Declaration
During this project we used AI tools for: 
- Language translation & sentence refinement
- Code suggestions & debugging
- Writing assistance for the report and this README
- Brainstorming and Vibe coding

    **All core model design, data collection, feature engineering, result interpretation, and final technical decisions were made by the authors, and all outputs have been manually verified

---

## 📄 Citation

```bibtex
@misc{datephanyawat_khanongsuwan_swe_2025_rmpo,
  title={RMPO Data Modeling: Relational, Document, and Graph Implementations for Research Project Management},
  author={Datephanyawat, Jirapat and Khanongsuwan, Paradorn and Swe, Thet Htun},
  year={2025},
  howpublished={\url{https://github.com/iHazelly/RMPO-Data-Modeling-Trifecta-Relational-Document-Graph}}
}
---
