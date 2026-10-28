# Business Problem Document — Metro Transportation Analytics

## 1. Executive summary

This project analyzes Metro journey/transaction records to help transport operations and management understand demand, fare revenue, station activity, line performance, travel timing, and passenger/payment segments. The intended outcome is a reproducible analytics workflow and a Power BI management report that turns transaction-level data into operational questions and measurable follow-up actions.

**Important scope note:** the supplied data contains 19,998 rows covering 1 January–31 December 2025. The files do not establish whether these records are live operational data or a practice/synthetic dataset. Findings below are therefore descriptive of the supplied dataset, not claims about actual Hyderabad Metro operations.

## 2. Business context

Metro managers need to understand where and when journeys occur, which entry stations and lines carry the most recorded activity, how fare revenue is distributed, and which passenger, ticket, and payment groups are most common. Spreadsheet-only review can be difficult to repeat consistently, while disconnected analysis files can create mismatched figures. This project uses one connected pipeline:

**Excel validation → Python cleaning and exploratory analysis → SQL storage and business queries → Power BI reporting.**

## 3. Problem statement

The business problem is to make Metro transaction data easier to validate, analyze, and use for operational decisions. The project should provide a consistent view of ridership proxies (journey/transaction counts), fare revenue, station and line performance, hourly and peak-period patterns, and customer/ticket/payment mix—while making data-quality issues visible before management relies on the results.

## 4. Business objectives

1. Establish a repeatable quality-check process for transaction and journey data.
2. Summarize total recorded journeys and fare revenue over time.
3. Identify high-activity entry stations and compare station activity with revenue.
4. Compare passenger counts and revenue across Metro lines.
5. Understand hourly demand and investigate peak/off-peak patterns.
6. Describe passenger, ticket-type, and payment-mode mix.
7. Reconcile key metrics across Excel, Python, SQL, and Power BI.
8. Present findings in a dashboard that supports evidence-based operational discussion.

## 5. Stakeholders and decisions supported

| Stakeholder | Questions the analysis can support | Example decision area |
|---|---|---|
| Operations manager | When and where is recorded demand concentrated? | Review staffing, queue management, and service planning |
| Station manager | Which entry stations record the most journeys? | Prioritize station-level investigation |
| Service planning team | How does demand vary by hour, day, line, and route? | Evaluate timetables and capacity using operational data |
| Finance/revenue team | How is fare revenue distributed across lines and segments? | Reconcile revenue and investigate unusual patterns |
| Customer experience team | Which ticket and payment modes are used most? | Review payment availability and customer guidance |
| Data/BI team | Do counts and revenue reconcile through the pipeline? | Improve data controls and reporting reliability |

These are intended uses, not claims that the project has measured staffing needs, crowding, or service capacity directly.

## 6. Key business questions

- How many records/journeys are represented, and what is total fare revenue?
- What are the average fare and average journey duration?
- Which entry stations have the highest recorded activity?
- Which Metro line has the most journeys and fare revenue?
- Which hours have the most records?
- How do weekday and weekend patterns compare?
- How do passenger types, ticket types, and payment modes differ in volume and revenue?
- Which stations show concentrated activity during defined peak periods?
- Are there invalid fares, unusual ages, duplicate transaction IDs, or inconsistent time classifications?
- Do Excel, Python, SQL, and Power BI report the same row counts, date range, and revenue?

## 7. Dataset and scope

### In scope
- Transaction/journey fields: `Transaction_ID`, `Date`, `Time`, `Entry_Station`, `Exit_Station`, `Line`, `Route`
- Fare and travel fields: `Fare`, `Revenue`/` Revenue`, `Distance_KM`, `Journey_Duration_Min`
- Passenger/ticket/payment fields: `Passenger_Type`, `Age`, `Gender`, `Age group`, `Ticket_Type`, `Payment_Mode`
- Derived fields: month, month number, day/day name, hour, and peak classifications
- Quality checks: duplicate IDs, missing station, fare validation, age validation, and duration validation
- Excel, Python, SQL, and Power BI hand-offs and reporting

### Out of scope / not evidenced by supplied files
- Live train capacity, vehicle occupancy, platform crowding, timetable adherence, service disruptions, and staffing levels
- Operating costs, profit, subsidy, and audited accounting revenue
- Causal claims about why demand changes
- Forecasting or service optimization unless separately implemented and validated

## 8. Success criteria

The project is successful when:
- Critical fields and business rules are documented.
- Duplicate and invalid records are identified and treatment is explainable.
- Data types and derived fields are consistent between stages.
- Row count, distinct transaction count, date range, and fare totals reconcile between stages.
- SQL queries answer the stated business questions.
- The Power BI report contains clear KPIs, trends, comparisons, and filters.
- Every published finding includes a metric/evidence, business implication, and a proportionate recommendation.

## 9. Data quality risks identified in the supplied analytical CSV

A programmatic profile of `Metro_cmpt_cleaned_data_fixed.csv` found:

- 19,998 rows and 19,997 distinct `Transaction_ID` values; one ID is duplicated (two rows are involved).
- Two records have non-positive fares; the minimum fare is -5.00.
- Two ages fall outside a basic 0–120 plausibility range; maximum age is 150.
- Three records have `Duration validation` values other than `Valid` (`#REF!` or `Check`).
- The `Peak flag` column contains only `Peak`, so it cannot distinguish peak from off-peak.
- `Peak_Category` and `Peak_Flag` use different labels/distributions; these classifications should be reconciled against the intended hour rules before they are used for management decisions.
- The field named ` Revenue` has a leading space and appears to duplicate `Fare` in the sample rows; confirm whether it is a separate business measure or a redundant field.

These issues should be reviewed rather than silently ignored. The appropriate treatment (correct, exclude, retain with a flag, or investigate) depends on the business definition and original source.

## 10. Risks and assumptions

- Counts are treated as recorded transaction/journey counts, not independently verified passenger headcounts.
- `SUM(Fare)` is used as a fare-revenue proxy. It should not be called audited revenue without reconciliation to the source system.
- The dataset covers one calendar year; year-over-year conclusions cannot be made from this file alone.
- Peak-period definitions need an agreed rule and consistent labels.
- The SQL script currently references different table names in different queries; execution should be standardized before claiming a fully validated SQL pipeline.
- The Power BI `.pbix` file is present, but its internal visuals/measures were not independently inspected in this document-generation pass.

## 11. Recommended next steps

1. Agree on the authoritative transaction ID, fare, duration, age, and peak-period rules.
2. Resolve the duplicate ID and investigate the two non-positive fares and implausible ages.
3. Standardize the peak classification into one authoritative field and document the hour boundaries.
4. Standardize SQL table names and database dialect; run the complete script from a clean database.
5. Reconcile row counts, distinct IDs, date range, and fare total at every hand-off.
6. Capture actual Power BI screenshots and verified measures in the repository.
7. Add 5–7 evidence-backed findings with the format **finding → evidence → business impact → recommendation**.

## 12. Expected business value

The intended value is a more transparent and repeatable reporting process: management can explore demand and fare patterns, identify areas requiring investigation, and ask follow-up questions using consistent definitions. Operational actions should only be taken after findings are checked against reliable operational data and relevant context.
