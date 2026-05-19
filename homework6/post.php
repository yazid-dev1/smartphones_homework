<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");

// 1. الاتصال بقاعدة البيانات (اسم السيرفر، المستخدم، الرقم السري، اسم قاعدة البيانات)
$conn = new mysqli("localhost", "root", "", "crud_flutter_db");

if ($conn->connect_error) {
    die(json_encode(array("status" => "error", "message" => "Connection failed")));
}

// 2. استقبال البيانات القادمة من تطبيق الفلاتر
$nisn   = isset($_POST['nisn']) ? $_POST['nisn'] : '';
$nama   = isset($_POST['nama']) ? $_POST['nama'] : '';
$alamat = isset($_POST['alamat']) ? $_POST['alamat'] : '';

if(empty($nisn) || empty($nama)) {
    echo json_encode("Error: Fields cannot be empty");
    exit;
}

// 3. إدخال البيانات في الجدول
$sql = "INSERT INTO tb_siswa (nisn, nama, alamat) VALUES ('$nisn', '$nama', '$alamat')";

if ($conn->query($sql) === TRUE) {
    echo json_encode("Success");
} else {
    echo json_encode("Error");
}

$conn->close();
?>
