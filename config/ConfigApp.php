<?php
$port = ":80";
define ('HOME', 'Location: http://'.$_SERVER["SERVER_NAME"] . $port . dirname($_SERVER["PHP_SELF"]));
define('MOVIES', 'Location: http://'.$_SERVER["SERVER_NAME"] . $port . dirname($_SERVER["PHP_SELF"]) . '/movies/');


class ConfigApp {
    public static $ACTION = 'action';
    public static $PARAMS = 'params';
    public static $ACTIONS = [
         '' => 'GenreController#home',
         'home' => 'GenreController#home',
         'deleteGenre' => 'GenreController#deleteGenre',
         'insertGenre' => 'GenreController#insertGenre',
         'showGenreForm' => 'GenreController#showGenreForm',
         'showMovies' => 'MovieController#showMoviesGenre',
         'deleteMovie' => 'MovieController#deleteMovie',
    ];
}