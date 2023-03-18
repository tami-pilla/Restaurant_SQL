USE Restaurant 

SELECT * FROM restaurants

SELECT  r.restaurant_name,
		r.income_persentage,
		c.city,
		rt.restaurant_type,
		o.order_id,
		o.date,
		o.hour,
		o.total_order,
		m.meal_name,
		m.hot_cold,
		m.price,
		st.serve_type,
		mt.meal_type,
		mmt.member_id
INTO dataset_restaurant
FROM restaurants r
JOIN cities c
ON r.city_id = c.city_id 
JOIN restaurant_types rt
ON r.restaurant_type_id = rt.restaurant_type_id
JOIN orders o
ON r.restaurant_id = o.restaurant_id
JOIN order_details od
ON o.order_id = od.order_id
JOIN  meals m
ON od.meal_id =  m.meal_id
JOIN serve_type st
ON m.serve_type_id = st.serve_type_id
JOIN meal_types mt
ON m.meal_type_id = mt.meal_type_id
JOIN monthly_member_totals mmt
ON mmt.member_id = o.member_id
GROUP BY r.restaurant_name,
        o.order_id,
		r.income_persentage,
		c.city,
		rt.restaurant_type,
		o.date,
		o.hour,
		o.total_order,
		m.meal_name,
		m.hot_cold,
		m.price,
		st.serve_type,
		mt.meal_type,
		mmt.member_id


SELECT * FROM dataset_restaurant




---------------------------------------- data cleaning ------------------------------------




SELECT restaurant_name, 
       income_persentage, 
	   city, 
	   restaurant_type, 
	   date, 
	   hour, 
	   total_order,
       meal_name,
	   hot_cold, 
	   price, 
	   serve_type,
	   meal_type
FROM dataset_restaurant
WHERE restaurant_name IS NULL OR
      income_persentage IS NULL OR 
	  city IS NULL OR 
      restaurant_type IS NULL OR 
	  date IS NULL OR  
	  hour IS NULL OR 
	  total_order IS NULL OR
	  meal_name IS NULL OR 
	  hot_cold IS NULL OR 
	  price IS NULL OR 
	  serve_type  IS NULL OR 
	  meal_type IS NULL 




-----------------------------------------------------------------------------------------



ALTER TABLE dataset_restaurant 
ALTER COLUMN income_persentage FLOAT

ALTER TABLE dataset_restaurant
ADD income_percentage as income_persentage*100


ALTER TABLE dataset_restaurant 
ALTER COLUMN date DATE


UPDATE dataset_restaurant
SET hour = REPLACE(hour, ':00.0000000', '')




-----------------------------------------------------------------------------------------





ALTER TABLE dataset_restaurant 
ALTER COLUMN price FLOAT

--Calculo la columna total_orderS a partir de la suma columna price por los order_id y creo nueva tabla
SELECT 
      SUM(price) as total_orders ,
	  order_id
INTO total_orders
FROM dataset_restaurant 
GROUP BY order_id 


SELECT * FROM dataset_restaurant
SELECT * FROM total_orders

SELECT  dr.restaurant_name,
		dr.city,
		dr.restaurant_type,
		dr.income_percentage,
		dr.order_id,
		dr.date,
		dr.hour,
		t_o.total_orders,
		dr.meal_name,
		dr.hot_cold,
		dr.price,
		dr.serve_type,
		dr.meal_type,
		dr.member_id
INTO dataset_restaurant_clean
FROM dataset_restaurant dr
INNER JOIN total_orders t_o
ON dr.order_id = t_o.order_id



SELECT * FROM dataset_restaurant_clean

 

 -----------------------------------------------------------------------------------------








