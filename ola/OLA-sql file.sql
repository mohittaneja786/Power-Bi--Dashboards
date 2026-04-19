#Create database Ola;

use ola;

# Reterive all successfully bookings
Create view Successfull_Bookings as
select * from bookings2
where Booking_Status = 'Success';

# Reterive all successfully bookings
select * from Successfull_Bookings;

#2 Find the average ride distance for each vehicle type
Create view ride_avg_distance_vehicle_type as
select Vehicle_Type, AVG(Ride_Distance)
as avg_distance From bookings2
Group By Vehicle_Type;

select * from ride_avg_distance_vehicle_type;

#3 COunt total number of canceled rides

create view cancelled_rides_by_customer as
select count(*) from bookings2
where Booking_Status = 'Canceled by Customer';


select * from cancelled_rides_by_customer;



# list all 5 customer who booked highest number of rides

-- create view Top_5_customer_rides as
-- select Customer_ID, count(Booking_ID) as total_rides
-- from bookings2
-- Group by Customer_ID
-- order by total_rides desc limit 5;

#select * from Top_5_customer_rides;

select Customer_ID, count(Customer_ID) as total_rides
from bookings2
Group by Customer_ID
order by total_rides desc limit 15;

#5 Get Cancelled rides due to personal and car-related issues

create view Cancellation_rides as
select count(*) as cancelled_rides
from bookings2
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from Cancellation_rides;



#6 Finding Max & min rating for prime sedan

Create view max_min_ratings as

select MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
from bookings2 where Vehicle_Type = 'Prime Sedan';


select * from max_min_ratings;


#7 Retrieve all rides where payment was made by UPI

Create view UPI_Payment as
select * from bookings2 where Payment_Method = 'UPI';

select * from UPI_Payment;

#8 Find average customer rating per vehicle type

Create view Customer_rating_Vehicle_type as
select Vehicle_Type, avg(Customer_Rating) as avg_vehicle_type
from bookings2
Group by Vehicle_Type;

select * from Customer_rating_Vehicle_type;

#9 Calculate the total booking value of rides completed successfully

create view total_booking_value as
select Booking_Status, sum(Booking_Value) as Total_Booking_Value
from bookings2 where Booking_Status = 'Success';

select * from total_booking_value;


# List of all incomplete rides along with the reason

Create view incomplete_rides as
select Booking_ID, Incomplete_Rides_Reason 
from bookings2
where Incomplete_Rides = 'Yes';

select * from incomplete_rides;



#===================================

select MAX(Driver_Ratings), MIN(Driver_Ratings), Vehicle_Type as vehicle
from bookings2
where Vehicle_Type = 'Prime Sedan';

select * from bookings2
where Payment_Method = 'UPI';

select Vehicle_Type, AVG(Customer_Rating) as Average_Ratings
from bookings2
Group BY Vehicle_Type;

#total number of bookings succesfully

select SUM(Booking_Value) from bookings2 
Where Booking_Status = 'Success';

#list incomplete rides with a reason

select Incomplete_Rides_Reason, Booking_ID
from bookings2
where Incomplete_Rides = 'yes';









