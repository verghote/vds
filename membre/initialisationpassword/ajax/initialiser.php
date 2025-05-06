<?php
// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . "/include/autoload.php";

// Vérification du jeton
Jeton::verifier();

// vérification des données attendues
if (!Std::existe('password', 'login')) {
    Erreur::envoyerReponse('Requête invalide, des paramètres manquent.', 'global');
}

// récupérer les données transmises
$password = $_POST['password'];
$login = $_POST['login'];

// Contrôle de la conformité du nouveau mot de passe par rapport aux règles à respecter
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

// Supprimer la demande dans la table Oubli
Oubli::supprimer($login);

echo json_encode(['success' => "Opération réalisée avec succès"], JSON_UNESCAPED_UNICODE);
