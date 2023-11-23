<?php
// Database connection parameters
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

// Get table names from the database
$tables = array();
$result = $conn->query("SHOW FULL TABLES WHERE Table_Type = 'BASE TABLE'");
while ($row = $result->fetch_row()) {
    $tables[] = $row[0];
}

// Function to generate JSON file
function generateJson($tableName, $conn) {
    $query = "SELECT * FROM $tableName";
    $result = $conn->query($query);

    $data = array();

    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }

    $json = json_encode($data, JSON_PRETTY_PRINT);

    // Save the JSON to a file
    $filename = $tableName . "_data.json";
    file_put_contents($filename, $json);

    // Display the generated JSON content
    echo "<div class='alert alert-success mt-3' role='alert'>";
    echo "JSON file generated! <a href='$filename' download>Download $filename</a>";
    echo "<pre>$json</pre>";
    echo "</div>";

    // Delete the file after download
    unlink($filename);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate JSON</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <style>
        h1 {
            color: #fff;
            background-color: #212529;
            padding: 10px;
        }
        .container {
            margin-top: 50px;
            text-align: center;
        }
        #table {
            text-align: center;
        }
        body {
            background-color: #212529;
            margin: 0;
            position: relative;
        }
        label {
            color: #fff;
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

<div class="container">
    <form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
        <div class="form-group">
            <label for="table">Select a table:</label>
            <select name="table" id="table" class="form-control">
                <?php
                foreach ($tables as $table) {
                    echo "<option value='$table'>$table</option>";
                }
                ?>
            </select>
        </div>
        <button type="submit" class="btn btn-primary btn-lg btn-block">Generate JSON</button>
    </form>

    <?php
    // Display generated JSON content
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $selectedTable = $_POST["table"];
        generateJson($selectedTable, $conn);
    }
    ?>
</div>

</body>
</html>

<?php
// Close connection
$conn->close();
?>