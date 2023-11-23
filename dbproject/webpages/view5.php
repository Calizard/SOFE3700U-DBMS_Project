<?php 

require_once '../config/db.php';
require_once '../config/functions.php';

$view = displayDep1and2Employees();

?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <title>Department 1 and 2 Employees View</title>
</head>
<body class="bg-dark">
    <div class="container">
      <div class="row mt-5">
        <div class="col">
          <div class="card mt-5">
            <div class="card-header">
              <h2 class="display-6 text-center">Department 1 and 2 Employees View</h2>
            </div>
            <div class="card-body">
              <table class="table table-bordered text-center">
                <tr class="bg-dark text-white">
                  <td> Employee ID </td>
                  <td> Employee First Name </td>
                  <td> Employee Last Name </td>
                </tr>
                <tr>
                <?php 

                  while($row = mysqli_fetch_assoc($view))
                  {
                ?>
                  <td><?php echo $row['E_ID']; ?></td>
                  <td><?php echo $row['Emp_Fname']; ?></td>
                  <td><?php echo $row['Emp_Lname']; ?></td>
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