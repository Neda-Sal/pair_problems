--how many times do users tend to check in before they sign up?

SELECT ROUND(AVG(num_checkin))
FROM (SELECT COUNT(t.checkin)  AS num_checkin FROM (SELECT c.user_id as checkinuser ,c.created_at,c.event_type as checkin ,s.created_at,s.event_type FROM arvindr12.dummy_events as c INNER JOIN 
(SELECT * FROM arvindr12.dummy_events WHERE event_type='sign_up')  as s ON c.user_id = s.user_id  WHERE c.event_type='check_in' AND c.created_at < s.created_at) as t GROUP BY t.checkinuser) as name