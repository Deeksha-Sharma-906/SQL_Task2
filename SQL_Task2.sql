/*
INTERNSHIP TASK -2
=======================================================================================================================================================================================
DATA ANALYSIS WITH COMPLEX QUERIES

USE WINDOW FUNCTIONS, SUBQUERIES, AND CTES (COMMON TABLE EXPRESSIONS) FOR ADVANCED DATA ANALYSIS.
=======================================================================================================================================================================================
*/


create database CodTech

use CodTech

select * from Business_Operations_Dataset


--WINDOW FUNCTIONS

select
	department,
	employee_name,
	revenue,
	RANK() OVER(
		Partition By department
		Order by revenue desc
		) As Rank_As_Per_Revenue
from
	Business_Operations_Dataset


--SUBQUERIES

SELECT avg_salary
FROM (
    SELECT department, AVG(salary) AS avg_salary
    FROM Business_Operations_Dataset
    GROUP BY department
) AS dept_avg;


--CTES (COMMON TABLE EXPRESSIONS)

With Dept_Avg_Salary 
AS
	(
	Select
		department,
		avg(salary) AS Avg_salary
	from
		Business_Operations_Dataset
	group by department
	)

select 
	department,
	Avg_salary
from
	Dept_Avg_Salary
where Avg_salary > 70000