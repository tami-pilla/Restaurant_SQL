USE Restaurant 

SELECT * FROM members
SELECT * FROM monthly_member_totals


---------------------------------------- data cleaning ------------------------------------



DELETE FROM monthly_member_totals
WHERE monthly_budget IS NULL

DELETE FROM monthly_member_totals
WHERE balance IS NULL

DELETE FROM monthly_member_totals
WHERE commission IS NULL



-----------------------------------------------------------------------------------------



SELECT DISTINCT total_expense FROM monthly_member_totals

UPDATE monthly_member_totals
SET total_expense = REPLACE (total_expense, '.0','')

ALTER TABLE monthly_member_totals 
ALTER COLUMN total_expense INT


SELECT * FROM monthly_member_totals 


-----------------------------------------------------------------------------------------



SELECT  mmt.member_id,  
        CONCAT(mmt.first_name, ' ' , mmt.surname) as name,
		mmt.sex,
		mmt.year,
		mmt.month,
		mmt.order_count,
		mmt.meals_count,
		mmt.total_expense
INTO dataset_members_clean
FROM monthly_member_totals mmt



SELECT * FROM dataset_members_clean



-----------------------------------------------------------------------------------------