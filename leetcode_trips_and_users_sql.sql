--https://leetcode.com/problems/trips-and-users/
--With Julia Nyugen

WITH Unbanned_Users AS (SELECT * FROM Users WHERE Banned = 'No'), All_Cancelled AS (SELECT * FROM Trips WHERE Status = 'cancelled_by_driver' OR Status = 'cancelled_by_client')

SELECT t.Request_at AS Day, ROUND(COUNT(ac.Status)/COUNT(t.Client_Id),2) AS 'Cancellation Rate'
FROM Trips AS t
INNER JOIN Unbanned_Users AS u
ON t.Client_Id = u.Users_Id
LEFT JOIN All_Cancelled AS ac
ON ac.Status = t.Status
GROUP BY t.Request_at;
