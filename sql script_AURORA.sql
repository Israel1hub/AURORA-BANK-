SELECT * FROM users_data
SELECT * FROM transactions_data
SELECT * FROM cards_data
SELECT * FROM mcc_codes,

--------DUPLICATE THE TABLE 

SELECT * INTO Users_duplicate FROM users_data
SELECT * INTO Transcations_duplicates FROM  transactions_data
SELECT * INTO Cards_duplicates FROM cards_data
SELECT * INTO Mcc_duplicates FROM mcc_codes




-----------------------------------------EXPLORING THE DATA------------------------------------------ 


--Change the data type of latitude to float

SELECT Latitude FROM Users_data_duplicate
WHERE TRY_CAST(Latitude AS FLOAT) IS NULL

ALTER TABLE Users_data_duplicate  ALTER COLUMN Latitude NVARCHAR(255) NULL         ----Change the data type to Allow null 

UPDATE Users_data_duplicate                                                     ------- UPDATING the alphabet to  null 
 SET Latitude = NULL 
 WHERE TRY_CAST(Latitude AS FLOAT) IS NULL

ALTER  TABLE Users_data_duplicate                                            ------ Alter the data type again 
ALTER  COLUMN Latitude FLOAT 
      

      UPDATE Users_data_duplicate                                                   ---Replace the null with Avg of latitude of the not null value 
      SET latitude=  (SELECT AVG(latitude) FROM Users_data_duplicate WHERE TRY_CAST(Latitude AS FLOAT) IS NOT NULL)
      WHERE latitude IS NULL

 ALTER TABLE Users_data_duplicate                                     ---- ENABLE NOT NULL ON latitude 
 ALTER COLUMN Latitude FLOAT NOT NULL




--------ALL QUERIES AND JOIN WRITTEN CORRECTLY
CREATE VIEW  VW_BANK AS 
WITH Customersprofile AS (
     SELECT U.id,
           U.gender,
           U.credit_score,
           U.total_debt,
           U.yearly_income,
           U.num_credit_cards,
           U.latitude,
           U.longitude,
           C.card_type,
           T.id AS Transaction_id,
           T.amount,
           T.use_chip,
           T.Merchant_state,
           T.errors,
           TRY_CAST(T.date AS DATE) AS DATE,
          T.merchant_state AS states_shopped_in,
          T.mcc AS unique_mcc_categories,
  CASE                                                 ----Grouping age 
        WHEN current_age < 35 THEN 'Young'
        WHEN current_age BETWEEN 35 AND 55 THEN 'Middle-age'
        ELSE 'Senior'
    END AS Age_group,


      CASE                                                ----Grouping Retirement  

        WHEN current_age > retirement_age THEN 'Retired'
        ELSE 'Not retired'
    END AS Retirement,

      CASE
        WHEN TRY_CAST(U.latitude AS FLOAT) BETWEEN 30 AND 50
         AND TRY_CAST(U.longitude AS FLOAT) BETWEEN -125 AND -100 THEN 'West'
        WHEN TRY_CAST(U.latitude AS FLOAT) BETWEEN 30 AND 50
         AND TRY_CAST(U.longitude AS FLOAT) BETWEEN -100 AND -85 THEN 'Midwest'
        WHEN TRY_CAST(U.latitude AS FLOAT) BETWEEN 30 AND 50
         AND TRY_CAST(U.longitude AS FLOAT) BETWEEN -85 AND -65 THEN 'Northeast'
        WHEN TRY_CAST(U.latitude AS FLOAT) BETWEEN 25 AND 45
         AND TRY_CAST(U.longitude AS FLOAT) BETWEEN -100 AND -75 THEN 'South'
        ELSE 'Not specified'
    END AS Region,

       CASE                                                                           ----Grouping Retirement
        WHEN U.yearly_income < 30000 THEN 'Under $30k'
        WHEN U.yearly_income BETWEEN 30000 AND 59999 THEN '$30K-$60K'
        WHEN U.yearly_income BETWEEN 60000 AND 99999 THEN '$60K-$100K'
        WHEN U.yearly_income BETWEEN 100000 AND 149999 THEN '$100K - $150K'
        ELSE 'Over $150k+'
    END AS Income_grouped,


    CASE                                                                           ----Grouping Credit_score
        WHEN U.credit_score < 570 THEN 'Poor score'
        WHEN U.credit_score BETWEEN 580 AND 669 THEN 'Fair score'
        WHEN U.credit_score BETWEEN 670 AND 739 THEN 'Good score'
        WHEN U.credit_score BETWEEN 740 AND 799 THEN 'Very Good score'
        ELSE 'Exceptional ++'
    END AS Credit_score_category,

     CASE                                                                                               ----Grouping Credit_limit risk 
        WHEN (U.yearly_income / NULLIF(C.credit_limit, 0)) < 0.3 THEN 'Low risk'
        WHEN (U.yearly_income / NULLIF(C.credit_limit, 0)) BETWEEN 0.3 AND 0.6 THEN 'Medium risk'
        ELSE 'High risk'
    END AS Credit_limit_risk,

      CASE                                                                                    ----Grouping Debt segmentation
        WHEN total_debt = 0 THEN 'No Debt'
        WHEN total_debt < 10000 THEN 'Low Debt (<$10K)'
        WHEN total_debt BETWEEN 10000 AND 49999 THEN 'Medium Debt ($10K-$50K)'
        WHEN total_debt BETWEEN 50000 AND 99999 THEN 'High Debt ($50K-$100K)'
        ELSE 'Very High Debt ($100K+)'
    END AS Debt_segment,

      CASE 
        WHEN T.amount >U.yearly_income * 0.3 AND (U.total_debt / NULLIF(U.yearly_income, 0)) > 0.6 
            THEN 'High risk spender'
        WHEN T.amount > U.yearly_income * 0.3 
            THEN 'Potential overspender'
        ELSE 'Normal spender'
    END AS Spending_risk_flag,

CASE 
     WHEN T.errors IS NULL THEN 'Successful'
     ELSE 'Failed'
  END AS Status,
  
  CASE 
    WHEN T.amount<0 THEN 'Refunded'
    ELSE 'Purchase'

   END Order_status,

   CASE

   WHEN T.amount < 0 THEN  T.amount
   ELSE 0
   END AS Refunded_amount

          FROM Users_data_duplicate U  JOIN Cards_duplicates C ON U.id =C.Client_id
          JOIN  Transcations_duplicates T ON U.id=T.Client_id 
          JOIN Mcc_duplicates MC ON T.mcc=MC.mcc_id
          
          ) SELECT * FROM Customersprofile,

         

    

    SELECT*  FROM VW_BANK