/*
https://www.hackerrank.com/challenges/placements/problem

You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

Write a query to output the names of those students whose best friends got offered a higher salary than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.
*/

WITH person_table AS 
(SELECT s.ID, s.Name AS person_name, f.Friend_ID AS Friend_ID, p.Salary AS person_salary
FROM Students AS s
JOIN Friends AS f
ON s.ID = f.ID
JOIN Packages AS p
ON s.ID = p.ID)
SELECT person_table.person_name 
FROM person_table
JOIN Students AS s2
ON person_table.Friend_ID = s2.ID
JOIN Packages AS pk
ON pk.ID = person_table.Friend_ID
WHERE person_table.person_salary < pk.Salary
ORDER BY pk.Salary
;