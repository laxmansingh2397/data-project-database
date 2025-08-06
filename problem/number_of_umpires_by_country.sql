select country, count(umpire) as total_umpires from umpires
where country not like '%India%'
group by country
order by country;
