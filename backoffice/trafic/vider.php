<?php
// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . '/include/autoload.php';

// Vérification de l'authentification
Jeton::verifier();

TraficIp::vider();

// retour sur la page d'accueil du module
header('Location: index.php');
