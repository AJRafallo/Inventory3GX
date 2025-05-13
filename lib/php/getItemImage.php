<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include("config.php");

if (!isset($_GET['item_no'])) {
    echo json_encode(["status" => "error", "message" => "Item_No not provided"]);
    exit;
}

$item_no = $_GET['item_no'];
$stmt = $conn->prepare("SELECT Item_Pix_Filename FROM inventory WHERE Item_No = ?");
$stmt->bind_param("s", $item_no);
$stmt->execute();
$stmt->bind_result($filename);

if ($stmt->fetch()) {
    $image_url = "http://localhost/images/" . $filename; // Adjust path if needed
    echo json_encode(["status" => "success", "image_url" => $image_url]);
} else {
    echo json_encode(["status" => "error", "message" => "Image not found"]);
}

$stmt->close();
$conn->close();
?>
