<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include 'koneksi.php';

$sql = "SELECT id, name, latitude, longitude, image_path, accreditation, established_year, rating, history FROM schools";
$result = $koneksi->query($sql);

$response = [];

if ($result->num_rows > 0) {
    $response['isSuccess'] = true;
    $response['message'] = "Berhasil Menampilkan Data Sekolah";
    $response['data'] = [];

    while ($row = $result->fetch_assoc()) {
        $response['data'][] = $row['image_path'];
    }
} else {
    $response['isSuccess'] = false;
    $response['message'] = "Gagal menampilkan data sekolah";
    $response['data'] = null;
}

echo json_encode($response);

?>
