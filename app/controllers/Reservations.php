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
                'rows' => 'no available reservations, connection failed',
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
                'rows' => 'no available reservations, connection failed',
                'error' => true
            ];
        }

        // De view wordt aangeroepen
        $this->view('bowling/OverzichtReserveringen1', $data);
    }

    public function editOverview()
    {
        // De gegevens uit de database worden door de model aangeleverd
        try {
            $records = $this->reservationModel->getAllReservationsEdit();
            $rows = '';
            foreach ($records as $item) {
                $rows .= "<tr>
                        <td>$item->Voornaam</td>
                        <td>$item->Tussenvoegsel</td>
                        <td>$item->Achternaam</td>
                        <td>$item->Datum</td>
                        <td>$item->AantalVolwassenen</td>
                        <td>$item->AantalKinderen</td>
                        <td>$item->Nummer</td>
                        <td> <a href='" . URLROOT . "/reservations/edit/$item->Id'> ✎ </td>
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
                'rows' => 'no available reservations, connection failed',
                'error' => true
            ];
        }
        // De view wordt aangeroepen
        $this->view('bowling/OverzichtReserveringen2', $data);
    }

    public function edit($id)
    {
        // De gegevens uit de database worden door de model aangeleverd

        $records = $this->reservationModel->hasChildren($id);
        $children = $records[0]->AantalKinderen;
        // Het array $data geeft de rows mee naar de view
        $data = [
            'title' => 'Details baannummer',
            'id' => $id,
            'children' => $children
        ];

        // De view wordt aangeroepen
        $this->view('bowling/reservationedit', $data);
    }

    public function editBaan()
    {
        $newId = $_POST['newLane'];
        $oldId = $_POST['id'];
        $children = $_POST['children'];


        //check of de gebruiker kinderen heeft en of de gekozen baaan binnen 1-6 zit
        //zo ja word deze baan verboden om te kiezen omdat deze ongeschikt is voor kinderen
        if ($newId > 0 && $newId <= 6 && $children > 0) {
            header("Refresh:3; url=" . URLROOT . "/reservations/editoverview");
            echo "Deze baan is ongeschikt voor kinderen omdat deze geen hekjes heeft";
        } else {
            $this->reservationModel->editReservation($oldId, $newId);

            header("Refresh:1; url=" . URLROOT . "/reservations/editoverview");
            echo "Het baannummer is gewijzigd";
        }
    }
}
