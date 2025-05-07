<?php
header("Content-Type: application/json");
include 'koneksi.php';

// Ambil data JSON dari request body
$data = json_decode(file_get_contents("php://input"));

$username = $data->username ?? '';
$password = $data->password ?? '';

if (empty($username) || empty($password)) {
    echo json_encode([
        "status" => false,
        "message" => "NIM dan Password wajib diisi"
    ]);
    exit;
}

// Cek ke database
$query = "SELECT * FROM users WHERE username='$username' AND password='$password'";
$result = mysqli_query($koneksi, $query);

if (mysqli_num_rows($result) > 0) {
    $user = mysqli_fetch_assoc($result);
    echo json_encode([
        "status" => true,
        "message" => "Login berhasil",
        "data" => [
            "username" => $user["username"],
        ]
    ]);
} else {
    echo json_encode([
        "status" => false,
        "message" => "NIM atau Password salah"
    ]);
}
?>
