<?php
// Database connection parameters
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "dbproject"; // Replace with your actual database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Function to insert product into the database
function insertProduct($conn, $productName, $price, $description, $categoryID, $supplierID, $manufacturerID) {
    $productName = $conn->real_escape_string($productName);
    $description = $conn->real_escape_string($description);

    $query = "INSERT INTO product (prod_name, prod_price, prod_desc, cate_ID, supp_ID, manu_ID) 
              VALUES ('$productName', $price, '$description', $categoryID, $supplierID, $manufacturerID)";

    return $conn->query($query);
}

// Predefined lists for dropdowns
$categories = array(1 => 'Electronics', 2 => 'Clothing', 3 => 'Books', 4 => 'Furniture', 5 => '	
Toys', 6 => 'Kitchen Appliances');
$suppliers = array(1 => 'ElectroTech Supplies', 2 => 'Fashion World', 3 => 'ReadIt Books', 4 => 'HomeDecor Plus', 5 => '	
Kids Emporium', 6 => 'TechZone Electronics');
$manufacturers = array(1 => 'TechPro Electronics', 2 => 'FashionX Clothing', 3 => 'Readwell Books', 4 => 'HomeStyle Furniture', 5 => '	
ToyZone Toys', 6 => 'KitchenTech Appliance');

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $productName = $_POST["product_name"];
    $price = $_POST["price"];
    $description = $_POST["description"];
    $categoryID = $_POST["category_id"];
    $supplierID = $_POST["supplier_id"];
    $manufacturerID = $_POST["manufacturer_id"];

    if (insertProduct($conn, $productName, $price, $description, $categoryID, $supplierID, $manufacturerID)) {
        $message = "Product inserted successfully!";
    } else {
        $message = "Error inserting product: " . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <title>Product Insertion</title>
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
                <h2 class="display-6 text-center">Insert Product</h2>
            </div>
            <div class="card-body">
                <?php
                if (isset($message)) {
                    echo "<div class='alert alert-success' role='alert'>$message</div>";
                }
                ?>
                <form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                    <div class="form-group">
                        <label for="product_name">Product Name:</label>
                        <input type="text" class="form-control" id="product_name" name="product_name" required>
                    </div>
                    <div class="form-group">
                        <label for="price">Price:</label>
                        <input type="number" class="form-control" id="price" name="price" step="0.01" required>
                    </div>
                    <div class="form-group">
                        <label for="description">Description:</label>
                        <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="category_id">Category:</label>
                        <select class="form-control" id="category_id" name="category_id" required>
                            <option value="" disabled selected>Select Category</option>
                            <?php
                            foreach ($categories as $id => $category) {
                                echo "<option value='$id'>$category</option>";
                            }
                            ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="supplier_id">Supplier:</label>
                        <select class="form-control" id="supplier_id" name="supplier_id" required>
                            <option value="" disabled selected>Select Supplier</option>
                            <?php
                            foreach ($suppliers as $id => $supplier) {
                                echo "<option value='$id'>$supplier</option>";
                            }
                            ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="manufacturer_id">Manufacturer:</label>
                        <select class="form-control" id="manufacturer_id" name="manufacturer_id" required>
                            <option value="" disabled selected>Select Manufacturer</option>
                            <?php
                            foreach ($manufacturers as $id => $manufacturer) {
                                echo "<option value='$id'>$manufacturer</option>";
                            }
                            ?>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Insert Product</button>
                </form>
            </div>
        </div>
    </div>

    <?php
    // Close connection
    $conn->close();
    ?>

</body>

</html>
