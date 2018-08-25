select username, description, bettype, bets.result, bets.homescore, bets.awayscore, CAST(fixtures.due AS timestamp)
from bets
join users
on user_id = users.id
join fixtures 
on fixtures.id = fixture_id
where CAST(fixtures.due AS timestamp) <  CAST(LEFT(CAST(current_timestamp AS varchar),19)AS timestamp)
order by due desc
limit 82
