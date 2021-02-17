-- https://www.hackerrank.com/challenges/the-company/problem

SELECT Company.company_code, Company.founder, COUNT(DISTINCT(Employee.lead_manager_code)),
COUNT(DISTINCT(Employee.senior_manager_code)),
COUNT(DISTINCT(Employee.manager_code)),
COUNT(DISTINCT(Employee.employee_code))
FROM Company 
JOIN Lead_Manager
ON Company.company_code = Lead_Manager.company_code
JOIN Senior_Manager
ON Company.company_code = Senior_Manager.company_code
JOIN Manager
ON Company.company_code = Manager.company_code
JOIN Employee
ON Company.company_code = Employee.company_code
GROUP BY Company.company_code, Company.founder