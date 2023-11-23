<?php 

require_once '../config/db.php';
require_once '../config/functions.php';

$view = displayProductInfo();

?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <title>Product Info View</title>
</head>
<body class="bg-dark">
    <div class="container">
      <div class="row mt-5">
        <div class="col">
          <div class="card mt-5">
            <div class="card-header">
              <h2 class="display-6 text-center">Product Info View</h2>
            </div>
            <div class="card-body">
              <table class="table table-bordered text-center">
                <tr class="bg-dark text-white">
                  <td> Product ID </td>
                  <td> Product Name </td>
                  <td> Product Price </td>
                  <td> Product Description </td>
                  <td> Category Name </td>
                  <td> Supplier Name </td>
                  <td> Manufacturer Name </td>
                </tr>
                <tr>
                <?php 

                  while($row = mysqli_fetch_assoc($view))
                  {
                ?>
                  <td><?php echo $row['product_ID']; ?></td>
                  <td><?php echo $row['prod_name']; ?></td>
                  <td><?php echo '$'.$row['prod_price']; ?></td>
                  <td><?php echo $row['prod_desc']; ?></td>
                  <td><?php echo $row['category_name']; ?></td>
                  <td><?php echo $row['supp_name']; ?></td>
                  <td><?php echo $row['manu_name']; ?></td>
                </tr>
                <?php    
                  }
                
                ?>
                
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>