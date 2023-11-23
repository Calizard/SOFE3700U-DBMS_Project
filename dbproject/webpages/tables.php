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

// Function to fetch data from the selected table
function fetchData($tableName, $conn) {
    $query = "SELECT * FROM $tableName";
    $result = $conn->query($query);

    return $result;
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <title>Data View</title>
    <style>
        h1 {
            color: #fff;
            background-color: #212529;
            padding: 10px;
        }
        body {
            background-color: #212529;
            margin: 0;
            position: relative;
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
        <div class="card">
            <div class="card-header">
                <h2 class="display-6 text-center">Table Data View</h2>
            </div>
            <div class="card-body">
                <form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                    <div class="form-group">
                        <label for="table">Select a table:</label>
                        <select name="table" id="table" class="form-control">
                            <?php
                            $tables = array();
                            $result = $conn->query("SHOW FULL TABLES WHERE Table_Type = 'BASE TABLE'");
                            while ($row = $result->fetch_row()) {
                                $tables[] = $row[0];
                            }

                            foreach ($tables as $table) {
                                echo "<option value='$table'>$table</option>";
                            }
                            ?>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Fetch Data</button>
                </form>

                <?php
                if ($_SERVER["REQUEST_METHOD"] == "POST") {
                    $selectedTable = $_POST["table"];
                    $result = fetchData($selectedTable, $conn);
                    ?>
                    <h3 class="text-center mt-3">Data for Table: <?php echo $selectedTable; ?></h3>
                    <table class="table table-bordered text-center mt-3">
                        <thead class="bg-dark text-white">
                            <tr>
                                <?php
                                // Display table headers
                                $fields = $result->fetch_fields();
                                foreach ($fields as $field) {
                                    echo "<th>{$field->name}</th>";
                                }
                                ?>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            // Display table data
                            while ($row = $result->fetch_assoc()) {
                                echo "<tr>";
                                foreach ($row as $value) {
                                    echo "<td>{$value}</td>";
                                }
                                echo "</tr>";
                            }
                            ?>
                        </tbody>
                    </table>
                <?php } ?>
            </div>
        </div>
    </div>

    <?php
    // Close connection
    $conn->close();
    ?>

</body>

</html>
