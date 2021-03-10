/* https://www.hackerrank.com/challenges/full-score/problem */


SELECT Hackers.hacker_id, Hackers.name
FROM Hackers 
JOIN Submissions ON Hackers.hacker_id = Submissions.hacker_id
JOIN Challenges ON Submissions.challenge_id = Challenges.challenge_id 
JOIN Difficulty ON Challenges.difficulty_level = Difficulty.difficulty_level
WHERE Submissions.score = Difficulty.score
GROUP BY Hackers.hacker_id, Hackers.name
HAVING count(Hackers.hacker_id) > 1
ORDER BY count(Hackers.hacker_id) DESC, Hackers.hacker_id ASC;