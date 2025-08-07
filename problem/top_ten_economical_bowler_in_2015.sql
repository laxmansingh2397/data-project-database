select d.bowler, round(sum(d.total_runs - d.wide_runs - d.noball_runs) * 6.0 / count(*),2) as economy_rate
from deliveries d
join matches m on d.match_id = m.id
where m.season = 2015
group by d.bowler
order by economy_rate ASC
limit 10;
