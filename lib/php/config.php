<?php
$host = "localhost";
$user = "root";  // Default XAMPP user
$password = "root";  // Default is empty
$database = "inventory_erp_db";  // Change to your database name

$conn = new mysqli($host, $user, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
