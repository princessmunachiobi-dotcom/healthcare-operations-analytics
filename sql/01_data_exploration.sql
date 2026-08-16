-- Healthcare Operations Analytics
-- File: 01_data_exploration.sql
-- Purpose: Initial exploration of hospital encounter data

-- 1. Preview the dataset
SELECT *
FROM healthcare_operations
LIMIT 10;

-- 2. Count total encounters
SELECT COUNT(*) AS total_encounters
FROM healthcare_operations;

-- 3. Review encounter volume by department
SELECT
    department,
    COUNT(*) AS encounter_count
FROM healthcare_operations
GROUP BY department
ORDER BY encounter_count DESC;

-- 4. Review encounter volume by encounter type
SELECT
    encounter_type,
    COUNT(*) AS encounter_count
FROM healthcare_operations
GROUP BY encounter_type
ORDER BY encounter_count DESC;

-- 5. Calculate average wait time by department
SELECT
    department,
    ROUND(AVG(wait_time_minutes), 2) AS avg_wait_time_minutes
FROM healthcare_operations
GROUP BY department
ORDER BY avg_wait_time_minutes DESC;

-- 6. Calculate average patient satisfaction by department
SELECT
    department,
    ROUND(AVG(patient_satisfaction_score), 2) AS avg_satisfaction_score
FROM healthcare_operations
GROUP BY department
ORDER BY avg_satisfaction_score DESC;

-- 7. Examine 30-day readmissions
SELECT
    readmitted_30_days,
    COUNT(*) AS encounter_count
FROM healthcare_operations
GROUP BY readmitted_30_days;

-- 8. Review SLA performance
SELECT
    sla_met,
    COUNT(*) AS encounter_count
FROM healthcare_operations
GROUP BY sla_met;


-- 9. Average wait time by encounter type
SELECT
    encounter_type,
    ROUND(AVG(wait_time_minutes), 2) AS avg_wait_minutes,
    ROUND(AVG(length_of_stay_hours), 2) AS avg_length_of_stay
FROM healthcare_operations
GROUP BY encounter_type
ORDER BY avg_wait_minutes DESC;

-- 10. Monthly emergency encounter trends
SELECT
    strftime('%Y-%m', encounter_date) AS month,
    COUNT(*) AS emergency_encounters,
    ROUND(AVG(wait_time_minutes), 2) AS avg_wait_minutes
FROM healthcare_operations
WHERE encounter_type = 'Emergency'
GROUP BY month
ORDER BY month;

SQL
-- SLA compliance by department
-- Project-defined benchmark: wait time of 45 minutes or less

SELECT
    department,
    COUNT(*) AS total_encounters,
    SUM(CASE WHEN wait_time_minutes <= 45 THEN 1 ELSE 0 END) AS within_sla,
    SUM(CASE WHEN wait_time_minutes > 45 THEN 1 ELSE 0 END) AS missed_sla,
    ROUND(
        100.0 * SUM(CASE WHEN wait_time_minutes <= 45 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS sla_compliance_pct
FROM healthcare_operations
GROUP BY department
ORDER BY sla_compliance_pct ASC;
