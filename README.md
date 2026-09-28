# Hospital Management System (Oracle SQL & PL/SQL)

This repository contains the complete Oracle SQL and PL/SQL scripts for a **Hospital Management System**. The database schema is designed to manage departments, doctors, patients, appointments, prescriptions, and medicines efficiently.

---

## 🗄️ Database Tables
1. **Department** - Stores department details and locations.
2. **Doctor** - Contains doctor profiles, specializations, salaries, and department mappings.
3. **Patient** - Stores patient demographics and contact details.
4. **Medicine** - Contains available medicines and pricing.
5. **Appointment** - Manages patient appointments with doctors and status tracking.
6. **Prescription** - Links patients, doctors, and prescribed medicines with quantities.
7. **Treats** - Tracks doctor-patient relationship mapping.

---

## 🚀 Key Database Concepts Implemented

### SQL Operations:
* **DDL Commands:** `CREATE`, `ALTER`, `DROP`
* **DML Commands:** `INSERT`, `UPDATE`, `DELETE`
* **Relational Joins:** `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL JOIN`, and **4-Table Join**
* **Aggregate Functions & Grouping:** `COUNT`, `SUM`, `AVG`, `MAX`, `MIN`, `GROUP BY`, `HAVING`
* **Set Operations:** `UNION`, `UNION ALL`, `INTERSECT`, `MINUS`
* **Advanced Filtering:** `IN`, `NOT IN`, `EXISTS`, `LIKE`, `ANY`, `ALL`
* **Database Views:** `CREATE VIEW` for quick data retrieval

### PL/SQL Concepts:
* **DBMS Output & Variables:** Data typing with `%TYPE` and `%ROWTYPE`
* **Control Structures:** `IF-ELSIF-ELSE`, `FOR`, `WHILE`, `SIMPLE LOOP`
* **Collections:** Index-by Tables, VARRAYs
* **Exception Handling:** Custom and System Exceptions (`ZERO_DIVIDE`)
* **Database Objects:** Procedures, Functions, and Explicit Cursors

---

## 🛠️ How to Run
1. Open any Oracle SQL database editor (Oracle SQL Developer, Live SQL, or **OneCompiler**).
2. Copy the code from `hospital_management.sql`.
3. Paste and execute the script.
