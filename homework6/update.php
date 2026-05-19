<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");

$conn = new mysqli("localhost", "root", "", "crud_flutter_db");

if ($conn->connect_error) {
    die(json_encode(array("status" => "error", "message" => "Connection failed")));
}

$id     = isset($_POST['id']) ? $_POST['id'] : '';
$nisn   = isset($_POST['nisn']) ? $_POST['nisn'] : '';
$nama   = isset($_POST['nama']) ? $_POST['nama'] : '';
$alamat = isset($_POST['alamat']) ? $_POST['alamat'] : '';

$sql = "UPDATE tb_siswa SET nisn='$nisn', nama='$nama', alamat='$alamat' WHERE id='$id'";

if ($conn->query($sql) === TRUE) {
    echo json_encode("Success");
} else {
    echo json_encode("Error");
}

$conn->close();
?> 
