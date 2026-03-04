-- Анализ удержания клиентов в первый день
-- Продукт: Цифровой гардероб WID


WITH first_activity AS (
    SELECT 
        user_id,
        MIN(event_date) AS first_date
    FROM events
    WHERE event_name = 'activity'
    GROUP BY user_id
),

next_day_activity AS (
    SELECT DISTINCT e.user_id
    FROM events e
    JOIN first_activity f 
        ON e.user_id = f.user_id
    WHERE e.event_name = 'activity'
      AND e.event_date = f.first_date + INTERVAL '1 day'
)

SELECT
    COUNT(DISTINCT f.user_id) AS total_users,
    COUNT(DISTINCT n.user_id) AS returned_next_day,

    ROUND(
        COUNT(DISTINCT n.user_id) * 1.0
        / NULLIF(COUNT(DISTINCT f.user_id), 0),
    3) AS day_1_retention_rate

FROM first_activity f
LEFT JOIN next_day_activity n 
    ON f.user_id = n.user_id
