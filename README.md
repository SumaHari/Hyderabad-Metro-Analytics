# Metro Transportation Analytics

An end-to-end analysis of Metro transactions prepared across Excel, Python, SQL, and Power BI. The project explores passenger activity, revenue, stations, routes, travel times, and customer segments.

## Workflow

```text
Metro_Raw_Data.xlsx
    → Excel review and preparation
Metro_cln_data.csv
    → Python cleaning and feature preparation
Metro_cmpt_cleaned_data_fixed.csv
    → SQL analysis
Metro_Analysis.sql
    → Power BI report
Metro BI.pbix
```

These are the filenames used for the project handoffs.

## Files

| File | Description |
|---|---|
| `Metro_Raw_Data.xlsx` | Original transaction data and Excel working sheets. |
| `Metro_cln_data.csv` | CSV prepared in Excel and used as the Python input. |
| `Metro_cmpt_cleaned_data_fixed.csv` | Python output used as the SQL input. |
| `Metro_Analysis.sql` | SQL validation and analysis queries. |
| `Metro BI.pbix` | Power BI report with Overview, Passenger Analysis, and Station & Revenue Analysis pages. |

## Dataset

The files use transaction fields including:

- Transaction and journey details: `Transaction_ID`, `Date`, `Time`, `Entry_Station`, `Exit_Station`, `Line`, `Route`
- Fare and travel details: `Fare`, ` Revenue`, `Distance_KM`, `Journey_Duration_Min`
- Passenger details: `Passenger_Type`, `Age`, `Age group`, `Gender`
- Ticket and payment details: `Ticket_Type`, `Payment_Mode`
- Derived fields: `Month`, `Month number`, `Day`, `Day_Name`, `Hour`, `Peak flag`, `Peak_Category`, `Peak_Flag`
- Data checks: `Duplicate ID`, `Missing entry station`, `Fare validation`, `Age validation`, `Duration validation`

Column names and derived fields may vary slightly between the Excel and Python CSVs as the data moves through the workflow.

## Analysis included

- Passenger and transaction counts
- Total revenue and average fare
- Station and route activity
- Revenue and passenger activity by Metro line
- Hourly and peak-period demand
- Passenger, ticket, payment, age, and gender breakdowns

## Getting started

1. Open `Metro_Raw_Data.xlsx` to review the original data and Excel work.
2. Use `Metro_cln_data.csv` as the input for the Python stage.
3. Use `Metro_cmpt_cleaned_data_fixed.csv` as the data file for SQL analysis.
4. Open `Metro_Analysis.sql` in the SQL environment where the project data is available.
5. Open `Metro BI.pbix` in Power BI Desktop to explore the report.
