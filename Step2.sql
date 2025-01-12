-- 1. What med did we spend the most money on in total?
SELECT 
    med_name,
    SUM(total_value) AS total_spent
FROM 
    `masterschool-444417.clinipet.med_audit`
WHERE 
    stock_movement = 'stock_in'
GROUP BY 
    med_name
ORDER BY 
    total_spent DESC
LIMIT 1;

-- 2. What med had the highest monthly total_value spent on patients? At what month? 

SELECT 
    month,
    med_name,
    SUM(total_value) AS total_value
FROM 
    `masterschool-444417.clinipet.med_audit`
WHERE 
    stock_movement = 'stock_out'
GROUP BY 
    month, med_name
ORDER BY 
    total_value DESC
LIMIT 1;

-- 3. What month was the highest in packs of meds spent in vet clinic?
SELECT 
    month,
    SUM(total_packs) AS total_packs
FROM 
   `masterschool-444417.clinipet.med_audit`
WHERE 
    stock_movement = 'stock_out'
GROUP BY 
    month
ORDER BY 
    total_packs DESC
LIMIT 1;
-- 4. What’s an average monthly spent in packs of the med that generated the most revenue? 

SELECT
      ROUND(AVG(total_packs),2) AS avg_packs
FROM 
      `masterschool-444417.clinipet.med_audit`
WHERE stock_movement = 'stock_out' and med_name = (SELECT med_name
                                                  FROM `masterschool-444417.clinipet.med_audit`
                                                  WHERE stock_movement = 'stock_out'
                                                  GROUP BY med_name
                                                  ORDER BY SUM(total_value)DESC
                                                  LIMIT 1 );

