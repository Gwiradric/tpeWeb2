<?php
$port = ":80";
define('HOME', 'Location: http://' . $_SERVER["SERVER_NAME"] . $port . dirname($_SERVER["PHP_SELF"]));
define('MOVIES', 'Location: http://' . $_SERVER["SERVER_NAME"] . $port . dirname($_SERVER["PHP_SELF"]) . '/movies/');

class ConfigApp
{
    public static $ACTION = 'action';
    public static $PARAMS = 'params';
    public static $ACTIONS = [
        '' => 'GenreController#home',
        'home' => 'GenreController#home',
        'edit-genre' => 'GenreController#editGenreForm',
        'update-genre' => 'GenreController#editGenre',
        'add-genre' => 'GenreController#addGenreForm',
        'insert-genre' => 'GenreController#insertGenre',
        'delete-genre' => 'GenreController#deleteGenre',
        'all-movies' => 'MovieController#showMovies',
        'movie' => 'MovieController#showMovie',
        'movies' => 'MovieController#showMoviesGenre',
        'edit-movie' => 'MovieController#editMovieForm',
        'edit-movies' => 'MovieController#editMovie',
        'add-movie' => 'MovieController#addMovieForm',
        'insert-movie' => 'MovieController#insertMovie',
        'delete-movie' => 'MovieController#deleteMovie',
        'register' => 'UserController#addUser',
        'insert-user' => 'UserController#insertUser',
        'login' => 'LoginController#login',
        'check-login' => 'LoginController#checkLogin',
        'logout' => 'LoginController#logout',
        'users' => 'UserController#showUsers'
    ];
}
