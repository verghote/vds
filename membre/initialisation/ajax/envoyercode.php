<?php
// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . "/include/autoload.php";

// Vérification du jeton
Jeton::verifier();

// vérification de la transmission du login
if (!isset($_POST['login'])) {
    Erreur::envoyerReponse("Le login n'a pas été transmis.", 'global');
}

// récupération des données transmises
$login = $_POST["login"];

// Contrôle du login et récupération de l'email associé au login
$membre = Membre::getByLogin($login);
if (!$membre) {
    Erreur::envoyerReponse('Ce login n\'est pas associé à un membre', 'login');
}
$email = $membre["email"];

// génération du code aléatoire
Membre::envoyerCode($login, $email);

// réponse du serveur
echo json_encode(['success' => "Opération réalisée avec succès"], JSON_UNESCAPED_UNICODE);


