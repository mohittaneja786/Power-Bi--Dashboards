

--- Database creation
/*
IF DB_ID('HealthcareDB') IS NOT NULL
    DROP DATABASE HealthcareDB;

CREATE DATABASE HealthcareDB;

USE HealthcareDB;
GO

*/

--CREATE SCHEMA gold;
/*
IF OBJECT_ID('gold.healthcare', 'U') IS NOT NULL
    DROP TABLE gold.healthcare;

CREATE TABLE gold.healthcare (
    age INT,
    blood_pressure INT,
    bmi FLOAT,
    cholesterol INT,
    exercise_level INT,
    gender VARCHAR(10),
    smoking VARCHAR(10),
    alcohol VARCHAR(10),
    diabetes VARCHAR(10),
    heart_disease VARCHAR(10),
    stroke VARCHAR(10),
    fatigue VARCHAR(10),
    health_risk_score INT
);
*/

--select * from gold.healthcare

--Drop Table gold.healthcare

-- Insertion into all Gold table

INSERT INTO gold.healthcare
SELECT
    age
    ,blood_pressure
    ,bmi
    ,glucose
    ,exercise_level AS exercise_level,
    CASE 
        WHEN gender IN ('Male','M') THEN 'Male'
        WHEN gender IN ('Female','F') THEN 'Female'
        ELSE 'Other'
    END AS gender,
    
    CAST(
    CASE 
        WHEN alcohol = 1 THEN 'True'
        WHEN alcohol = 0 THEN 'False'
        ELSE 'Other'
    END AS VARCHAR(10)
    ) AS alcohol,

    CAST(
    CASE 
        WHEN smoking = 1 THEN 'True'
        WHEN smoking = 0 THEN 'False'
        ELSE 'Other'
    END AS VARCHAR(10)
    ) AS smoking,

    CAST(
    CASE 
        WHEN diabetes = 1 THEN 'True'
        WHEN diabetes = 0 THEN 'False'
        ELSE 'Other'
    END AS VARCHAR(10)
    ) AS diabetes,

    CAST(
    CASE 
        WHEN fatigue = 1 THEN 'True'
        WHEN fatigue = 0 THEN 'False'
        ELSE 'Other'
    END AS VARCHAR(10)
    ) AS fatigue,

    CAST(
    CASE 
        WHEN chest_pain = 1 THEN 'True'
        WHEN chest_pain = 0 THEN 'False'
        ELSE 'Other'
    END AS VARCHAR(10)
    ) AS chest_pain,

    CAST(
    CASE 
        WHEN stroke = 1 THEN 'True'
        WHEN stroke = 0 THEN 'False'
        ELSE 'Other'
    END AS VARCHAR(10)
    ) AS stroke,
    health_risk_score
  
from healthcare_raw;