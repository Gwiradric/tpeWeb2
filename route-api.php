<?php
require_once('./helper/Router.php');
require_once('./api/task.api.controller.php');

// CONSTANTES PARA RUTEO
define('HOME', 'Location: http://' . $_SERVER["SERVER_NAME"] . $port . dirname($_SERVER["PHP_SELF"]));
define('MOVIES', 'Location: http://' . $_SERVER["SERVER_NAME"] . $port . dirname($_SERVER["PHP_SELF"]) . '/movies/');
define('USERS', 'Location: http://' . $_SERVER["SERVER_NAME"] . $port . dirname($_SERVER["PHP_SELF"]) . '/users/');

$router = new Router();

// rutas
$router->addRoute("/tareas", "GET", "TaskApiController", "getTasks");
$router->addRoute("/tareas/:ID", "GET", "TaskApiController", "getTask");
$router->addRoute("/tareas/:ID", "DELETE", "TaskApiController", "deleteTask");
$router->addRoute("/tareas", "POST", "TaskApiController", "addTask");
$router->addRoute("/tareas/:ID", "PUT", "TaskApiController", "updateTask");

//run
$router->route($_GET['resource'], $_SERVER['REQUEST_METHOD']);
