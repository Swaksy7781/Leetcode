WITH StartTimes AS (
    SELECT machine_id, process_id, timestamp AS start_time
    FROM Activity
    WHERE activity_type = 'start'
),
EndTimes AS (
    SELECT machine_id, process_id, timestamp AS end_time
    FROM Activity
    WHERE activity_type = 'end'
),
ProcessDurations AS (
    SELECT st.machine_id, st.process_id, end_time - start_time AS duration
    FROM StartTimes st
    JOIN EndTimes et ON st.machine_id = et.machine_id AND st.process_id = et.process_id
)
SELECT machine_id, ROUND(AVG(duration), 3) AS processing_time
FROM ProcessDurations
GROUP BY machine_id;