<?php
header('Content-Type: application/json');
include 'koneksi.php';// pastikan file ini berisi koneksi ke MySQL

$response = array();
$data = array();

$sql = "SELECT * FROM schools";
$result = mysqli_query($koneksi, $sql);

if ($result) {
    while ($row = mysqli_fetch_assoc($result)) {
        $data[] = array(
            'id' => $row['id'],
            'name' => $row['name'],
            'latitude' => $row['latitude'],
            'longitude' => $row['longitude'],
            'image_path' => $row['image_path'] ?? '',
            'accreditation' => $row['accreditation'],
            'established_year' => $row['established_year'],
            'rating' => $row['rating'],
            'history' => $row['history']
        );
    }

    $response['isSuccess'] = true;
    $response['message'] = 'Data sekolah berhasil diambil';
    $response['data'] = $data;
} else {
    $response['isSuccess'] = false;
    $response['message'] = 'Gagal mengambil data';
}

echo json_encode($response);
?>
