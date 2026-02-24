-- Funnel Construction Query
-- Product: WID Digital Wardrobe
-- Stages: Visit → Registration → Activity → Subscription


-- This query builds the full user funnel and calculates
-- conversion rates between each stage.


WITH visits AS (
    SELECT DISTINCT user_id
    FROM events
    WHERE event_name = 'visit'
),

registrations AS (
    SELECT DISTINCT user_id
    FROM users
),

activity AS (
    SELECT DISTINCT user_id
    FROM events
    WHERE event_name = 'activity'
),

subscriptions_stage AS (
    SELECT DISTINCT user_id
    FROM subscriptions
)

SELECT
    COUNT(DISTINCT v.user_id) AS visits_users,
    COUNT(DISTINCT r.user_id) AS registrations_users,
    COUNT(DISTINCT a.user_id) AS active_users,
    COUNT(DISTINCT s.user_id) AS subscribed_users,

    ROUND(
        COUNT(DISTINCT r.user_id) * 1.0 
        / NULLIF(COUNT(DISTINCT v.user_id), 0), 
    3) AS visit_to_registration_rate,

    ROUND(
        COUNT(DISTINCT a.user_id) * 1.0 
        / NULLIF(COUNT(DISTINCT r.user_id), 0), 
    3) AS registration_to_activity_rate,

    ROUND(
        COUNT(DISTINCT s.user_id) * 1.0 
        / NULLIF(COUNT(DISTINCT a.user_id), 0), 
    3) AS activity_to_subscription_rate

FROM visits v
LEFT JOIN registrations r ON v.user_id = r.user_id
LEFT JOIN activity a ON v.user_id = a.user_id
LEFT JOIN subscriptions_stage s ON v.user_id = s.user_id
