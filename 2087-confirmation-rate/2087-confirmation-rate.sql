WITH UserConfirmations AS (
    SELECT
        s.user_id,
        COUNT(c.action) AS total_confirmations,
        SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) AS confirmed_count
    FROM
        Signups s
    LEFT JOIN
        Confirmations c ON s.user_id = c.user_id
    GROUP BY
        s.user_id
)
SELECT
    user_id,
    ROUND(COALESCE(CAST(confirmed_count AS DECIMAL) / total_confirmations, 0), 2) AS confirmation_rate
FROM
    UserConfirmations;