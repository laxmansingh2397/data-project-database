select d.bowling_team as team, sum(d.extra_runs) as extra_runs_conceded
from deliveries d
join matches m on d.match_id = m.id
where m.season = 2016
group by d.bowling_team
order by extra_runs_conceded DESC;
