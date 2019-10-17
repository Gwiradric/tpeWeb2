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

    function insertMovie($name, $id_genre, $description, $year, $rating) {
        $sentence = $this->db->prepare('INSERT INTO movies (name, id_genre, description, year, rating) VALUES (?, ?, ?, ?, ?)');
        $sentence->execute([$name,$id_genre, $description, $year, $rating]);
        header("Location: " . BASE_URL);
    }

    function deleteMovie($id) {
        $sentence = $this->db->prepare("delete from movies where id_movie = ?");
        $sentence->execute([$id]);
    }

    function getMoviesGenre($id) {
        $sentence = $this->db->prepare('select * from movies where id_genre = ?');
        $sentence->execute([$id]);
        return ($sentence->fetchAll(PDO::FETCH_ASSOC));
    }

    function getDropDrown() {
        $sentence = $this->db->prepare('SELECT id_genre, name from genres');
        $sentence->execute();
        return ($sentence->fetchAll(PDO::FETCH_ASSOC));
    }


}
