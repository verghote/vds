<?php
// personnalisation de l'entête de page : bouton Se connecter ou Se déconnecter
if (isset($_SESSION['membre'])) {
    $id = $_SESSION['membre']['id'];
    $nom = $_SESSION['membre']['prenom'] . " " . $_SESSION['membre']['nom'];
    $barre = <<<EOD
            <div class="dropdown">
                   <button class="btn dropdown-toggle"  id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                    <div style="border: 2px solid green; border-radius: 10px; padding: 3px; color:white"> 
                                 🏃‍ $nom
                    </div>
               </button>
               <ul class="dropdown-menu">
                        <li>
                            <button class="dropdown-item" type="button">
                              <a href='/membre/password'><i class="bi bi-person-gear"></i></i>Mot de passe</a>
                            </button>
                        </li>
                        <li>
                            <button class="dropdown-item" type="button">
                                <a href='/membre/deconnexion'><i class="bi bi-box-arrow-right"></i>Se déconnecter</a>
                            </button>
                        </li>
               </ul>
            </div>
EOD;
} else {
    $barre = <<<EOD
        <a class='btn btn-sm btn-danger m-2 shadow-sm' href='/membre/connexion'>Se connecter</a>
        <a href='/membre/initialisation' style="color: white; font-style: italic; font-size: 0.8rem">Mot de passe oublié</a>
EOD;
}
?>
<a href="/" title="Revenir sur la page d'accueil">
    <img class="img-fluid " src="/img/logo.gif" alt="Val de Somme">

</a>
<span class="text-white masquer ">Club de course à pied sur Amiens et ses environs</span>

<div class="text-white px-2">
    <?= $barre ?>
</div>