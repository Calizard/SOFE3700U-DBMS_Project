<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
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
        .welcome-text {
            position: absolute;
            top: 500px;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            color: #fff;
            font-size: 48px;
            margin-bottom: 20px;
        }
        nav {
            margin-top: 20px;
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

<div class="welcome-text">
    <p>Welcome to Magnificent Furniture's Demo Web Application Database Management System!</p>
</div>

</body>
</html>