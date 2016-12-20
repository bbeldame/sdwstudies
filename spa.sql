show databases;

use spa;

CREATE OR REPLACE VIEW v_dispo_dogs
AS SELECT a.name
FROM animal a
JOIN specie s ON s.id = a.specie_id
WHERE s.name = "Dogs";

SELECT * FROM v_dispo_dogs;

CREATE OR REPLACE VIEW v_count_specie
AS SELECT s.name,
COUNT(*) as 'Nb animal'
FROM specie s
JOIN animal a ON s.id = a.specie_id
GROUP BY s.name;

SELECT * FROM v_count_specie;

CREATE OR REPLACE VIEW v_age_dogs
AS SELECT a.name, a.dispo
FROM animal a
JOIN specie s ON s.id = a.specie_id
WHERE s.name = "Dogs"
AND a.age IS NOT NULL;

SELECT * FROM v_age_dogs;

CREATE OR REPLACE VIEW v_age_dispo_dogs
AS SELECT * FROM v_age_dogs
WHERE dispo = 1;

SELECT * FROM v_age_dispo_dogs;
