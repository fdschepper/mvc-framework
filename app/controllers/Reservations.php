<?php
class Reservations extends Controller
{
    // Properties
    private $reservationModel;

    // De constructor voor het aanmaken van een modelobject
    public function __construct()
    {
        $this->reservationModel = $this->model('Reservation');
    }

    public function index()
    {
        // De gegevens uit de database worden door de model aangeleverd
        try {
            $records = $this->reservationModel->getAllReservations();
            $rows = '';
            foreach ($records as $item) {
                $rows .= "<tr>
                        <td>$item->Voornaam</td>
                        <td>$item->Tussenvoegsel</td>
                        <td>$item->Achternaam</td>
                        <td>$item->Datum</td>
                        <td>$item->AantalUren</td>
                        <td>$item->AantalVolwassenen</td>
                        <td>$item->AantalKinderen</td>
                        <td>$item->Naam</td>
                        </tr>";

                $data = [
                    'title' => 'Overzicht reserveringen',
                    'rows' => $rows,
                    'error' => false
                ];
            }
        } catch (Exception $e) {

            $data = [
                'title' => 'Overzicht reserveringen',
                'rows' => 'no available scores, connection failed',
                'error' => true
            ];
        }

        // De view wordt aangeroepen
        $this->view('bowling/OverzichtReserveringen1', $data);
    }

    public function ReservationByDate()
    {
        $data = [
            'title' => 'Overzicht reserveringen',
            'rows' => "Er is geen reserveringsinformatie beschikbaar voor deze geselecteerde datum",
            'error' => false
        ];
        // De gegevens uit de database worden door de model aangeleverd
        try {
            $records = $this->reservationModel->ViewReservationsByDate($_POST);
            $rows = '';
            foreach ($records as $item) {
                $rows .= "<tr>
                        <td>$item->Voornaam</td>
                        <td>$item->Tussenvoegsel</td>
                        <td>$item->Achternaam</td>
                        <td>$item->Datum</td>
                        <td>$item->AantalUren</td>
                        <td>$item->AantalVolwassenen</td>
                        <td>$item->AantalKinderen</td>
                        <td>$item->Naam</td>
                        </tr>";

                $data = [
                    'title' => 'Overzicht reserveringen',
                    'rows' => $rows,
                    'error' => false
                ];
            }
        } catch (Exception $e) {

            $data = [
                'title' => 'Overzicht reserveringen',
                'rows' => 'no available scores, connection failed',
                'error' => true
            ];
        }

        // De view wordt aangeroepen
        $this->view('bowling/OverzichtReserveringen1', $data);
    }
}