use stock;

DELIMITER //
CREATE TRIGGER tai_commande
AFTER INSERT ON commande
FOR EACH ROW
BEGIN
	DECLARE stock_ INT(9);
    DECLARE alertcount_ INT(9);

	SELECT p.stock INTO stock_
    FROM produit p
    WHERE p.id = NEW.produit_id
    LIMIT 1;
    
    SELECT COUNT(id) INTO alertcount_
	FROM alert a
	WHERE a.produit_id = NEW.produit_id;
	
    IF stock_ < 6 AND alertcount_ < 1 THEN
		INSERT INTO alert (name, produit_id)
		VALUES ("Petit stock", NEW.produit_id);
    END IF;
    
    UPDATE produit SET stock = stock - 1
    WHERE produit.id = NEW.produit_id;
END
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER tbi_commande
BEFORE INSERT ON commande
FOR EACH ROW
BEGIN
	DECLARE stock_ INT(9);
    
	SELECT p.stock INTO stock_
    FROM produit p
    WHERE p.id = NEW.produit_id
    LIMIT 1;

	IF stock_ < 1 THEN
		SIGNAL SQLSTATE '99999' 
        SET MESSAGE_TEXT = 'Updates not allowed';
    END IF;
END
//
DELIMITER ;
