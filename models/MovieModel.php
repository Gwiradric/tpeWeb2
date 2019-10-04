<?php

class MovieModel
{
    private $db;

    function __construct() {
        $this->db = new PDO(
            'mysql:host=localhost;'
                . 'dbname=db_peliculas;charset=utf8',
            'root',
            ''
        );
    }

    function getMovie($id) {
        $sentence = $this->db->prepare('select * from pelicula where id_pelicula = ?');
        $sentence->execute([$id]);
        return ($sentence->fetchAll(PDO::FETCH_ASSOC));
    }

    function getMovies() {
        $sentence = $this->db->prepare('select * from pelicula');
        $sentence->execute();
        return ($sentence->fetchAll(PDO::FETCH_ASSOC));
    }

    function insertMovie($name, $description, $year, $rating) {
        $sentence = $this->db->prepare('INSERT INTO movie (nombre, descripcion, año, rating) VALUES (?, ?, ?, ?)');
        $sentence->execute([$name, $description, $year, $rating]);
        header("Location: " . BASE_URL);
    }

    function deleteMovie($id) {
        $sentence = $this->db->prepare("delete from pelicula where id_pelicula = ?");
        $sentence->execute([$id]);
        header("Location: " . BASE_URL);
    }

    function getMoviesGenre($id_genre) {
        $sentence = $this->db->prepare('select * from pelicula where id_genero = ?');
        $sentence->execute([$id_genre]);
        return ($sentence->fetchAll(PDO::FETCH_ASSOC));
    }

}
