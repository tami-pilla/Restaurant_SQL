USE Restaurant

SELECT * FROM dataset_restaurant_clean


---------- exploratory data analisis --------------------



-- Ciudad


SELECT city, COUNT(order_id) as number_of_orders
FROM dataset_restaurant_clean
GROUP BY city 
ORDER BY number_of_orders DESC, city



SELECT city, SUM(total_orders) as total_collected
FROM dataset_restaurant_clean
GROUP BY city 
ORDER BY total_collected DESC, city




------------------------------------------------------------

--Restaurants


-- Top 5 de restaurants con mayor ganancia
SELECT TOP 5 restaurant_name, restaurant_type, 
             SUM(total_orders) as total_money_collected
FROM dataset_restaurant_clean
GROUP BY  restaurant_name, restaurant_type
ORDER BY total_money_collected DESC


-- Top 5 de restaurants con mayor ganancia en tipo de comidas Vegana
SELECT TOP 5 restaurant_name, restaurant_type,
             SUM(total_orders) as total_money_collected, meal_type
FROM dataset_restaurant_clean
WHERE meal_type = 'Vegan'
GROUP BY  restaurant_name, restaurant_type, meal_type
ORDER BY total_money_collected DESC



-- Top 5 de restaurants con mayor ganancia en tipo de restaurant Indio
SELECT TOP 5 restaurant_name, restaurant_type, 
           SUM(total_orders) as total_money_collected
FROM dataset_restaurant_clean
WHERE restaurant_type = 'Indian'
GROUP BY  restaurant_name, restaurant_type
ORDER BY total_money_collected DESC





-----------------------------------------------------------------------------------------



--Miembros

SELECT TOP 5  member_id, 
            SUM(total_orders) as total_orders
FROM dataset_restaurant_clean
GROUP BY member_id
ORDER BY total_orders DESC



-----------------------------------------------------------------------------------------

--Orders


SELECT * FROM dataset_restaurant_clean


SELECT  count(hot_cold) as hot
FROM dataset_restaurant_clean
WHERE hot_cold = 'Hot'

SELECT  count(hot_cold) as cold
FROM dataset_restaurant_clean
WHERE hot_cold = 'Cold'







-----------------------------------------------------------------------------------------


--Fechas
--desde 1/1/2020 - 1/7/2020

SELECT * FROM dataset_restaurant_clean

SELECT top 5 date,
             hour,
			 MAX(total_orders) as max_total_orders
FROM dataset_restaurant_clean
GROUP BY date, hour, total_orders
ORDER BY max_total_orders DESC


SELECT FORMAT(date,'MM') as mes , 
       SUM(total_orders) as max_total_orders
INTO obtener_mes
FROM dataset_restaurant_clean
GROUP BY date
ORDER BY date, SUM(total_orders) DESC

SELECT * FROM obtener_mes


-- Total gananciaS por mes

SELECT mes as mes, 
       SUM(max_total_orders) as max_total_orders
INTO ganancias_mes
FROM obtener_mes
GROUP BY mes
ORDER BY max_total_orders DESC 


SELECT * FROM ganancias_mes



