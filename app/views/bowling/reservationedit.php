<?php require APPROOT . '/views/includes/head.php'; ?>
<u>
    <?= $data['title'] ?>
</u>

<?php if ($data['error']) {
    echo "database connection unsuccessful, please try again";
} ?>


<table>
    <thead>
        <th>Voornaam</th>
        <th>Tussenvoegsel</th>
        <th>Achternaam</th>
        <th>Dautm</th>
        <th>Volwassenen</th>
        <th>Kinderen</th>
        <th>Baan</th>
        <th>Wijzigen</th>
    </thead>
    <tbody>
        <?= $data['rows'] ?>
    </tbody>
</table>
<a href="<?= URLROOT; ?>/homepages/index">home</a>
<?php require APPROOT . '/views/includes/footer.php'; ?>