<?php
// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . '/include/autoload.php';

// vérification de l'authentification
Jeton::verifier();

// vérification du paramètre attendu
if (!isset($_POST["nomFichier"])) {
    Erreur::envoyerReponse("Le nom du fichier n'est pas transmis", 'global') ;
}

$nom = $_POST["nomFichier"];

// vérification de la valeur du paramètre attendu de la forme :
// le nom doit être de la forme xxxx-xx-xx-xx-xx-xx.sql
if (!preg_match('/^\d{4}-\d{2}-\d{2}-\d{2}-\d{2}-\d{2}\.sql$/', $nom)) {
    Erreur::envoyerReponse("Le nom du fichier de sauvegarde ne respecte pas le format attendu", 'global');
}

$nomFichier =  "../sql/$nom";

// vérification de l'existence du fichier
if (!file_exists($nomFichier)) {
    Erreur::envoyerReponse("Le fichier de sauvegarde n'a pas été trouvé", 'global') ;
}

// suppression du fichier
if (unlink($nomFichier)) {
    echo json_encode(['success' => 'Le fichier de sauvegarde a été supprimé']) ;
} else {
    Erreur::envoyerReponse("Échec de la suppression", 'global') ;
}
