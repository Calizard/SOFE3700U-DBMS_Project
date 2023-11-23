<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "dbproject";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch data from your MySQL table
$sql = "SELECT * FROM supplier";
$result = $conn->query($sql);

// Create an array to store the fetched data
$data = array();

if ($result->num_rows > 0) {
    // Output data of each row
    while($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
} else {
    echo "0 results";
}

// Convert the fetched data into a JSON format
echo json_encode($data);

// Close the database connection
$conn->close();
?>