<?php
require $_SERVER['DOCUMENT_ROOT'] . '/include/autoload.php';

// contrôle de la transmission du paramètre attendu
if (!isset($_POST['journal']) ) {
    Erreur::envoyerReponse("Le nom du journal à afficher n'est pas transmis ", 'global');
}

// récupération du paramètre
$journal = $_POST['journal'];

$data = Journal::getLesEvenements($journal);

echo  json_encode($data);
