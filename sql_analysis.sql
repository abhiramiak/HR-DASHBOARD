#sql analyses
describe hr;

#qn1 what is the gender breakdown of employes in the company
select gender,count(*) as count from hr where age>=18 and termdate IS NULL group  by gender;

#qn2 what is the race breakdown of employes in the company
select race,count(*) as count from hr where age>=18 and termdate IS NULL group  by race;

#qn3 How many employes work at headquarter versus remote location
select location,count(*) as count from hr where age>=18 and termdate IS NULL group by location;

#qn4 How does the gender distributation across dept and jobtitles
select department,gender, count(*) as count from hr where age>=18 and termdate IS NULL group  by department,gender
order by department;

#qn5 How does the distributation of jobtitle across company
select jobtitle, count(*) as count from hr where age>=18 and termdate IS NULL group by jobtitle
order by jobtitle desc;

#qn6 what is the distributation of employe across location by city and state
select location_state, count(*) as count from hr where age>=18 and termdate IS NULL group by location_state
order by count desc;

#qn7 what is the avg length of employment for employee who have been terminated.
select round(avg(datediff(termdate,hire_date))/365,0) as avg_length from hr where termdate<=curdate() and
termdate IS NOT NULL and age>=18;

#qn8 what is the tensure distributation for each dept
select department, round(avg(datediff(termdate,hire_date))/365,0) as avg_tensure from hr where termdate<=curdate() and
termdate IS NOT NULL and age>=18 group by department;



