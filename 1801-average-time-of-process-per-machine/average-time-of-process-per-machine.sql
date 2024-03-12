# Write your MySQL query statement below
select DISTINCT e1.machine_id, round((e3.sum_end - e2.sum_start)/e4.cnt,3) as processing_time from (select DISTINCT machine_id from activity) e1, 
(select machine_id,round(sum(timestamp),3) as sum_start from activity where activity_type="start" group by machine_id) e2,
(select machine_id,round(sum(timestamp),3) as sum_end from activity where activity_type="end" group by machine_id) e3,
(select machine_id,count(*)/2 as cnt from activity group by machine_id) e4
where e2.machine_id = e1.machine_id and e3.machine_id = e1.machine_id;