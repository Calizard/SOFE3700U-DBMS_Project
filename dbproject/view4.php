<?php 

require_once 'config/db.php';
require_once 'config/functions.php';

$view = displayOrdersView();

?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <title>Orders and Shipping View</title>
</head>
<body class="bg-dark">
    <div class="container">
      <div class="row mt-5">
        <div class="col">
          <div class="card mt-5">
            <div class="card-header">
              <h2 class="display-6 text-center">Orders and Shipping View</h2>
            </div>
            <div class="card-body">
              <table class="table table-bordered text-center">
                <tr class="bg-dark text-white">
                  <td> Order ID </td>
                  <td> Order Date </td>
                  <td> Customer ID </td>
                  <td> Employee ID </td>
                  <td> Shipping ID </td>
                  <td> Warehouse ID </td>
                  <td> Total Price </td>
                  <td> Shipping ID </td>
                  <td> Shipment Date </td>
                  <td> Order ID </td>
                </tr>
                <tr>
                <?php 

                  while($row = mysqli_fetch_assoc($view))
                  {
                ?>
                  <td><?php echo $row['Order_ID']; ?></td>
                  <td><?php echo $row['Order_Date']; ?></td>
                  <td><?php echo $row['Cust_ID']; ?></td>
                  <td><?php echo $row['Emp_ID']; ?></td>
                  <td><?php echo $row['Ship_ID']; ?></td>
                  <td><?php echo $row['ware_ID']; ?></td>
                  <td><?php echo $row['Total_Price']; ?></td>
                  <td><?php echo $row['Shipping_ID']; ?></td>
                  <td><?php echo $row['Shipment_Date']; ?></td>
                  <td><?php echo $row['Ord_ID']; ?></td>
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