# Healthcare Operations Analytics

## Project Overview

This project demonstrates how SQL can be used to analyze healthcare operational data and transform raw encounter-level information into actionable insights.

The analysis focuses on key operational areas including:

- Patient encounter volume
- Department utilization
- Wait-time performance
- SLA compliance
- Emergency encounter trends
- Operational performance by department and encounter type

## Business Problem

Healthcare organizations generate large volumes of operational data every day. Leadership teams need clear, data-driven insights to identify workflow bottlenecks, monitor service-level performance, and improve patient access and operational efficiency.

This project uses SQL to answer practical healthcare operations questions and demonstrates how structured data analysis can support operational decision-making.


## Dataset

The project uses a simulated healthcare operations dataset containing encounter-level information such as:

- Encounter date
- Department
- Encounter type
- Wait time
- Length of stay
- Patient satisfaction score
- Readmission status

The dataset is synthetic and contains no real patient information or protected health information (PHI).

## SQL Skills Demonstrated

This project demonstrates practical SQL skills including:

- `SELECT` statements
- `COUNT()` and `AVG()` aggregate functions
- `GROUP BY` and `ORDER BY`
- Conditional aggregation using `CASE WHEN`
- Common Table Expressions (CTEs)
- Date aggregation and trend analysis
- SLA performance calculations
- Operational KPI analysis

## Key Analyses

The SQL analysis answers several operational questions:

1. Which departments handle the highest encounter volumes?
2. Which departments experience the longest average wait times?
3. What percentage of encounters meet the 45-minute wait-time SLA?
4. How does SLA performance vary by department?
5. Which encounter types experience the longest waits?
6. How does emergency encounter volume and wait time change by month?


## Key Findings

The SQL analysis identified several operational patterns within the simulated healthcare dataset:

- **Neurology recorded the highest encounter volume**, with 178 encounters, indicating comparatively high utilization within the dataset.
- **Emergency encounters experienced the longest average wait times**, at approximately 60 minutes.
- Department-level analysis showed meaningful differences in wait-time performance and the percentage of encounters meeting the **45-minute SLA target**.
- Emergency department performance varied across months, demonstrating the value of monitoring operational KPIs over time rather than relying only on overall averages.
- Encounter-type analysis revealed differences in utilization and wait-time performance across Emergency, Inpatient, Outpatient, and Observation encounters.

## Business Interpretation

The results demonstrate how healthcare operations teams can use encounter data to identify areas requiring additional investigation.

Higher encounter volume may indicate departments where staffing and resource allocation should be reviewed. Longer wait times and lower SLA compliance may signal workflow bottlenecks, capacity constraints, scheduling challenges, or periods of increased demand.

Monthly trend analysis can also help leadership distinguish persistent performance issues from temporary fluctuations.

## Recommendations

Based on the analysis, healthcare operations leadership could:

1. Investigate departments with high encounter volumes and longer wait times for potential staffing or workflow constraints.
2. Monitor 45-minute SLA compliance as an ongoing operational KPI.
3. Analyze emergency department performance by month, day, and time of day to identify peak-demand periods.
4. Compare staffing levels with encounter volume and wait-time trends.
5. Use additional clinical and operational variables to investigate the root causes of delays.

## Tools Used

- SQL
- SQLite
- DB Browser for SQLite
- GitHub

## Repository Structure

```text
healthcare-operations-analytics/
│
├── data/
│   └── healthcare_operations_data.csv
│
├── sql/
│   └── 01_data_exploration.sql
│
└── README.md
