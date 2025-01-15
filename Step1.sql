SELECT
      patient_id, 
      owner_id, 
      owner_name, 
      pet_type,
      IFNULL(breed, 'Uknown') AS breed, -- Replaces NULL values in 'breed' with 'Unknown'
      INITCAP(patient_name) AS patient_name, -- Capitalizes the first letter of each word in 'patient_name'
      gender, 
      patient_age,
      date_registration,
      REGEXP_REPLACE(
        CASE 
            WHEN LEFT(owner_phone, 1) = '+' THEN '00' || SUBSTR(owner_phone, 2) -- Replaces '+' with '00' for international formatting
            ELSE owner_phone -- Keeps the phone number as is if it doesn't start with '+'
        END,
        r'[^0-9]', -- Matches all non-numeric characters
        '' -- Removes the matched non-numeric characters
    ) AS owner_phone -- Cleaned phone number with only numeric values
FROM masterschool-444417.clinipet.healthtail_reg_cards; 



WITH stock_in AS (
    SELECT 
        DATE_TRUNC(month_invoice, MONTH) AS month, -- Truncates the invoice date to the start of the month
        med_name AS med_name, 
        CAST(ROUND(SUM(packs), 2) AS NUMERIC) AS total_packs, -- Sums the number of packs purchased, rounds to 2 decimals, and casts as NUMERIC
        CAST(ROUND(SUM(total_price), 2) AS NUMERIC) AS total_value, -- Sums the total price of purchases, rounds to 2 decimals, and casts as NUMERIC
        'stock_in' AS stock_movement -- Indicates that this data refers to medications added to stock
    FROM 
        `masterschool-444417.clinipet.invoices` 
    GROUP BY 
        month, med_name 
),
stock_out AS (
    SELECT
        DATE_TRUNC(visit_datetime, MONTH) AS month, -- Truncates the visit date to the start of the month
        med_prescribed AS med_name,
        CAST(ROUND(SUM(med_dosage), 2) AS NUMERIC) AS total_packs, -- Sums the dosage prescribed, rounds to 2 decimals, and casts as NUMERIC
        CAST(ROUND(SUM(med_cost), 2) AS NUMERIC) AS total_value, -- Sums the cost of prescribed medications, rounds to 2 decimals, and casts as NUMERIC
        'stock_out' AS stock_movement -- Indicates that this data refers to medications used or prescribed
    FROM 
        `masterschool-444417.clinipet.visits` 
    GROUP BY 
        month, med_name -- Groups data by month and medication name
)
SELECT * FROM stock_out; 


