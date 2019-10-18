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
         'edit' => 'GenreController#editGenreForm',
         'edit-genre' => 'GenreController#editGenre',
         'form' => 'GenreController#addGenreForm',
         'add' => 'GenreController#insertGenre',
         'delete' => 'GenreController#deleteGenre',
         'all-movies' => 'MovieController#showMovies',
         'movies' => 'MovieController#showMoviesGenre',
         'edit-movie' => 'MovieController#editMovieForm',
         'edit-movies' => 'MovieController#editMovie',
         'form-movies' => 'MovieController#addMovieForm',
         'add-movie' => 'MovieController#insertMovie',
         'delete-movie' => 'MovieController#deleteMovie',
    ];
}