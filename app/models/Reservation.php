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

    public function getAllReservationsEdit()
    {
        $this->db->query(
            'CALL `spViewReservationsEdit`();'
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

    public function editReservation($newId, $oldId)
    {
        $this->db->query(
            'CALL `spEditReservationsLane`(:newId, :oldId);'
        );
        $this->db->bind(':newId', $newId, PDO::PARAM_INT);
        $this->db->bind(':oldId', $oldId, PDO::PARAM_INT);
        $this->db->resultSet();
    }

    public function hasChildren($Id)
    {
        $this->db->query(
            'CALL `spHasChildren`(:id);'
        );

        $this->db->bind(':id', $Id, PDO::PARAM_INT);
        $result = $this->db->resultSet();
        return $result;
    }
}
