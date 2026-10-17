create database  sub_analysis; --creating database to set the tables inside it --
select*from subscriptions       --exploring the data--
where churned = 1;                --exploring the data where they cancl there sbs--
select *from usage;
ALTER TABLE subscriptions                -- setting PK for the table-- 
ALTER COLUMN customer_ID INT NOT NULL;
ALTER TABLE subscriptions
ADD PRIMARY KEY (customer_id);
                                            --setting FK for usage--
ALTER TABLE usage
ADD FOREIGN KEY (customer_id) REFERENCES subscriptions(customer_id);
                                        ----cleaning data for usage--
select* from usage;
select* from usage
where workouts_completed is null;
select* from usage    
where minutes_active is null;
select count (customer_id) from usage    
where minutes_active is null;
select count (customer_id) from usage    
where minutes_active is null and workouts_completed =0;    --- 55 person did not use the app technical problem--
update usage
set minutes_active = 0 
where minutes_active is null and workouts_completed =0;   -- the same no. have changed--
select*from usage
where customer_id is null or  month is null or classes_booked is null or 
support_tickets is null or workouts_completed is null or minutes_active is null;   --- 451 person have missing data --
select minutes_active, workouts_completed from usage;
select minutes_active, workouts_completed from usage
where minutes_active = 0 and  workouts_completed>0;

SELECT SUM(minutes_active) / SUM(workouts_completed) AS avg_minutes_per_workout   ---30 is the avg_minutes_per_workout -- 
FROM usage
WHERE minutes_active IS NOT NULL AND workouts_completed > 0;
SELECT minutes_active,workouts_completed
FROM usage
WHERE ((minutes_active) / (workouts_completed)) =30 and minutes_active IS NOT NULL AND workouts_completed > 0;
SELECT count (customer_id)
FROM usage
WHERE ((minutes_active) / (workouts_completed)) =30 and minutes_active IS NOT NULL AND workouts_completed > 0;
update usage 
set minutes_active = workouts_completed*30
where minutes_active is null;   -- changing the null data to have value accurding to the avg value--

select*from subscriptions;








