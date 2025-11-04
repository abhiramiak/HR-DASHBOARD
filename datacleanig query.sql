#creating database and importing the dataset into  sql workbench.
create database hr_database;
use hr_database;
select * from hr;

#Cleaning the data.
# 1) renaming the column id using alter query
alter table hr change column ï»¿id emp_id varchar(20);

# 2) - change the datatype of birthdate column using alter query,
#    - values in birthdate is in text formart need to convert to sql date format.
describe hr;
set sql_safe_updates=0;
UPDATE hr
SET birthdate = CASE 
  WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate,'%m/%d/%Y'), '%Y-%m%-%d')
  WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate,'%m-%d-%Y'), '%Y-%m%-%d')
  ELSE NULL
 END; 
 
select birthdate from hr;
alter table hr modify column birthdate date;

 # 3) - change the datatype of hiredate column using alter query,
 #    - values in hiredate is in text formart need to convert to sql date format.
 UPDATE hr
SET hire_date = CASE 
  WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date,'%m/%d/%Y'), '%Y-%m%-%d')
  WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date,'%m-%d-%Y'), '%Y-%m%-%d')
  ELSE NULL
 END; 
 select hire_date from hr;
 alter table hr modify column hire_date date;
 
 #4) - change the datatype of termdate column using alter query.
 #   - timestamp as to be removed and only date should be mentioned using update query, 
 #   - termdate field should not be blank.
 UPDATE hr
 SET termdate = date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC')) 
 WHERE termdate IS NOT NULL AND termdate !='';
 
 UPDATE hr 
 SET termdate = NULL 
 WHERE termdate IS NULL OR trim(termdate) = '';

 select termdate from hr;
 
 ALTER TABLE hr MODIFY COLUMN termdate DATE;
 
 #5) - Add age column
  #   - add age values
 
 Alter table hr add column age int;
 select age from hr;
 
 Update hr set age=timestampdiff(Year,birthdate,curdate());
 select birthdate, age from hr;
 

