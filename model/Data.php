<?php
class Data {
    private $bdd;

    public function __construct() {
        try {

   $this->bdd = new PDO(
                "mysql:host=localhost;dbname=e2clib_oli;charset=utf8",
                "root",  // utilisateur MySQL sur Windows
                ""       // mot de passe vide par défaut
            );
            $this->bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (Exception $e) {
            die("Problème de connexion : " . $e->getMessage());
        }
    }

    public function getBooks() {
        $stmt = $this->bdd->query("SELECT * FROM books");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}