-- 1. What med did we spend the most money on in total?

SELECT 
    med_name, 
    SUM(total_value) AS total_spent -- Calculates the total amount spent on the medication
FROM 
    `masterschool-444417.clinipet.med_audit` 
WHERE 
    stock_movement = 'stock_in' -- Filters for records where medications were purchased (stock in)
GROUP BY 
    med_name 
ORDER BY 
    total_spent DESC 
LIMIT 1; -- Returns the single medication with the highest total spending



-- 2. What med had the highest monthly total_value spent on patients? At what month? 

SELECT 
    month,
    med_name,
    SUM(total_value) AS total_value -- Calculates the total value (cost) of the medication used during the month
FROM 
    `masterschool-444417.clinipet.med_audit` 
WHERE 
    stock_movement = 'stock_out' -- Filters for records where medications were used (stock out)
GROUP BY 
    month, med_name
ORDER BY 
    total_value DESC 
LIMIT 1; -- Returns the single result with the highest total value



-- 3. What month was the highest in packs of meds spent in vet clinic?
SELECT 
    month, 
    SUM(total_packs) AS total_packs -- Calculates the total number of packs used during the month
FROM 
    `masterschool-444417.clinipet.med_audit` 
WHERE 
    stock_movement = 'stock_out' -- Filters for records where medications were used (stock out)
GROUP BY 
    month 
ORDER BY 
    total_packs DESC 
LIMIT 1; 


-- 4. What’s an average monthly spent in packs of the med that generated the most revenue? 

SELECT
      ROUND(AVG(total_packs), 2) AS avg_packs -- Calculates the average number of packs used and rounds it to 2 decimal places
FROM 
      `masterschool-444417.clinipet.med_audit` 
WHERE 
      stock_movement = 'stock_out' -- Filters for medications that were used (stock out)
      AND med_name = ( -- Filters for the specific medication with the highest total value spent
          SELECT 
              med_name 
          FROM 
              `masterschool-444417.clinipet.med_audit` 
          WHERE 
              stock_movement = 'stock_out' -- Filters for medications that were used (stock out)
          GROUP BY 
              med_name 
          ORDER BY 
              SUM(total_value) DESC -- Orders by the highest total value spent in descending order
          LIMIT 1 -- Retrieves the single medication with the highest total value spent
      );

