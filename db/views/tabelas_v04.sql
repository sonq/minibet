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
SELECT BetUser, SUM(Points)
FROM CTE
GROUP BY BetUser


