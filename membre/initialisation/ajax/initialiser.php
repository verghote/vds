<?php
// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . "/include/autoload.php";

// Vérification du jeton
Jeton::verifier();

// vérification des données attendues
if (!Std::existe('password', 'login', 'code')) {
    Erreur::envoyerReponse('Requête invalide, des paramètres manquent.', 'system');
}

// récupérer les données transmises
$password = $_POST['password'];
$login = $_POST['login'];
$code = $_POST['code'];

// vérification du code
$reponse = Membre::verifierCode($login, $code);
if ($reponse !== 'ok') {
    Erreur::envoyerReponse($reponse, 'code');
}

// vérification de la validité du mot de passe
if (!Std::passwordValide($password)) {
    Erreur::envoyerReponse('Votre nouveau mot de passe ne respecte pas les règles', 'password');
}

// le mot de passe ne doit pas être compromis
if (Membre::estUnMotDePasseCompromis($password)) {
    Erreur::envoyerReponse('Ce mot de passe est compromis, veuillez en choisir un autre', 'password');
}

// le mot de passe ne doit pas avoir déjà été utilisé
if (Membre::estUnAncienMotDePasse($login, $password)) {
    Erreur::envoyerReponse('Ce mot de passe a déjà été utilisé, veuillez en choisir un autre', 'password');
}

// Mise à jour du mot de passe
Membre::modifierPassword($login, $password);


// réponse du serveur
echo json_encode(['success' => "Opération réalisée avec succès"], JSON_UNESCAPED_UNICODE);
