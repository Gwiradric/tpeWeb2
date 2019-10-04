<?php

require_once "./controllers/GenreController.php";
require_once "./controllers/MovieController.php";

define("BASE_URL", 'http://'.$_SERVER["SERVER_NAME"].':'.$_SERVER["SERVER_PORT"].dirname($_SERVER["PHP_SELF"]).'/');

$action = $_GET['action'];
$partsURL = explode('/', $action);

$controller = new GenreController();

if ($partsURL[0] == '') {
    $controller->showGenres();
} else {
    if (isset($action)) {
        if ($partsURL[0] == 'add') {
            $controller->insertGenre($_POST['title'], $_POST['description']);
        } elseif ($partsURL[0] == 'delete') {
            $controller->deleteGenre($partsURL[1]);
        } elseif ($partsURL[0] == 'movies') {
            $mcontroller = new MovieController();
            $mcontroller->showMoviesGenre($partsURL[1]);
        }
    }
}