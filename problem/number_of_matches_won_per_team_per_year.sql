select winner as team,season, count(*) as matches_won from matches
where winner is not null
group by winner, season
order by season, matches_won DESC;
