select team, season, count(*) as matches_played from 
(select season, team1 as team from matches
union all
select season, team2 as team from matches) as all_teams_per_match
group by season, team
order by season, matches_played DESC;
