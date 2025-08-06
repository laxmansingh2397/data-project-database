select season, count(id) as total_match from matches
group by season
order by season;
