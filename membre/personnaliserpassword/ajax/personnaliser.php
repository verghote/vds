<?php
// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . "/include/autoload.php";

// Vérification du jeton
Jeton::verifier();

// vérification des données attendues
if (!Std::existe('password')) {
    Erreur::envoyerReponse("Paramètre manquant", 'global');
}

// récupérer les données transmises
$password = $_POST['password'];
$login = $_SESSION['membre']['login'];

// vérification de la validité du mot de passe
if (!Std::passwordValide($password)) {
    Erreur::envoyerReponse('Votre nouveau mot de passe ne respecte pas les règles', 'password');
}

// le mot de passe ne doit pas être compromis
if (Membre::estUnMotDePasseCompromis($password)) {
    Erreur::envoyerReponse('Ce mot de passe est compromis, veuillez en choisir un autre', 'password');
}

// Mise à jour du mot de passe
Membre::modifierPassword($login, $password);

// suppression de la variable de session indiquant l'obligation de personnalisation du mot de passe
unset($_SESSION['personnaliser']);

// réponse du serveur
$reponse = ['success' => "Opération réalisée avec succès"];
echo json_encode($reponse, JSON_UNESCAPED_UNICODE);
