set pagesize 100;
set linesize 200;

-- CREATE TABLE
create table department (
    dept_id number primary key,
    dept_name varchar2(50),
    location varchar2(50)
);
desc department;

create table medicine (
    medicine_id number primary key,
    medicine_name varchar2(50),
    price number(8,2)
);
desc medicine;

create table patient (
    patient_id number primary key,
    patient_name varchar2(50),
    age number(3),
    gender varchar2(10),
    phone varchar2(15),
    patient_address varchar2(50)
);
desc patient;

create table doctor (
    doctor_id number primary key,
    doctor_name varchar2(50),
    specialization varchar2(50),
    salary number(10),
    dept_id number,
    foreign key (dept_id) references department(dept_id)
);
desc doctor;

create table appointment (
    appointment_id number primary key,
    appointment_date varchar2(20),
    appointment_time varchar2(20),
    status varchar2(20),
    doctor_id number,
    patient_id number,
    foreign key (doctor_id) references doctor(doctor_id),
    foreign key (patient_id) references patient(patient_id)
);
desc appointment;

create table prescription (
    prescription_id number primary key,
    quantity number(10),
    patient_id number,
    doctor_id number,
    medicine_id number,
    foreign key (patient_id) references patient(patient_id),
    foreign key (doctor_id) references doctor(doctor_id),
    foreign key (medicine_id) references medicine(medicine_id)
);
desc prescription;

create table treats (
    doctor_id number,
    patient_id number,
    foreign key (doctor_id) references doctor(doctor_id),
    foreign key (patient_id) references patient(patient_id),
    primary key (doctor_id, patient_id)
);
desc treats;

create table temp_table (
    temp_id number primary key,
    temp_name varchar2(20)
);

-- DROP TABLE
drop table temp_table;

-- ADD COLUMN
alter table department add dept_phone varchar2(20);

-- MODIFY COLUMN
alter table department modify dept_phone varchar2(30);

-- RENAME COLUMN
alter table department rename column dept_phone to dept_contact;

-- DROP COLUMN
alter table department drop column dept_contact;

-- INSERT DATA
insert into department values (1, 'Surgery', 'Block A');
insert into department values (2, 'Cardiology', 'Block B');
insert into department values (3, 'Neurology', 'Block C');
insert into department values (4, 'Pediatrics', 'Block D');
insert into department values (5, 'Orthopedics', 'Block E');

insert into medicine values (501, 'Napa', 2);
insert into medicine values (502, 'Seclo', 6);
insert into medicine values (503, 'Tufnil', 5);
insert into medicine values (504, 'Ace+', 3);
insert into medicine values (505, 'Fexo', 8);

insert into patient values (101, 'Ayaan', 22, 'Male', '01712345678', 'Badda');
insert into patient values (102, 'Nabila', 30, 'Female', '01811223344', 'Dhanmondi');
insert into patient values (103, 'Rahim', 45, 'Male', '01915678901', 'Uttara');
insert into patient values (104, 'Sadia', 28, 'Female', '01610011223', 'Mirpur');
insert into patient values (105, 'Fahim', 35, 'Male', '01519876543', 'Banani');

insert into doctor values (201, 'Dr. Rahman', 'Orthopedics', 80000, 5);
insert into doctor values (202, 'Dr. Karim', 'Cardiology', 120000, 2);
insert into doctor values (203, 'Dr. Hossain', 'Neurology', 110000, 3);
insert into doctor values (204, 'Dr. Ahmed', 'Pediatrics', 90000, 4);
insert into doctor values (205, 'Dr. Sultana', 'Surgery', 130000, 1);

insert into appointment values (301, '20-07-2026', '08:00 AM', 'Completed', 201, 101);
insert into appointment values (302, '21-07-2026', '09:30 AM', 'Completed', 202, 102);
insert into appointment values (303, '22-07-2026', '11:00 AM', 'Scheduled', 203, 103);
insert into appointment values (304, '23-07-2026', '01:30 PM', 'Scheduled', 204, 104);
insert into appointment values (305, '24-07-2026', '03:00 PM', 'Cancelled', 205, 105);

