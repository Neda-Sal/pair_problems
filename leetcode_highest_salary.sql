--https://leetcode.com/problems/department-highest-salary/

--With Nick Wilders

WITH subq  AS (SELECT MAX(Salary) AS max_sal, DepartmentId FROM Employee GROUP BY DepartmentId )

SELECT d.Name AS Department, e.Name AS Employee, e.Salary AS Salary
FROM Employee AS e
JOIN Department AS d
ON e.DepartmentId = d.Id
JOIN subq AS s
ON s.DepartmentId = e.DepartmentId
WHERE e.Salary = s.max_sal
ORDER BY e.DepartmentId;