<?php
$host = "localhost"; // ganti jika bukan localhost
$user = "root"; // user database
$password = ""; // password database
$db = "map_sekolah"; // nama database

$koneksi = mysqli_connect($host, $user, $password, $db);

if (!$koneksi) {
    echo json_encode([
        "status" => false,
        "message" => "Koneksi database gagal: " . mysqli_connect_error()
    ]);
// } else {
//     echo json_encode([
//         "status" => true,
//         "message" => "Koneksi database berhasil"
//     ]);
}
?>
