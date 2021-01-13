# https://sqlzoo.net/wiki/More_JOIN_operations

#Q6
SELECT a.name
FROM casting AS c
JOIN actor AS a
ON c.actorid = a.id
WHERE movieid = 11768;

#Q7
SELECT a.name
FROM casting AS c
JOIN actor AS a
ON c.actorid = a.id
JOIN movie as m
ON m.id = c.movieid
WHERE m.title = 'Alien';

#Q8
SELECT m.title
FROM casting AS c
JOIN actor AS a
ON c.actorid = a.id
JOIN movie as m
ON m.id = c.movieid
WHERE a.name = 'Harrison Ford';

#Q9
SELECT m.title
FROM casting AS c
JOIN actor AS a
ON c.actorid = a.id
JOIN movie as m
ON m.id = c.movieid
WHERE a.name = 'Harrison Ford' AND c.ord != 1;

#Q10
SELECT m.title, a.name
FROM casting AS c
JOIN actor AS a
ON c.actorid = a.id
JOIN movie as m
ON m.id = c.movieid
WHERE m.yr = 1962 and c.ord = 1;

#Q11
SELECT m.yr, COUNT(m.title) 
FROM movie AS m
JOIN casting AS c 
ON m.id = c.movieid
JOIN actor AS a 
ON c.actorid = a.id
WHERE a.name = 'Rock Hudson'
GROUP BY m.yr
HAVING COUNT(m.title) > 2;

#Q12
SELECT m.title, a.name
FROM movie as m
    INNER JOIN casting as c ON m.id=c.movieid
    INNER JOIN actor as a ON a.id=c.actorid
WHERE m.id IN
(SELECT movieid FROM casting
  WHERE actorid IN (
  SELECT id FROM actor
  WHERE name='Julie Andrews'))
AND c.ord=1;

#Q13
SELECT a.name
FROM actor as a
JOIN casting as c
ON a.id=c.actorid
WHERE c.ord=1
GROUP BY a.name
HAVING COUNT(a.name)>=15
ORDER BY a.name;

#Q14
SELECT m.title, COUNT(c.actorid)
FROM movie as m
JOIN casting as c ON m.id=c.movieid
JOIN actor as a on c.actorid=a.id
WHERE m.yr=1978
GROUP BY m.title
ORDER BY COUNT(c.actorid) DESC, m.title;

#Q15
SELECT DISTINCT a.name
FROM movie as m
    INNER JOIN casting as c ON m.id=c.movieid
    INNER JOIN actor as a ON a.id=c.actorid
WHERE m.id IN
(SELECT movieid FROM casting
  WHERE actorid IN (
  SELECT id FROM actor
  WHERE name='Art Garfunkel'))
AND a.name!='Art Garfunkel';