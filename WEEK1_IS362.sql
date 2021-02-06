use flights;

/*     Khirul Rof
	
IS 362 Week 1 Assignment: SQL and Tableau

*/
    
/* 	Question 1: How many airplanes have listed speeds? What is the minimum listed speed and the maximum listed speed?
    
   
	
    SQL statements and answers below.	*/

-- 	Airplanes with listed speeds: 23

SELECT COUNT(*) FROM planes where speed > 0;
 
 --  Minimum listed Speed: 90
	
SELECT MIN(speed) FROM planes;

-- 	Maximum listed Speed: 432

SELECT MAX(speed) FROM planes;
 
 
/* Question 2: What is the total distance flown by all of the planes in January 2013? What is the total distance flown by all of the planes in January 2013 where the tailnum is missing? */
    
    
	--SQL statements used to determine the data.

-- 	Total dist flown by all planes in January 2013:	7,188,805

SELECT SUM(distance) AS 'Total Distance'FROM flights WHERE ( year = 2013 AND month = 1);

-- Total dist flown by all planes in January 2013 where the  tailnum is missing: 81,763										


SELECT SUM(distance) AS 'Total NULL Distance' FROM flights WHERE ( year = 2013 AND month = 1 AND tailnum IS NULL);

/*	Question 3: What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer? Write this statement first using an INNER JOIN, then using a LEFT OUTER JOIN. How do your results compare?
    
	Answers:       
	Total distance flown for all planes on July 5, 2013 grouped 
    by aircraft manufacturer:
			
            manufacturer				Total Dist
			------------------------------	----------
			AIRBUS				195089
			AIRBUS INDUSTRIE		78786
			AMERICAN AIRCRAFT INC		2199
			BARKER JACK L			937
			BOEING				335028
			BOMBARDIER INC			31160
			CANADAIR			112
			CESSNA				2898
			DOUGLAS			        1089
			EMBRAER				77909
			GULFSTREAM AEROSPACE		1157
			MCDONNELL DOUGLAS	        7486
			MCDONNELL DOUGLAS AIRCRAFT CO	15690
			MCDONNELL DOUGLAS CORPORATION	4767
    
    Compare using an INNER JOIN, and a LEFT OUTER JOIN: 

      The inner join is probalemtic due to to having values thart don't match since they are null.
    
	
        
	SQL statements used to determine the data.	*/

-- inner join:
    
SELECT planes.manufacturer, SUM(distance) AS 'Total Dist' FROM flights INNER JOIN planes ON flights.tailnum = planes.tailnum WHERE (flights.year = 2013 AND flights.month = 7 AND flights.day = 5)GROUP BY manufacturer;

-- 	Outer join:

SELECT planes.manufacturer,SUM(distance) AS 'Total Dist'FROM flights LEFT OUTER JOIN planes ON flights.tailnum = planes.tailnum WHERE (flights.year = 2013 AND flights.month = 7 AND flights.day = 5)GROUP BY manufacturer;


/*	Question 4:
    Write and answer at least one question of your own
	choosing that joins information from at least three of
	the tables in the flights database. 
    
/*
 -- combine information from flights and planes table and weather table.  
 
 select * from flights inner join planes ON flights.year = planes.year;

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
