-- Анализ удержания клиентов в первый день
-- Продукт: Цифровой гардероб WID


with first_activity as (
    select
        user_id,
        MIN(event_date) as first_date
    from events
    where event_name = 'activity'
    group by user_id
),

next_day_activity as (
    select distinct e.user_id
    from events e
    join first_activity f 
        on e.user_id = f.user_id
    where e.event_name = 'activity'
      and e.event_date = f.first_date + INTERVAL '1 day'
)

select
    count(distinct f.user_id) as total_users,
    count(distinct n.user_id) as returned_next_day,

    round(
        count(distinct n.user_id) * 1.0
        / nullif(count(distinct f.user_id), 0),
    3) as day_1_retention_rate

from first_activity f
left join next_day_activity n 
    on f.user_id = n.user_id