-- prescription: id, quantity, patient_id, doctor_id, medicine_id
insert into prescription values (401, 2, 101, 201, 501);
insert into prescription values (402, 1, 102, 202, 502);
insert into prescription values (403, 3, 103, 203, 503);
insert into prescription values (404, 2, 104, 204, 504);
insert into prescription values (405, 1, 105, 205, 505);

insert into treats values (201, 101);
insert into treats values (202, 102);
insert into treats values (203, 103);
insert into treats values (204, 104);
insert into treats values (205, 105);

commit;

-- DISPLAY TABLE DATA
select * from department;
select * from medicine;
select * from patient;
select * from doctor;
select * from appointment;
select * from prescription;
select * from treats;

-- EXTRA DATA
insert into department values (6, 'Dermatology', 'Block F');
insert into doctor values (206, 'Dr. Nabila', 'Dermatology', 85000, 6);
insert into patient values (106, 'Sultana', 26, 'Female', '01734455667', 'Gulshan');
commit;

-- USE OF WHERE
select * from department where dept_id = 5;
select * from patient where not patient_id > 103;

-- MULTIPLE CONDITIONS
select * from doctor where specialization = 'Cardiology' and dept_id = 2;
select * from patient where patient_id > 102 or patient_address = 'Badda';
select * from patient where gender = 'Female' and age > 27;
select * from doctor where salary > 100000;

-- UPDATE
update patient set patient_address = 'Mohammadpur' where patient_id = 104;
update appointment set status = 'Completed' where appointment_id = 303;

-- DELETE
delete from patient where patient_id = 106;

commit;

-- UNION
select dept_name as name from department
union
select doctor_name as name from doctor;

-- UNION ALL
select dept_name as name from department
union all
select doctor_name as name from doctor;

-- INTERSECT
select dept_name as name from department
intersect
select doctor_name as name from doctor;

-- MINUS
select dept_name as name from department
minus
select doctor_name as name from doctor;

-- IN
select * from doctor where dept_id in (1, 2, 3);

-- NOT IN
select * from patient where patient_id not in (select patient_id from treats);

-- SOME / ANY
select * from doctor where dept_id > some (select dept_id from department where location = 'Block B');

-- ALL
select * from doctor where dept_id > all (select dept_id from department where dept_id < 3);

-- EXISTS
select p.patient_name from patient p where exists (select 1 from appointment a where a.patient_id = p.patient_id);

-- LIKE
select * from doctor where doctor_name like 'Dr. R%';
select * from patient where patient_name like '%a%';
select * from patient where patient_name like '_a%';

-- INNER JOIN
select d.doctor_name, dp.dept_name, d.specialization
from doctor d
inner join department dp on d.dept_id = dp.dept_id;

-- LEFT JOIN
select dp.dept_name, d.doctor_name
from department dp
left join doctor d on dp.dept_id = d.dept_id;

-- RIGHT JOIN
select d.doctor_name, dp.dept_name
from doctor d
right join department dp on d.dept_id = dp.dept_id;

-- FULL JOIN
select d.doctor_name, dp.dept_name
from doctor d
full join department dp on d.dept_id = dp.dept_id;

-- JOIN OF FOUR TABLES (patient, doctor, prescription, medicine)
select p.patient_name, d.doctor_name, m.medicine_name, pr.quantity
from prescription pr
join patient p on pr.patient_id = p.patient_id
join doctor d on pr.doctor_id = d.doctor_id
join medicine m on pr.medicine_id = m.medicine_id;

-- AGGREGATE FUNCTIONS
select count(*) from patient;
select sum(quantity) from prescription;
select avg(quantity) from prescription;
select max(patient_id) from patient;
select min(patient_id) from patient;
select max(salary) from doctor;
select avg(price) from medicine;

