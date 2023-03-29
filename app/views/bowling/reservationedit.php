<?php require APPROOT . '/views/includes/head.php'; ?>
<h1>
    <u>
        <?= $data['title'] ?>
    </u>
</h1>

<form action="<?= URLROOT; ?>/reservations/editBaan" method="post">
    <label for="select">Baannummer:</label>

    <input name="id" type="" value="<?= $data['id'] ?>" hidden>
    <input name="children" type="" value="<?= $data['children'] ?>" hidden>

    <select name="newLane">
        <option value="1">Baan 1</option>
        <option value="2">Baan 2</option>
        <option value="3">Baan 3</option>
        <option value="4">Baan 4</option>
        <option value="5">Baan 5</option>
        <option value="6">Baan 6</option>
        <option value="7">Baan 7 (hekjes)</option>
        <option value="8">Baan 8 (hekjes)</option>
    </select>
    <br>
    <button type="submit">Wijzigen</button>
</form>

<?php require APPROOT . '/views/includes/footer.php'; ?>