WITH CTE  (UserCode, BetUser, MatchName,BetType,BettedResult,  BettedHomeSocre, BettedAwayScore, 
MatchResult, HomeScore, AwayScore, Points )
AS(
select users.id AS UserCode,
       username AS BetUser,
       description MatchName, 
       bettype BetType, 
       bets.result BettedResult, 
       bets.homescore BettedHomeSocre, 
       bets.awayscore BettedAwayScore, 
       fixtures.result MatchResult, 
       fixtures.homescore HomeScore, 
       fixtures.awayscore AwayScore,
       CASE WHEN bettype = 'Score' AND bettype <> 'Result' AND bets.homescore = fixtures.homescore AND bets.awayscore = fixtures.awayscore  THEN 5
            WHEN bettype = 'Result' AND bettype <> 'Score' AND bets.result = fixtures.result THEN 2
            ELSE 0
       END AS Points
from bets
join users
on users.id = bets.user_id
join fixtures
on fixtures.id = bets.fixture_id) 
, CTE2 AS (
    SELECT BetUser,
      CASE WHEN BetUser IN ('n.ceceli','yasin','MKirazci') THEN SUM(Points)+6
      ELSE SUM(Points) END AS sum
FROM CTE
GROUP BY BetUser)
SELECT   ROW_NUMBER () OVER (ORDER BY sum DESC) rowno,
         BetUser, 
         sum,CONCAT( CAST(
          ((SELECT CAST(COUNT(1) AS NUMERIC)
            FROM bets 
            join users on bets.user_id = users.id 
            join fixtures on fixtures.id = bets.fixture_id 
            where (BetUser = users.username) AND 
                (fixtures.result = bets.result OR 
                  (fixtures.homescore = bets.homescore AND 
                   fixtures.awayscore = bets.awayscore))) /
           (SELECT CAST(COUNT(1) AS NUMERIC) FROM bets join users on bets.user_id = users.id 
                                   join fixtures on fixtures.id = bets.fixture_id and fixtures.result IS NOT NULL
            where BetUser = users.username))* CAST(100 AS NUMERIC) AS int ),'%') AS pct
  
FROM CTE2






