CREATE DATABASE PimaDiabetesdb

SELECT * FROM Patients;
SELECT * FROM Measurements;

--1. Filtering table; relate patient ID to AGE, GLUCOSE, BMI, AND DIABETES OUTCOME   
SELECT p.age, m.glucose, m.bmi, m.outcome
FROM Patients p
JOIN Measurements m ON p.patient_id = m.patient_id;

--TASK 1: Diabetes rate & health metrics by age group
SELECT 
    CASE 
        WHEN p.age < 30 THEN 'Under 30'
        WHEN p.age BETWEEN 30 AND 45 THEN '30-45'
        ELSE '45+'
    END AS age_group,
    COUNT(*) AS total_patients,
    ROUND(AVG(CAST(m.glucose AS FLOAT)), 1) AS avg_glucose,
    ROUND(AVG(m.bmi), 1) AS avg_bmi,
    ROUND(AVG(CAST(m.outcome AS FLOAT)) * 100, 1) AS diabetes_rate_percent
FROM Patients p
JOIN Measurements m ON p.patient_id = m.patient_id
GROUP BY 
    CASE 
        WHEN p.age < 30 THEN 'Under 30'
        WHEN p.age BETWEEN 30 AND 45 THEN '30-45'
        ELSE '45+'
    END;    
   





   --TASK 2: Diabetic vs Non diabetic comparison
   SELECT outcome, glucose, bmi, blood_pressure
FROM Measurements;

--1. GROUPING
SELECT 
    outcome,
    COUNT(*) AS total_patients,
    ROUND(AVG(CAST(glucose AS FLOAT)), 1) AS avg_glucose,
    ROUND(AVG(bmi), 1) AS avg_bmi,
    ROUND(AVG(CAST(blood_pressure AS FLOAT)), 1) AS avg_blood_pressure
FROM Measurements
GROUP BY outcome
ORDER BY outcome;
