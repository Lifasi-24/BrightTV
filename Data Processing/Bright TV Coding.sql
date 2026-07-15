-- Databricks notebook source
--Telling databricks to use sql_fundamentals catalog and brighttv schema to shorten the table path
USE sql_fundamentals.brighttv;

--Running full tables to see what I have
SELECT *
FROM user_profiles;

SELECT *
FROM viewership;

----Gender checks---
SELECT DISTINCT Gender
FROM user_profiles;

--cleaning up gender
SELECT DISTINCT 
    CASE 
        WHEN Gender = ' ' THEN 'unknown' --replaces empty space with unknown
        WHEN Gender = 'None' THEN 'unknown' --replaces none with unknown
        WHEN Gender IS NULL THEN 'unknown' --replaces null with unknown
    ELSE Gender --returns the gender as it is on the data
    END AS gender_clean --my new gender column name 
FROM user_profiles;

---Race Checks---
SELECT DISTINCT Race
FROM user_profiles;

SELECT DISTINCT 
    CASE 
        WHEN Race = 'other' THEN 'unknown' 
        WHEN Race = ' ' THEN 'unknown' 
        WHEN Race = 'None' THEN 'unknown'
    ELSE Race 
    END AS race_clean
FROM user_profiles;
