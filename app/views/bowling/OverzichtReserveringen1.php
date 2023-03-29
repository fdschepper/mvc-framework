<?php require APPROOT . '/views/includes/head.php'; ?>
<u>
    <?= $data['title'] ?>
</u>

<?php if ($data['error']) {
    echo "database connection unsuccessful, please try again";
} ?>

<form action="<?= URLROOT; ?>/reservations/ReservationByDate" method="post">
    <input type="date" name="date" required>
    <button type="submit">Tonen</button>
</form>

<table>
    <thead>
        <th>Voornaam</th>
        <th>Tussenvoegsel</th>
        <th>Achternaam</th>
        <th>Reserveringsdatum</th>
        <th>Uren</th>
        <th>Volwassenen</th>
        <th>Kinderen</th>
        <th>Status</th>
    </thead>
    <tbody>
        <?= $data['rows'] ?>
    </tbody>
</table>
<a href="<?= URLROOT; ?>/homepages/index">home</a>
<?php require APPROOT . '/views/includes/footer.php'; ?>
