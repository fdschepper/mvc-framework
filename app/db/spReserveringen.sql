-- spViewAllReservations START

DROP PROCEDURE IF EXISTS spViewAllReservations;

DELIMITER //

CREATE PROCEDURE spViewAllReservations
( -- Dit zijn alle argumenten die je meegeeft met het aanroepen van de procedure
  
) 
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN 
        ROLLBACK;
        SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
    END;
    
    START TRANSACTION;
        SELECT persoon.Voornaam, persoon.Tussenvoegsel, persoon.Achternaam, reservering.Datum, reservering.AantalUren, reservering.AantalVolwassenen, reservering.AantalKinderen, reserveringsstatus.Naam
        FROM persoon 
        INNER JOIN reservering
        ON reservering.PersoonId = persoon.Id
        INNER JOIN reserveringsstatus
        ON reservering.ReserveringsStatusId = reserveringsstatus.Id
        WHERE reserveringsstatus.Naam = 'Bevestigd'
        ORDER BY reservering.Datum DESC;
        
    COMMIT;
END //
DELIMITER ;


DROP PROCEDURE IF EXISTS spViewReservationsByDate;

DELIMITER //

-- hetzelfde als spViewAllReservations maar dan met id
CREATE PROCEDURE spViewReservationsByDate
( -- Dit zijn alle argumenten die je meegeeft met het aanroepen van de procedure
  p_date varchar(12)
) 
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN 
        ROLLBACK;
        SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
    END;
    
    START TRANSACTION;
        SELECT persoon.Voornaam, persoon.Tussenvoegsel, persoon.Achternaam, reservering.Datum, reservering.AantalUren, reservering.AantalVolwassenen, reservering.AantalKinderen, reserveringsstatus.Naam
        FROM persoon 
        INNER JOIN reservering
        ON reservering.PersoonId = persoon.Id
        INNER JOIN reserveringsstatus
        ON reservering.ReserveringsStatusId = reserveringsstatus.Id
        WHERE reservering.Datum < p_date
        AND reserveringsstatus.Naam = 'Bevestigd'
        ORDER BY reservering.Datum DESC;
    COMMIT;
END //
DELIMITER ;


DROP PROCEDURE IF EXISTS spViewReservationsEdit;

DELIMITER //

-- spViewAllReservations END
CREATE PROCEDURE spViewReservationsEdit
( -- Dit zijn alle argumenten die je meegeeft met het aanroepen van de procedure
  
) 
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN 
        ROLLBACK;
        SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
    END;
    
    START TRANSACTION;
        SELECT persoon.Voornaam, persoon.Tussenvoegsel, persoon.Achternaam, reservering.Datum, reservering.AantalVolwassenen, reservering.AantalKinderen, baan.Nummer, reservering.Id
        FROM persoon 
        INNER JOIN reservering
        ON reservering.PersoonId = persoon.Id
        INNER JOIN baan
        ON reservering.BaanId = baan.Id
        ORDER BY reservering.Datum DESC;
    COMMIT;
END //
DELIMITER ;