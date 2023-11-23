<?php 

  require_once 'db.php';

  function displayHighestOrder(){
    global $con;
    $query = "SELECT * FROM `customerhighestorderamount`;";
    $view = mysqli_query($con,$query);
    return $view;
  }

  function displayHighValueCustomers(){
    global $con;
    $query = "SELECT * FROM `highvaluecustomers`;";
    $view = mysqli_query($con,$query);
    return $view;
  }

  function displayEmployeeTotalSales(){
    global $con;
    $query = "SELECT * FROM `employeeshippedsales`;";
    $view = mysqli_query($con,$query);
    return $view;
  }

  function displayOrdersView(){
    global $con;
    $query = "SELECT * FROM `ordersview`;";
    $view = mysqli_query($con,$query);
    return $view;
  }

  function displayDep1and2Employees(){
    global $con;
    $query = "SELECT * FROM `dep1and2employees`;";
    $view = mysqli_query($con,$query);
    return $view;
  }

  function displayOrdersWithCustomers(){
    global $con;
    $query = "SELECT * FROM `orderswithcustomers`;";
    $view = mysqli_query($con,$query);
    return $view;
  }

  function displayProductInfo(){
    global $con;
    $query = "SELECT * FROM `productinfo`;";
    $view = mysqli_query($con,$query);
    return $view;
  }

  function displayWarehouseManagers(){
    global $con;
    $query = "SELECT * FROM `warehousemanagers`;";
    $view = mysqli_query($con,$query);
    return $view;
  }

  function displayTransactionHist(){
    global $con;
    $query = "SELECT * FROM `transactionhistory`;";
    $view = mysqli_query($con,$query);
    return $view;
  }

  function displayWarehouseInventory(){
    global $con;
    $query = "SELECT * FROM `warehouseinventory`;";
    $view = mysqli_query($con,$query);
    return $view;
  }

?>