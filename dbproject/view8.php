<?php 

require_once 'config/db.php';
require_once 'config/functions.php';

$view = displayWarehouseManagers();

?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <title>Warehouse Managers View</title>
</head>
<body class="bg-dark">
    <div class="container">
      <div class="row mt-5">
        <div class="col">
          <div class="card mt-5">
            <div class="card-header">
              <h2 class="display-6 text-center">Warehouse Managers View</h2>
            </div>
            <div class="card-body">
              <table class="table table-bordered text-center">
                <tr class="bg-dark text-white">
                  <td> Warehouse ID </td>
                  <td> Warehouse Address </td>
                  <td> Manager Name </td>

                </tr>
                <tr>
                <?php 

                  while($row = mysqli_fetch_assoc($view))
                  {
                ?>
                  <td><?php echo $row['Warehouse_ID']; ?></td>
                  <td><?php echo $row['War_Address']; ?></td>
                  <td><?php echo $row['ManagerName']; ?></td>
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