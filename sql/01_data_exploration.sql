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
