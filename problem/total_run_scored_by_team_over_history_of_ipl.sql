select batting_team, sum(total_runs) as total_runs from deliveries
group by batting_team;
