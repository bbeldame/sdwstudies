USE btpenterprise;

DROP TRIGGER IF EXISTS tbi_vhe;
DELIMITER //
CREATE TRIGGER tbi_vhe
BEFORE INSERT ON visite_has_employee
FOR EACH ROW
BEGIN
	DECLARE idconduct_ INT;
    DECLARE countpassenger_ INT;
    DECLARE capacity_ INT;
    
    SELECT v.employee_id INTO idconduct_
    FROM visite v
    WHERE v.id = NEW.visite_id;
    
    IF idconduct_ = NEW.employee_id THEN
		SIGNAL SQLSTATE '99999'
        SET MESSAGE_TEXT = 'The passenger you want to insert in the conductor';
    END IF;
    
    SELECT COUNT(vhe.employee_id) INTO countpassenger_
    FROM visite_has_employee vhe
    WHERE vhe.visite_id = NEW.visite_id;
    
    SELECT voiture.capacity INTO capacity_
    FROM voiture
    JOIN visite v on voiture.id = v.voiture_id
    WHERE v.id = NEW.visite_id;
    
    IF (countpassenger_ + 2 > capacity_) THEN
		SIGNAL SQLSTATE '99999'
        SET MESSAGE_TEXT = 'No more room for this new guy';
    END IF;
END;
//
DELIMITER ;

DROP FUNCTION IF EXISTS give_capacity;
DELIMITER //
CREATE FUNCTION give_capacity (voiture_id INT) RETURNS INT NOT DETERMINISTIC
BEGIN
	DECLARE capacity_ INT;
    
    SELECT v.capacity INTO capacity_
    FROM voiture v
    WHERE v.id = voiture_id;
    
    RETURN capacity_;
END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS bilancar;
DELIMITER //
CREATE PROCEDURE bilancar(IN voitureId INT)
BEGIN
	SELECT COUNT(v.id) AS 'Nombre de visites effectuées', SUM(v.distance) AS 'Nombre de km parcourus'
    FROM visite v
    WHERE v.voiture_id = voitureId;
END;
//
DELIMITER ;

CALL bilancar(1);
