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

    function getMovieName($name) {
        $sentence = $this->db->prepare('SELECT * FROM movies WHERE name = ?');
        $sentence->execute(array($name));
        return ($sentence->fetchAll(PDO::FETCH_ASSOC));
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

    function getGenreId($id) {
        $sentence = $this->db->prepare('SELECT name FROM genres WHERE id_genre = ?');
        $sentence->execute(array($id));
        return ($sentence->fetchAll(PDO::FETCH_ASSOC));
    }

    function getImagesId($id) {
        $sentence = $this->db->prepare('SELECT * FROM images WHERE fk_id_movie = ?');
        $sentence->execute(array($id));
        return ($sentence->fetchAll(PDO::FETCH_ASSOC));
    }

    function insertMovie($name, $id_genre, $description, $year, $rating, $images) {
        $sentence = $this->db->prepare('INSERT INTO movies (name, id_genre, description, year, rating) VALUES (?, ?, ?, ?, ?)');
        $sentence->execute([$name,$id_genre, $description, $year, $rating]);
        $id_movie = $this->db->lastInsertId();
        $paths = $this->uploadImages($images);
        $sentence_images = $this->db->prepare('INSERT INTO images(fk_id_movie, path) VALUES (?, ?)');
        foreach ($paths as $path) {
            $sentence_images->execute(array($id_movie, $path));
        }
    }

    private function uploadImages($images){
        $paths = [];
        foreach ($images as $image) {
          $destiny = 'img/' . uniqid() . '.jpg';
          move_uploaded_file($image, $destiny);
          $paths[]=$destiny;
        }
        return $paths;
    }

    function deleteMovieImagePath($path) {
        $sentence = $this->db->prepare('DELETE FROM images WHERE path = ?');
        $sentence->execute(array($path));
    }

    function deleteMovieImagesId($id) {
        $sentence_image = $this->db->prepare('DELETE FROM images WHERE fk_id_movie = ?');
        $sentence_image->execute(array($id));
    }

    function deleteMovie($id) {
        $sentence = $this->db->prepare('DELETE FROM movies WHERE id_movie = ?');
        $sentence->execute(array($id));
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

    function editMovie($id_movie, $id_genre, $name, $description, $year, $rating, $images) {
        $sentence = $this->db->prepare('UPDATE movies SET id_genre = ?, name = ?, description = ?, year = ?, rating = ? WHERE id_movie = ?');
        $sentence->execute(array($id_genre, $name, $description, $year, $rating, $id_movie));
        $paths = $this->uploadImages($images);
        $sentence_images = $this->db->prepare('INSERT INTO images(fk_id_movie, path) VALUES (?, ?)');
        foreach ($paths as $path) {
            $sentence_images->execute(array($id_movie, $path));
        }
    }
}
