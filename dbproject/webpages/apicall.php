<?php
// Database configuration
$host = "localhost";
$username = "root";
$password = "";
$database = "dbproject";

// API endpoint
$api_url = "https://jsonplaceholder.typicode.com/users";

// MySQL database connection
$mysqli = new mysqli($host, $username, $password, $database);

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// 1. Make GET call to an External API
$api_response = file_get_contents($api_url);

// Check if the API call was successful
if ($api_response === FALSE) {
    die("Failed to fetch data from API");
}

// 2. Retrieve data and process
$data = json_decode($api_response, true);

// 3. Save data into the Database
foreach ($data as $item) {
    $name = $mysqli->real_escape_string($item['name']);
    $email = $mysqli->real_escape_string($item['email']);
    $sql = "INSERT INTO api_data (name, email) VALUES ('$name', '$email')";
    $mysqli->query($sql);
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>API Data Display</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
        h1 {
            color: #fff;
            background-color: #212529;
            padding: 10px;
        }
    </style>
</head>

<body>
<h1>Magnificent Furniture</h1>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <?php
                $viewNames = array(
                    'home',
                    'views',
                    'getJSON',
                    'tables',
                    'addProduct',
                    'APIcall',
                );
                foreach ($viewNames as $viewName) {
                    $file = $viewName . '.php';
                    if (file_exists($file)) {
                        echo '<li class="nav-item">';
                        echo '<a class="nav-link" href="' . $file . '">' . ucwords(str_replace('_', ' ', $viewName)) . '</a>';
                        echo '</li>';
                    }
                }
                ?>
            </ul>
        </div>
    </div>
</nav>
    <div class="container mt-5">
        <h2 class="text-center">API Data Display</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // Display data in the table
                foreach ($data as $item) {
                    echo "<tr>";
                    echo "<td>{$item['name']}</td>";
                    echo "<td>{$item['email']}</td>";
                    echo "</tr>";
                }
                ?>
            </tbody>
        </table>
    </div>

</body>

</html>