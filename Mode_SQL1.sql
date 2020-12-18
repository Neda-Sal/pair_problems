--Do some exploratory data analysis


SELECT * FROM arvindr12.dummy_users;

SELECT * FROM arvindr12.dummy_events;

--let's look at the types of events and how often they occur
SELECT COUNT(event_type), event_type FROM arvindr12.dummy_events GROUP BY event_type;


--how many check ins per user?
SELECT COUNT(event_type), user_id 
FROM arvindr12.dummy_events 
WHERE event_type = 'check_in' 
GROUP BY user_id;

--what is the minimum number of check ins?
SELECT min(t.total) FROM (SELECT COUNT(event_type) as total, user_id 
FROM arvindr12.dummy_events 
WHERE event_type = 'check_in' 
GROUP BY user_id) as t;

--what is the max number of check ins?
SELECT max(t.total) FROM (SELECT COUNT(event_type) as total, user_id 
FROM arvindr12.dummy_events 
WHERE event_type = 'check_in' 
GROUP BY user_id) as t;


-- Let's make a histogram with bucket size 5

--the bucket(number_of_checkins) represents the number of times a user has checked in
--the count(number_of_users) is the number of users that have checked in that number of times
SELECT floor((t.total)/5)*5 AS number_of_checkins, COUNT(t.user_id) AS number_of_users
  FROM (SELECT COUNT(event_type) AS total, user_id 
    FROM arvindr12.dummy_events 
    WHERE event_type = 'check_in' 
    GROUP BY user_id) AS t
  GROUP BY floor((t.total)/5)*5
  ORDER BY number_of_checkins;
