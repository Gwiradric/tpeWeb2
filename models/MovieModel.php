<?php

class MovieModel
{
    private $db;

    function __construct() {
        $this->db = new PDO(
            'mysql:host=localhost;'
                . 'dbname=db_movies;charset=utf8',
            'root',
            ''
        );
    }

    function getMovie($id) {
        $sentence = $this->db->prepare('select * from movies where id_movie = ?');
        $sentence->execute([$id]);
        return ($sentence->fetchAll(PDO::FETCH_ASSOC));
    }

    function getMovies() {
        $sentence = $this->db->prepare('select * from movies');
        $sentence->execute();
        return ($sentence->fetchAll(PDO::FETCH_ASSOC));
    }

    function insertMovie($name, $description, $year, $rating) {
        $sentence = $this->db->prepare('INSERT INTO movies (name, description, year, rating) VALUES (?, ?, ?, ?)');
        $sentence->execute([$name, $description, $year, $rating]);
        header("Location: " . BASE_URL);
    }

    function deleteMovie($id) {
        $sentence = $this->db->prepare("delete from movies where id_movie = ?");
        $sentence->execute([$id]);
        header("Location: " . BASE_URL);
    }

    function getMoviesGenre($id_genre) {
        $sentence = $this->db->prepare('select * from movies where id_genre = ?');
        $sentence->execute([$id_genre]);
        return ($sentence->fetchAll(PDO::FETCH_ASSOC));
    }

    function getDropDrown() {
        $sentence = $this->db->prepare('SELECT name from genres');
        $sentence->execute();
        return ($sentence->fetchAll(PDO::FETCH_ASSOC));
    }

}
