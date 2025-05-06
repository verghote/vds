<?php
// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . "/include/autoload.php";

// Vérification du jeton
Jeton::verifier();

// vérification des données attendues
if (!Std::existe('password', 'passwordActuel')) {
    Erreur::envoyerReponse("Paramètre manquant", 'global');
}

// récupérer les données transmises
$passwordActuel = $_POST["passwordActuel"];
$password = $_POST['password'];
$id = $_SESSION['membre']['id'];
$login = $_SESSION['membre']['login'];

// vérification de la validité du mot de passe actuel
if (!Membre::verifierPassword($id, $passwordActuel)) {
    Erreur::envoyerReponse('Mot de passe incorrect', 'passwordActuel');
}

// vérification de la validité du nouveau mot de passe en rapport aux règles définies
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

$reponse = ['success' => "Opération réalisée avec succès"];
echo json_encode($reponse, JSON_UNESCAPED_UNICODE);
