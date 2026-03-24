-- Запрос по построению воронки продаж
-- Продукт: Цифровой гардероб WID
-- Этапы: Посещение → Регистрация → Активность → Подписка


-- Этот запрос строит полную воронку продаж и вычисляет
-- коэффициенты конверсии между каждым этапом


with visits as (
    select distinct user_id
    from events
    where event_name = 'visit'
),

registrations as (
    select distinct user_id
    from users
),

activity as (
    select distinct user_id
    from events
    where event_name = 'activity'
),

subscriptions_stage as (
    select distinct user_id
    from subscriptions
)

select
    count(distinct v.user_id) as visits_users,
    count(distinct r.user_id) as registrations_users,
    count(distinct a.user_id) as active_users,
    count(distinct s.user_id) as subscribed_users,

    round(
        count(distinct r.user_id) * 1.0 
        / nullif(count(distinct v.user_id), 0), 
    3) as visit_to_registration_rate,

    round(
        count(distinct a.user_id) * 1.0 
        / nullif(count(distinct r.user_id), 0), 
    3) as registration_to_activity_rate,

    round(
        count(distinct s.user_id) * 1.0 
        / nullif(count(distinct a.user_id), 0), 
    3) as activity_to_subscription_rate

from visits v
left join registrations r on v.user_id = r.user_id
left join activity a on v.user_id = a.user_id
left join subscriptions_stage s on v.user_id = s.user_id