-- GROUP BY
select dept_id, count(doctor_id) as total_doctors from doctor group by dept_id;
select gender, count(*) as total_patients from patient group by gender;

-- HAVING
select dept_id, count(doctor_id) as total_doctors from doctor group by dept_id having count(doctor_id) >= 1;
select status, count(*) as total from appointment group by status having count(*) >= 2;

-- CREATE VIEW
create view doctor_dept_view as
select d.doctor_name, dp.dept_name, d.specialization
from doctor d
join department dp on d.dept_id = dp.dept_id;

select * from doctor_dept_view;

-- PL/SQL: FIRST PROGRAM
begin
    dbms_output.put_line('Welcome to Hospital Management System');
end;
/

-- VARIABLES
declare
    p_name varchar2(30);
    p_id number;
begin
    p_name := 'Ayaan';
    p_id := 101;
    dbms_output.put_line(p_name);
    dbms_output.put_line(p_id);
end;
/

-- SELECT INTO WITH %TYPE
declare
    d_name doctor.doctor_name%type;
begin
    select doctor_name into d_name from doctor where doctor_id = 201;
    dbms_output.put_line(d_name);
end;
/

-- SELECT INTO WITH %ROWTYPE
declare
    p_rec patient%rowtype;
begin
    select * into p_rec from patient where patient_id = 101;
    dbms_output.put_line(p_rec.patient_name);
    dbms_output.put_line(p_rec.age);
    dbms_output.put_line(p_rec.gender);
    dbms_output.put_line(p_rec.phone);
end;
/

-- IF-ELSE
declare
    total_dept number := 5;
begin
    if total_dept >= 5 then
        dbms_output.put_line('Large Hospital');
    elsif total_dept >= 3 then
        dbms_output.put_line('Medium Hospital');
    else
        dbms_output.put_line('Small Hospital');
    end if;
end;
/

-- ARRAY (INDEX BY)
declare
    type dept_array is table of varchar2(30) index by pls_integer;
    depts dept_array;
begin
    depts(1) := 'Surgery';
    depts(2) := 'Cardiology';
    dbms_output.put_line(depts(1));
    dbms_output.put_line(depts(2));
end;
/

-- ARRAY (VARRAY)
declare
    type doc_array is varray(5) of varchar2(50);
    docs doc_array := doc_array('Dr. Rahman', 'Dr. Karim', 'Dr. Hossain');
begin
    dbms_output.put_line(docs(1));
end;
/

-- SIMPLE LOOP
declare
    i number := 1;
begin
    loop
        dbms_output.put_line(i);
        i := i + 1;
        exit when i > 5;
    end loop;
end;
/

-- WHILE LOOP
declare
    i number := 1;
begin
    while i <= 5 loop
        dbms_output.put_line(i);
        i := i + 1;
    end loop;
end;
/

-- FOR LOOP
begin
    for i in 1..5 loop
        dbms_output.put_line(i);
    end loop;
end;
/

-- EXCEPTION HANDLING
declare
    num number;
begin
    num := 10 / 0;
exception
    when zero_divide then
        dbms_output.put_line('Cannot divide by zero');
end;
/

-- PROCEDURE
create or replace procedure greet_patient is
begin
    dbms_output.put_line('Hello Patient, Welcome!');
end;
/
exec greet_patient;

-- FUNCTION
create or replace function count_patients return number is
    total number;
begin
    select count(*) into total from patient;
    return total;
end;
/
select count_patients from dual;

-- CURSOR
declare
    cursor c_doc is select doctor_name, salary from doctor;
    v_name doctor.doctor_name%type;
    v_salary doctor.salary%type;
begin
    open c_doc;
    loop
        fetch c_doc into v_name, v_salary;
        exit when c_doc%notfound;
        dbms_output.put_line(v_name || ' - ' || v_salary);
    end loop;
    close c_doc;
end;
/
