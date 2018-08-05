create database socio_economic;
use socio_economic;

create table elementary(
	year string,
	state_name string,
	district_name string,
	total_population double,
	per_urban_pop double,
	growth_rate double,
	sex_ratio double,
	per_sc_pop double,
	per_st_pop double,
	overall_literacy double,
	female_literacy double,
	male_literacy double,
	area double
	)row format delimited fields terminated by ',';

create table district(
     state_name string,
     district_name string,
     population double,
     male_population double,
     female_population double,
     literate double,
     male_literate double,
     female_literate double,
     total_sc double,
     male_sc double,
     female_sc double,
     total_st double,
     male_st double,
     female_st double,
     workers double,
     male_workers double,
     female_workers double,
     main_workers double,
     marginal_workers double,
     non_workers double,
     cultivator_workers double,
     agricultural_workers double,
     household_workers double,
     other_workers double,    
     hindus_population double,
     muslims_population double,
     christians_population double,
     sikhs_population double,     
     buddhists_population double,
     jains_population double,    
     other_population double,
     not_stated_population double
     )row format delimited fields terminated by ',';        


select state_name,sum(total_population) as total from elementary group by state_name order by total desc limit 5;

select state_name,count(district_name) as no_of_district from elementary group by state_name;

select e.state_name,e.urban/e.cnt as urbans from                                                                      
(select state_name,sum(per_urban_pop) as urban,count(district_name) as cnt from elementary group by state_name) e order by urbans desc limit 5;

select state_name,e.total/e.cnt as sex_ratio from (select state_name,sum(sex_ratio) as total,count(district_name) as cnt from elementary group by state_name) e order by sex_ratio limit 10;

select e.state_name,e.total/e.cnt as growth from (select state_name,sum(growth_rate) as total,count(district_name) as cnt from elementary group by state_name) e order by growth desc limit 5;

select state_name,district_name,growth_rate from elementary order by growth_rate desc limit 5;

select e.state_name,e.total/e.cnt as literacy from (select state_name,sum(overall_literacy) as total,count(district_name) as cnt from elementary group by state_name) e order by literacy desc limit 5;                                              

select e.state_name,e.female/e.cnt as literacy from (select state_name,sum(female_literacy) as female,count(district_name) as cnt from elementary group by state_name) e order by literacy desc limit 5;

create view t4 as select state_name,sum(area) as ar from elementary group by state_name;
select state_name,ar from t4 order by ar desc limit 5;

select state_name,ar from t4 order by ar asc limit 5;

select state_name,(sum(hindus_population)/sum(population))*100 as hindu from district group by state_name order by hindu desc limit 5;

select state_name,(sum(muslims_population)/sum(population))*100 as muslim from district group by state_name order by muslim desc limit 5;

select state_name,(sum(christians_population)/sum(population))*100 as christian from district group by state_name order by christian desc limit 5;

select state_name,(sum(hindus_population)/sum(population))*100 as hindu from district group by state_name order by hindu asc limit 5;

select state_name,sum(male_sc),sum(female_sc),sum(total_sc) as total from district group by state_name order by total desc limit 5;

select state_name,sum(male_st),sum(female_st),sum(total_st) as total from district group by state_name order by total desc limit 5;

select state_name,(sum(cultivator_workers)/sum(population))*100 as cultivator_worker from district group by state_name order by cultivator_worker desc limit 5;

select state_name,(sum(non_workers)/sum(population))*100 as non_worker from district group by state_name order by non_worker desc limit 5;

select state_name,(sum(cultivator_workers)/sum(population))*100 as cultivator_worker from district group by state_name order by cultivator_worker desc limit 5;

select state_name,(sum(non_workers)/sum(population))*100 as non_worker from district group by state_name order by non_worker desc limit 5;





