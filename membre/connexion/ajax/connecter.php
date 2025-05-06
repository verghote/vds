<?php
// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . "/include/autoload.php";

// Vérification du jeton
Jeton::verifier();

// Vérification de la transmission des données attendues
if (!Std::existe('login', 'password', 'memoriser')) {
    Erreur::envoyerReponse("Tous les paramètres attendus n'ont pas été transmis", 'global');
}

// récupération des données
$login = $_POST["login"];
$password = $_POST["password"];
$memoriser = intval($_POST["memoriser"]);

// vérification du login
if (!preg_match('/^[a-zA-Z]{2,}$/', $login)) {
    Tentative::enregistrer($login, $password);
} else {
    $membre = Membre::getByLogin($login);
    if (!$membre) {
        Tentative::enregistrer($login, $password);
    }
}

// vérification du mot de passe
if (!Membre::verifierPassword($membre['id'], $password)) {
    Tentative::enregistrer($login, $password);
}

// Mémorisation de la connexion
$permanente = ($memoriser === 1 && $password !== '0000');
Membre::connexion($membre, $permanente);

// Vers quelle page faut-il être redirigé ?
//  - si c'est la première connexion, il faut personnaliser le mot de passe
//  - sinon, on redirige vers la page d'origine ou la page d'accueil
if ($password === '0000') {
    $_SESSION['personnaliser'] = 1;
    $url = '/membre/personnaliserpassword/';
} else if (Membre::estUnMotDePasseCompromis($password)) {
    $_SESSION['erreur']['message'] ='Votre mot de passe est compromis, modifiez-le rapidement';
    $url = '/erreur';
} elseif(isset($_SESSION['url'])) {
    $url = $_SESSION['url'];
    unset($_SESSION['url']);
} else {
    $url = '/';
}

$reponse = ['success' => $url];
echo json_encode($reponse, JSON_UNESCAPED_UNICODE);


