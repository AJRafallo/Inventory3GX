<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Content-Type: application/json");

include 'config.php'; // Include your database connection

// Read JSON input
$inputData = json_decode(file_get_contents("php://input"), true);

// Check if all required fields are present
if (!isset($inputData['Uname'], $inputData['Email'], $inputData['Pword'], $inputData['Emp_No'], $inputData['Utype'])) {
    echo json_encode(["status" => "error", "message" => "Missing required fields"]);
    exit;
}

// Trim input values
$uname = trim($inputData['Uname']);
$email = trim($inputData['Email']);
$pword = trim($inputData['Pword']);
$empNo = trim($inputData['Emp_No']);
$utype = trim($inputData['Utype']);

// Validate email format (optional but recommended)
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo json_encode(["status" => "error", "message" => "Invalid email format"]);
    exit;
}

// Validate password strength (optional but recommended)
if (strlen($pword) < 6) {
    echo json_encode(["status" => "error", "message" => "Password should be at least 6 characters long"]);
    exit;
}

// Hash the password before storing it
$hashedPassword = password_hash($pword, PASSWORD_BCRYPT);

// Debugging: Log the hashed password
error_log("Hashed password: " . $hashedPassword);

// Check if the username already exists
$stmt = $conn->prepare("SELECT Uname FROM user_id WHERE Uname = ?");
$stmt->bind_param("s", $uname);
$stmt->execute();
$stmt->store_result();
if ($stmt->num_rows > 0) {
    echo json_encode(["status" => "error", "message" => "Username already exists"]);
    $stmt->close();
    $conn->close();
    exit;
}

// Insert the user into the database
$stmt = $conn->prepare("INSERT INTO user_id (Uname, Email, Pword, Emp_No, Utype) VALUES (?, ?, ?, ?, ?)");
$stmt->bind_param("sssss", $uname, $email, $hashedPassword, $empNo, $utype);

// Execute the query and check for success
if ($stmt->execute()) {
    echo json_encode(["status" => "success", "message" => "Registration successful"]);
} else {
    error_log("Error: " . $stmt->error);  // Log any SQL error
    echo json_encode(["status" => "error", "message" => "Failed to register"]);
}

// Close the statement and connection
$stmt->close();
$conn->close();
?>
