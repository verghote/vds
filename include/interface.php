<?php
// S'il s'agit d'une première connexion (mot de passe 0000), on redirige vers la page de personnalisation du mot de passe
if (isset($_SESSION['personnaliser']) && $_SERVER['PHP_SELF'] !== '/membre/personnaliserpassword/index.php') {
    header('location:/membre/personnaliserpassword');
    exit;
}

// le système 'Se souvenir de moi est-il activé ?
Membre::connexionAutomatique();

//  Comptabilisation des visites
StatVisite::comptabiliser();

//  Comptabilisation de l'appel
StatPage::comptabiliser();

?>
<!DOCTYPE HTML>
<html lang="fr">
<head>
    <title>Amicale du Val de Somme</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
            crossorigin="anonymous">
    </script>
    <link rel="stylesheet" href="/css/style.css">
    <?php
    // récupération du nom du script php appelé afin de charger le fichier js de même nom
    $file = pathinfo($_SERVER['PHP_SELF'], PATHINFO_FILENAME);
    if (file_exists("$file.js")) {
        echo "<script type='module' src='$file.js' ></script>";
    }
    // chargement des données et composants spécifiques de la page si nécessaire
    if (isset($head)) {
        echo $head;
    }
    ?>
    <script>
        window.addEventListener('load', () => {
            document.querySelectorAll('[data-bs-toggle="popover"]').forEach(element => new bootstrap.Popover(element));
            document.querySelectorAll('[data-bs-toggle="tooltip"]').forEach(element => new bootstrap.Tooltip(element));
            document.getElementById('pied').style.visibility = 'visible';
        });
    </script>
</head>
<body>
<div class="container-fluid d-flex flex-column p-0 h-100">
    <header>
        <?php require __DIR__ . '/header.php' ?>
    </header>
    <main>
        <?php
        // chargement de l'interface de la page
        if (file_exists("$file.html")) {
            require "$file.html";
        }
        ?>
    </main>
    <footer id="pied">
        <?php require __DIR__ . '/footer.php' ?>
    </footer>
</div>
</body>
</html>
