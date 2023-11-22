<?php 

require_once 'config/db.php';
require_once 'config/functions.php';

$view = displayEmployeeTotalSales();

?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <title>Employee's Shipped Sales View</title>
</head>
<body class="bg-dark">
    <div class="container">
      <div class="row mt-5">
        <div class="col">
          <div class="card mt-5">
            <div class="card-header">
              <h2 class="display-6 text-center">Employee's Shipped Sales View</h2>
            </div>
            <div class="card-body">
              <table class="table table-bordered text-center">
                <tr class="bg-dark text-white">
                  <td> Employee Name </td>
                  <td> Employee ID </td>
                  <td> Total Sales </td>
                </tr>
                <tr>
                <?php 

                  while($row = mysqli_fetch_assoc($view))
                  {
                ?>
                  <td><?php echo $row['EmployeeName']; ?></td>
                  <td><?php echo $row['EmployeeID']; ?></td>
                  <td><?php echo '$'.$row['TotalSales']; ?></td>
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