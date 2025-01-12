SELECT
      patient_id,
      owner_id,
      owner_name,
      pet_type,
      IFNULL(breed, 'Uknown') AS breed,
      INITCAP(patient_name) AS patient_name,
      gender,
      patient_age,
      date_registration,
      REGEXP_REPLACE(
        CASE 
            WHEN LEFT(owner_phone, 1) = '+' THEN '00' || SUBSTR(owner_phone, 2)
            ELSE owner_phone
        END,
        r'[^0-9]',
        ''
    ) AS owner_phone

    FROM `masterschool-444417.clinipet.healthtail_reg_cards` ;



WITH stock_in AS (
    SELECT 
        DATE_TRUNC(month_invoice, MONTH) AS month,
        med_name AS med_name,
        CAST(ROUND(SUM(packs), 2) AS NUMERIC) AS total_packs,
        CAST(ROUND(SUM(total_price), 2) AS NUMERIC) AS total_value,
        'stock_in' AS stock_movement
    FROM 
        `masterschool-444417.clinipet.invoices`
    GROUP BY 
        month, med_name
),
stock_out AS (
    SELECT
        DATE_TRUNC(visit_datetime, MONTH) AS month,
        med_prescribed AS med_name,
        CAST(ROUND(SUM(med_dosage), 2) AS NUMERIC) AS total_packs,
        CAST(ROUND(SUM(med_cost), 2) AS NUMERIC) AS total_value,
        'stock_out' AS stock_movement
    FROM 
        `masterschool-444417.clinipet.visits`
    GROUP BY 
        month, med_name
)
SELECT * FROM stock_out
UNION DISTINCT
SELECT * FROM stock_in;


