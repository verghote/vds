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
    <!-- Script Tabulator  -->
    <link href="https://unpkg.com/tabulator-tables/dist/css/tabulator.min.css" rel="stylesheet">
    <script type="text/javascript" src="https://unpkg.com/tabulator-tables/dist/js/tabulator.min.js"></script>
    <style>
        /* Désactive les zébrures */
        .tabulator .tabulator-row:nth-child(even) {
            background-color: inherit !important;
        }
    </style>
    <link rel="stylesheet" href="/css/style.css">
    <?php
    // chargement du fichier js de la page

    // récupération du nom du fichier php appelant cela va permettre de charger l'interface correspondante : fichier html portant le même nom ou le fichier de même nom dans le dossier interface
    $file = pathinfo($_SERVER['PHP_SELF'], PATHINFO_FILENAME);
    if (file_exists("$file.js")) {
        echo "<script type='module' src='$file.js' ></script>";
    }
    if (isset($head)) {
        echo $head;
    }
    ?>
</head>
<body>
<div class="container-fluid ">
    <div class="row">
        <?php require __DIR__ . '/header.html' ?>
        <main class="col-9 col-md-10 p-4">
            <?php
            echo isset($titre) ? "<H4 style='text-align: center; color : darkcyan; font-weight: bold '>$titre</H4>" : '';
            if (file_exists("$file.html")) {
                require "$file.html";
            }
            ?>
        </main>
    </div>
</div>
</body>
</html>
