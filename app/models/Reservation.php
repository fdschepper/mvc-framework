<?php

/**
 *  reservation model hoort bij de reservations controller 
 *
 */

class Reservation
{
    // Properties
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getAllReservations()
    {
        $this->db->query(
            'CALL `spViewAllReservations`();'
        );

        $result = $this->db->resultSet();
        return $result;
    }

    public function ViewReservationsByDate($date)
    {

        $this->db->query(
            'CALL `spViewReservationsByDate`(:date);'
        );

        
        $this->db->bind(':date', $date['date'], PDO::PARAM_STR);
        $result = $this->db->resultSet();
        return $result;
    }
}
