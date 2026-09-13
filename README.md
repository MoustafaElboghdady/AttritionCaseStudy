# HR Attrition Analysis — Case Study

## Overview
End-to-end HR analytics case study built to identify the key drivers of employee attrition, flag high-risk organizational segments, and turn those findings into actionable retention recommendations.

## Dataset
IBM HR Analytics Employee Attrition dataset — 1,470 employees, including demographics, compensation, tenure, satisfaction scores, and attrition status.

## Tools & Pipeline
- **Python** — data cleaning and preparation
- **PostgreSQL** — relational data modeling (star schema) and querying
- **Power BI** — dashboarding, DAX measures, and visual analysis
- **PowerPoint** — stakeholder-facing case study deck

## Key Findings
- Overall attrition rate: **16.12%**
- Employees working overtime: **53.6%** attrition — the strongest single driver in the dataset
- Frequent business travelers: **24.9%** attrition
- Employees with no stock options: **24.4%** attrition
- Sales Department: highest attrition among all departments at **20.6%**, driven mainly by the Sales Representative role at **39.8%**
- Employees with less than 1 year of tenure ("Tenure Vulnerability"): **36.36%** attrition
- Employees with 5+ previous jobs: attrition above **25%**
- Attrition trends upward with distance from home, reaching up to **40%**
- Attrited employees report consistently lower satisfaction scores across every satisfaction metric measured

## Recommendations
1. **Onboarding** — redesign the first 90 days to address the high first-year attrition rate.
2. **Overtime** — redistribute workload or hire additional staff in high-overtime departments instead of relying on extended hours.
3. **Sales Department** — review the business travel policy, reassess the entry-level salary structure, and strengthen onboarding support for new Sales Representatives.

## Business Impact
Reducing attrition in these high-risk segments — especially the Sales Representative role, the single most affected position — lowers the recurring cost of rehiring and retraining.

## Files
- `Attrition_Report.pptx` — full case study presentation
