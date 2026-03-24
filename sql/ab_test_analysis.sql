-- Анализ A/B-тестирования: сценарий монетизации
-- Продукт: Цифровой гардероб WID

with experiment_data as (
    select
        user_id,
        group_name,      -- 'A' or 'B'
        subscribed,      -- 1 = subscribed
        revenue
    from ab_test_dataset
),

aggregated as (
    select
        group_name,
        count(*) as users,
        SUM(subscribed) as subscriptions,
        SUM(revenue) as total_revenue,

        ROUND(
            SUM(subscribed) * 1.0 
            / NULLIF(count(*), 0), 
        4) as conversion_rate,

        ROUND(
            SUM(revenue) * 1.0 
            / NULLIF(count(*), 0), 
        2) as arpu

    from experiment_data
    group by group_name
)

select *
from aggregated
