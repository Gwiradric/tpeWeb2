<?php

class GenreModel
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

    function getGenre($id) {
        $sentence = $this->db->prepare('select * from genres where id_genre = ?');
        $sentence->execute([$id]);
        return ($sentence->fetchAll(PDO::FETCH_ASSOC));
    }

    function getGenres() {
        $sentence = $this->db->prepare('select * from genres');
        $sentence->execute();
        return ($sentence->fetchAll(PDO::FETCH_ASSOC));
    }

    function insertGenre($name, $description) {
        $sentence = $this->db->prepare('INSERT INTO genres (name, description) VALUES (?, ?)');
        $sentence->execute([$name, $description]);
        header(HOME);
    }

    function deleteGenre($id) {
        $sentence = $this->db->prepare("delete from genres where id_genre = ?");
        $sentence->execute($id);
        header(HOME);
    }

}
