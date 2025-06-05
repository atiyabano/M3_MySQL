create database HospitalDBM;
use Hospitaldbm;
create table Doctors(
doc_id int primary key,
f_name varchar(50),
l_name varchar(50),
specialization varchar(100)
);
insert into Doctors(doc_id, f_name, l_name, specialization)
values
(1, 'Priya', 'Maurya', 'Onyxology'),
(2, 'Atiya', 'Bano', 'Dramatology'),
(3, 'Prince', 'Maurya', 'Neurology');

create table Patients(
patient_id int primary key,
 f_name varchar(50),
 l_name varchar(50),
 age int,
 doc_id int null);
 insert into patients(patient_id, f_name, l_name, age, doc_id )
values
(101, 'Nitya', 'Dubey', 19, 1),
(102, 'Shreya', 'Anand', 20, 2),
(103, 'Shiva', 'Singh', 16, NULL); 

-- inner joining________________
select patients.f_name as patient_name,
Doctors.f_name as doctoer_name,
 doctors.specialization
from patients 
inner join Doctors 
on patients.doc_id = Doctors.doc_id;

-- left jioning__________________
select patients.f_name as patient_name,
Doctors.f_name as doctoer_name,
 doctors.specialization
from patients 
left join Doctors 
on patients.doc_id = Doctors.doc_id;

-- right joining__________________
select patients.f_name as patient_name,
Doctors.f_name as doctoer_name,
 doctors.specialization
from patients 
right join Doctors 
on patients.doc_id = Doctors.doc_id;

-- FULL OUTER JOINING____________________________
select patients.f_name as patient_name,
Doctors.f_name as doctoer_name,
 doctors.specialization
from patients 
left join Doctors 
on patients.doc_id = Doctors.doc_id
UNION
select patients.f_name as patient_name,
Doctors.f_name as doctoer_name,
 doctors.specialization
from patients 
right join Doctors 
on patients.doc_id = Doctors.doc_id;

-- cross joining_______________
select patients.f_name as patient_name,
Doctors.f_name as doctoer_name,
 doctors.specialization
from patients 
cross join Doctors ;

-- self joining___________________
select p1.f_name as patient1_name,
p2.f_name as patient2_name
from patients p1
inner join patients p2 ;
-- where p1.doc_id = p2.doc_id;

-- modifying and self joining_____________
alter table patients add department varchar(50);
set sql_safe_updates = 0;
update patients
set department = 'cadiology'
where doc_id = 1;
 update patients
set department = 'orthopedics'
where doc_id = 2;
update patients
set department = 'General';
set sql_safe_updates=1;
select p1.f_name as patient1_name,
p2.f_name as patient2_name,
p2.department
from patients p1
inner join patients p2 
where p1.doc_id != p2.doc_id and p1.department = p2.department;
