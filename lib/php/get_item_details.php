<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include("config.php");

// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Define the SQL query
$sql = "SELECT Item_No, Item_Desc, Item_Price, Qty, Barcode FROM inventory";  // Added Barcode to the query

// Prepare the statement
$stmt = $conn->prepare($sql);
if (!$stmt) {
    echo json_encode(["status" => "error", "message" => "SQL Error: " . $conn->error]);
    exit;
}

// Execute the query
$stmt->execute();
$result = $stmt->get_result();

// Fetch all items
$items = $result->fetch_all(MYSQLI_ASSOC);

// Close the statement and connection
$stmt->close();
$conn->close(); 

// Return JSON response
if (!empty($items)) {
    echo json_encode(["status" => "success", "message" => "Items fetched successfully", "data" => $items]);
} else {
    echo json_encode(["status" => "error", "message" => "No items found", "data" => []]);
}
?>
