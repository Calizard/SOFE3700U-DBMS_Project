<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Views Page</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <style>
        h1 {
            color: #fff;
            background-color: #212529;
            padding: 10px;
        }
        .sidebar {
            position: fixed;
            top: 300px;
            bottom: 0;
            left: 0;
            width: 250px;
            padding-top: 20px;
            padding-right: 10px;
            overflow-y: auto;
            background-color: #212529;
        }
        .main-content {
            margin-left: 260px; /* Adjust the left margin according to your sidebar width */
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

<div class="container-fluid">
    <div class="row">
        <nav class="col-md-2 d-none d-md-block sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <?php for ($i = 1; $i <= 10; $i++) : ?>
                        <li class="nav-item">
                            <a class="nav-link" href="#view<?= $i ?>">
                                <?php
                                // Read the title from the view file
                                $viewTitle = "";
                                $viewFilePath = "view$i.php";
                                if (file_exists($viewFilePath)) {
                                    ob_start();
                                    include $viewFilePath;
                                    $viewContent = ob_get_clean();
                                    preg_match('/<title>(.*?)<\/title>/', $viewContent, $matches);
                                    $viewTitle = isset($matches[1]) ? $matches[1] : "View $i";
                                } else {
                                    $viewTitle = "View $i";
                                }
                                echo $viewTitle;
                                ?>
                            </a>
                        </li>
                    <?php endfor; ?>
                </ul>
            </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 main-content">
            <?php for ($i = 1; $i <= 10; $i++) : ?>
                <div id="view<?= $i ?>" class="my-4">
                    <?php include "view$i.php"; ?>
                </div>
            <?php endfor; ?>
        </main>
    </div>
</div>

<script src="../js/bootstrap.bundle.min.js"></script>
</body>
</html>