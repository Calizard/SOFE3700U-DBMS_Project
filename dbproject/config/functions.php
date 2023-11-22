<?php 

  require_once 'db.php';

  function displayhighestorder(){
    global $con;
    $query = "SELECT * FROM `customerhighestorderamount`;";
    $view1 = mysqli_query($con,$query);
    return $view1;
  }

?>