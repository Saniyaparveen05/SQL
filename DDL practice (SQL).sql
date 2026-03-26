create database ABCD;
create database SCHOOL;
DROP DATABASE SCHOOL;
create database SCHOOL;
USE SCHOOL;
CREATE TABLE STUDENT(
student_id int ,
student_name text ,
student_address text ,
student_mobile text
);
alter table student add column student_email text;
describe student;
alter table student drop column student_mobile;
alter table student modify student_id text;
show tables;
describe student;