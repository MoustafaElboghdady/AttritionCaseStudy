/*Attrition Report*/

/* Toguarantee there will be no Duplications when Appending the table*/
ALTER TABLE hr_attrition_data ADD PRIMARY KEY ("EmployeeNumber");
SELECT * FROM hr_attrition_data;

/*  1.creating dim tables to prepare Data set */

CREATE OR REPLACE VIEW dim_education AS
SELECT DISTINCT
    "Education" AS "EducationID",
    CASE "Education"
        WHEN 1 THEN 'Below College'
        WHEN 2 THEN 'College'
        WHEN 3 THEN 'Bachelor'
        WHEN 4 THEN 'Master'
        WHEN 5 THEN 'Doctor'
    END AS "EducationLevel"
FROM hr_attrition_data
ORDER BY "EducationID";


CREATE OR REPLACE VIEW dim_jobrole AS
SELECT DISTINCT
    DENSE_RANK() OVER (ORDER BY "Department", "JobRole") AS "JobRoleID",
    "Department",
    "JobRole"
FROM hr_attrition_data;


CREATE OR REPLACE VIEW dim_employee AS
SELECT
    "EmployeeNumber",
    "Age",
    "Gender",
    "MaritalStatus",
    "DistanceFromHome",
    "NumCompaniesWorked",
    "TotalWorkingYears",
    "ExperienceLevel"
FROM hr_attrition_data;


CREATE OR REPLACE VIEW fact_hr_attrition AS
SELECT 
    h."EmployeeNumber",
    j."JobRoleID",
    h."Education" AS "EducationID",
    h."Attrition",
    h."MonthlyIncome",
    h."DailyRate",
    h."HourlyRate",
    h."MonthlyRate",
    h."PercentSalaryHike",
    h."StockOptionLevel",
    h."JobSatisfaction",
    h."EnvironmentSatisfaction",
    h."RelationshipSatisfaction",
    h."WorkLifeBalance",
    h."JobInvolvement",
    h."PerformanceRating",
    h."JobLevel",
    h."OverTime",
    h."BusinessTravel",
    h."TrainingTimesLastYear",
    h."YearsAtCompany",
    h."YearsInCurrentRole",
    h."YearsSinceLastPromotion",
    h."YearsWithCurrManager"
FROM hr_attrition_data h
JOIN dim_jobrole j 
  ON h."Department" = j."Department" 
 AND h."JobRole" = j."JobRole";



/*#2.The attrition count and average Monthly Income for each Department and JobRole.#*/


SELECT 
    j."Department",
    j."JobRole",
    COUNT(*) FILTER (WHERE f."Attrition" = 'Yes') AS attrition_count,
    ROUND(AVG(f."MonthlyIncome"), 2) AS avg_monthly_income
FROM fact_hr_attrition f
JOIN dim_jobrole j ON f."JobRoleID" = j."JobRoleID"
GROUP BY j."Department", j."JobRole"
ORDER BY attrition_count DESC;






















