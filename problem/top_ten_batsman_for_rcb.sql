select batsman, sum(total_runs) as total_runs from deliveries
where batting_team = 'Royal Challengers Bangalore'
group by batsman
order by total_runs DESC
ipl-# limit 10;
