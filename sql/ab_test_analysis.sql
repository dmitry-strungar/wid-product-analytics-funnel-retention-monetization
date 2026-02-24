-- A/B Test Analysis: Monetization Scenario
-- Product: WID Digital Wardrobe

WITH experiment_data AS (
    SELECT
        user_id,
        group_name,      -- 'A' or 'B'
        subscribed,      -- 1 = subscribed
        revenue
    FROM ab_test_dataset
),

aggregated AS (
    SELECT
        group_name,
        COUNT(*) AS users,
        SUM(subscribed) AS subscriptions,
        SUM(revenue) AS total_revenue,

        ROUND(
            SUM(subscribed) * 1.0 
            / NULLIF(COUNT(*), 0), 
        4) AS conversion_rate,

        ROUND(
            SUM(revenue) * 1.0 
            / NULLIF(COUNT(*), 0), 
        2) AS arpu

    FROM experiment_data
    GROUP BY group_name
)

SELECT *
FROM aggregated
