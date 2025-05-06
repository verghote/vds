<?php
// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . "/include/autoload.php";

// Vérification du jeton
Jeton::verifier();

// vérification des données attendues
if (!isset($_POST['login'])) {
    Erreur::envoyerReponse("Le login n'a pas été transmis.", 'global');
}

// récupération du login
$login = $_POST["login"];

// contrôle du login et récupération de l'adresse électronique associée au login
$membre = Membre::getByLogin($login);
if (!$membre) {
    Erreur::envoyerReponse('Ce login n\'est pas associé à un membre', 'login');
}
$email = $membre["email"];

// suppression des anciennes demandes
Oubli::supprimerAncienne();

// vérification de l'absence de demande en cours
if (Oubli::verifier($login)) {
    Erreur::envoyerReponse("Une demande est déjà en cours de traitement, consultez votre boîte mail", 'global');
}

// Enregistrement de la demande de réinitialisation dans la table oubli avec récupération du token de validation
$token = Oubli::enregistrer($login);

// envoi du mail
$sujet = "Demande de réinitialisation de mot de passe sur le site de l'amicale du Val de Somme";
$contenu = <<<EOD
    Bonjour
    <br>Vous recevez cet email car nous avons reçu une demande de réinitialisation du mot de passe de votre compte.
    <br>Cliquez sur le lien ci-dessous pour choisir un nouveau mot de passe <br>
            <br> <a href="http://vds-correction/membre/initialisationpassword/?id=$token">Réinitialiser mon mot de passe</a>
            <br> Vous pouvez aussi le copier et le coller dans la barre d'adresse de votre navigateur.
            <br><br>Ce lien est valable 30 minutes.
            <br><br>Si vous n'êtes pas à l'origine de cette demande, veuillez ignorer ce message et ne pas cliquer sur le lien ci-dessus.
            <br><br>
            Cordialement
            <br>L'Amicale du Val de Somme
EOD;
$mail = new Mail();
$mail->envoyer($email, $sujet, $contenu);

// réponse du serveur
echo json_encode(['success' => "Opération réalisée avec succès"], JSON_UNESCAPED_UNICODE);
