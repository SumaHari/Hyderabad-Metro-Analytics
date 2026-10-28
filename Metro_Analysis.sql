use metro_analytics;

# Validate Load



# How did you confirm the data loaded correctly?

select count(*) as total_records
from metro_trans;

# How did you find duplicate IDs?

SELECT Transaction_ID, 
COUNT(*) AS Record_Count 
FROM metro_trans
GROUP BY Transaction_ID 
HAVING COUNT(*) > 1;

SELECT * 
FROM metro_trans 
WHERE Entry_Station IS NULL   
OR fare IS NULL;

SELECT * 
FROM metro_trans
WHERE fare <= 0;




# How did you find missing critical values?

SELECT *
 FROM metro_trans 
WHERE Entry_Station IS NULL OR 
Fare IS NULL;

#  How do you calculate total passengers

select 
count(Distinct Transaction_ID) AS Total_passengers
from metro_trans;



    #               Core Business Questions

# How do you calculate total revenue?

select sum(Fare) As Total_Revenue 
from metro_trans;

#  How do you calculate average fare?

select avg(Fare) AS Average_Fare
from metro_trans;

# How do you find top 10 stations?

select Entry_Station,
count(*) as passenger_count
from metro_trans
group by Entry_Station
order by passenger_count desc
LIMIT 10;

# How do you compare passengers and revenue by line?

SELECT Line, 
COUNT(*) AS Passengers, 
SUM(Fare) AS Revenue 
FROM metro_trans
GROUP BY Line 
ORDER BY Revenue DESC;

  # How do you find peak-hour demand?

SELECT Hour, 
COUNT(*) AS Passenger_Count 
FROM metro_trans
GROUP BY Hour 
ORDER BY Passenger_Count DESC;

# Hourly demand

SELECT Hour, 
COUNT(*) AS Trips, 
SUM(Fare) AS Revenue 
FROM metro_trips 
GROUP BY Hour 
ORDER BY Hour;

# How do you compare passenger type and revenue?
# Passenger analysis
SELECT Passenger_Type, 
COUNT(*) AS Trips, 
SUM(Fare) AS Revenue, 
AVG(Fare) AS Avg_Fare 
FROM metro_trans 
GROUP BY Passenger_Type 
ORDER BY Trips DESC;

SELECT Passenger_Type, 
COUNT(*) AS Passengers, 
SUM(Fare) AS Revenue 
FROM metro_trans
GROUP BY Passenger_Type 
ORDER BY Passengers DESC;


# How do you analyze payment methods?

SELECT Payment_Mode, 
COUNT(*) AS Transactions, 
SUM(Fare) AS Revenue 
FROM metro_trans 
GROUP BY Payment_Mode
ORDER BY Transactions DESC;

# Station Ranking

SELECT Entry_Station, 
COUNT(*) AS Passengers, 
RANK() OVER ( 
ORDER BY COUNT(*) DESC 
) AS Station_Rank 
FROM Metro_Transactions 
GROUP BY Entry_Station;

# Passengers by station

SELECT Entry_Station,
count(*) AS Passenger_Count
from metro_trans
group by Entry_Station
Order by Passenger_Count desc;


# Route analysis

SELECT Entry_Station, Exit_Station, 
COUNT(*) AS Journey_Count 
FROM metro_trans 
GROUP BY Entry_Station, Exit_Station 
ORDER BY Journey_Count DESC;

# Daily trips and revenue

SELECT Date,
count(*) AS Trips,
sum(Fare) AS Revenue
from metro_trans
group by Date
order by Date;

# Top stations

SELECT Entry_Station, 
COUNT(*) AS Trips, 
SUM(Fare) AS Revenue, 
AVG(Fare) AS Avg_Fare 
FROM metro_trans 
GROUP BY Entry_Station 
ORDER BY Trips DESC 
LIMIT 10;

#  Line performance

SELECT Line, 
COUNT(*) AS Passengers, 
SUM(Fare) AS Revenue 
FROM metro_trans
GROUP BY Line 
ORDER BY Revenue DESC;

SELECT Line, 
COUNT(*) AS Trips, 
SUM(Fare) AS Revenue, 
AVG(Journey_Duration_Min) AS Avg_Duration 
FROM metro_trans 
GROUP BY Line 
ORDER BY Revenue DESC;

# Peak vs off-peak

SELECT Peak_Flag, 
COUNT(*) AS Trips, 
SUM(Fare) AS Revenue, 
AVG(Fare) AS Avg_Fare 
FROM metro_trans
GROUP BY Peak_Flag;


# Ticket/payment analysis

SELECT Ticket_Type, Payment_Mode,
COUNT(*) AS Trips, 
SUM(Fare) AS Revenue 
FROM metro_trips 
GROUP BY Ticket_Type, Payment_Mode 
ORDER BY Trips DESC;

# Station + peak analysis

SELECT Entry_Station, 
COUNT(*) AS Peak_Trips 
FROM metro_trans 
WHERE Peak_Flag = "Morning-Peak" 
GROUP BY Entry_Station 
ORDER BY Peak_Trips DESC;

SELECT Entry_Station, 
COUNT(*) AS Peak_Trips 
FROM metro_trans 
WHERE Peak_Flag = "Evening-Peak" 
GROUP BY Entry_Station 
ORDER BY Peak_Trips DESC;

SELECT Entry_Station, 
COUNT(*) AS Peak_Trips 
FROM metro_trans 
WHERE Peak_Category = "Off Peak" 
GROUP BY Entry_Station 
ORDER BY Peak_Trips DESC;



