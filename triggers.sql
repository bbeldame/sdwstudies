use vols;

DROP TRIGGER IF EXISTS tbi_vol;
DELIMITER //
CREATE TRIGGER tbi_vol
BEFORE INSERT ON vol
FOR EACH ROW
BEGIN
	DECLARE avioncount_ INT;
	
	IF NEW.date_arrive < NEW.date_depart THEN
		SIGNAL SQLSTATE '99999'
        SET MESSAGE_TEXT = 'Date of departure older than arrival';
	END IF;

	SELECT COUNT(a.id) INTO avioncount_
    FROM avion a
    JOIN vol v ON v.avion_id = a.id
    WHERE NEW.date_depart < v.date_arrive
    AND NEW.date_arrive > v.date_depart;
    
    IF avioncount_ > 0 THEN
		SIGNAL SQLSTATE '99995'
        SET MESSAGE_TEXT = 'The avion is flying';
	END IF;
END;
//
DELIMITER ;

use students;

DROP TRIGGER IF EXISTS tai_rattrapage;
DELIMITER //
CREATE TRIGGER tai_rattrapage
AFTER INSERT ON note
FOR EACH ROW
BEGIN
	DECLARE avgnote_ FLOAT;
    DECLARE studinrat_ INT;
    
	SELECT AVG(n.note) INTO avgnote_
    FROM note n
	WHERE n.student_id = NEW.student_id
	AND n.matiere_id = NEW.matiere_id;
    
    SELECT COUNT(r.id) INTO studinrat_
    FROM rattrapage r
    WHERE r.student_id = NEW.student_id
    AND r.matiere_id = NEW.matiere_id;
    
    IF avgnote_ < 10 AND studinrat_ < 1 THEN
		INSERT INTO rattrapage (student_id, matiere_id)
        VALUES (NEW.student_id, NEW.matiere_id);
    END IF;
END;
//
DELIMITER ;

use produits;

DROP TRIGGER IF EXISTS tbu_produit;
DELIMITER //
CREATE TRIGGER tbu_produit
BEFORE UPDATE ON produit
FOR EACH ROW
BEGIN
	IF (NEW.name != OLD.name OR NEW.url != OLD.url)
		AND (NEW.statut = 'online') THEN
        SIGNAL SQLSTATE '13337'
        SET MESSAGE_TEXT = 'Vous ne pouvez pas changer le produit quand le statut est online';
	END IF;
    
    IF (NEW.prix != OLD.prix) THEN
		INSERT INTO majprice (old_price, new_price, date_of_update, produit_id)
        VALUES (OLD.prix, NEW.prix, NOW(), NEW.id);
    END IF;
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tbd_produit;
DELIMITER //
CREATE TRIGGER tbd_produit
BEFORE DELETE ON produit
FOR EACH ROW
BEGIN
	INSERT INTO poubelle (name, url, prix)
    VALUES (OLD.name, OLD.url, OLD.prix);
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS tbi_produit;
DELIMITER //
CREATE TRIGGER tbi_produit
BEFORE INSERT ON produit
FOR EACH ROW
BEGIN
	DECLARE sluger VARCHAR(50);

	SET sluger = LOWER(TRIM(NEW.name));
	SET sluger = REPLACE(sluger, ':', '');
	SET sluger = REPLACE(sluger, ')', '');
	SET sluger = REPLACE(sluger, '(', '');
	SET sluger = REPLACE(sluger, ',', '');
	SET sluger = REPLACE(sluger, '\\', '');
	SET sluger = REPLACE(sluger, '?', '');
	SET sluger = REPLACE(sluger, '\'', '');
	SET sluger = REPLACE(sluger, '&', '');
	SET sluger = REPLACE(sluger, '!', '');
	SET sluger = REPLACE(sluger, '.', '');
	SET sluger = REPLACE(sluger, '&euro;', '');
	SET sluger = REPLACE(sluger, 'euro;', '');
	SET sluger = REPLACE(sluger, ' ', '-');
	SET sluger = REPLACE(sluger, '--', '-');
	SET NEW.url = sluger;
END;
//
DELIMITER ;

USE ecommercesite;

DROP PROCEDURE IF EXISTS display_10_most_sells;
DELIMITER //
CREATE PROCEDURE display_10_most_sells()
BEGIN
	SELECT p.name, count(p.id) cc
    FROM command c
    JOIN product p on c.product_id = p.id
    GROUP BY c.product_id order by cc desc limit 10;
END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS display_10_best_customers;
DELIMITER //
CREATE PROCEDURE display_10_best_customers()
BEGIN
	SELECT cu.name, count(cu.id) cc
    FROM command c
    JOIN customer cu on c.customer_id = cu.id
    GROUP BY c.customer_id order by cc desc limit 10;
END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS display_command_of_customer;
DELIMITER //
CREATE PROCEDURE display_command_of_customer(IN customerId INT)
BEGIN
	SELECT name, price
    FROM products p
    JOIN command c ON c.products_id = p.id
    WHERE c.customer_id = customerId;
END;
//
DELIMITER ;
