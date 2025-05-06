"use strict";

import {
    configurerFormulaire,
    donneesValides,
    afficherErreurSaisie,
    afficherErreur,
} from "https://verghote.github.io/composant/fonction.js";

/*global token, login */

// récupération des éléments du DOM
const password = document.getElementById('password');
const btnValider = document.getElementById('btnValider');
const zoneSaisie = document.getElementById('zoneSaisie');
const zoneReponse = document.getElementById('zoneReponse');

const msg = document.getElementById('msg');
const passwordImg = document.getElementById('passwordImg');

// sur le clic de l'oeil, on affiche le mot de passe
passwordImg.addEventListener('click', function() {
    password.type = 'text';
    passwordImg.classList.add("bi-eye");
    passwordImg.classList.remove("bi-eye-slash");

});

// quand la souris n'est plus sur l'oeil, on cache le mot de passe
passwordImg.addEventListener('mouseout', function() {
    password.type = 'password';
    passwordImg.classList.remove("bi-eye");
    passwordImg.classList.add("bi-eye-slash");
});



// configuration du formulaire
configurerFormulaire();

btnValider.onclick = () => {
    if (donneesValides()) {
            initialiser();
    }
};

password.addEventListener('input', () => {
    const pass = password.value;

    // Vérification des conditions requises
    const majusculeRegex = /[A-Z]/;
    const minusculeRegex = /[a-z]/;
    const chiffreRegex = /[0-9]/;
    const specialRegex = /[_\W]/; // Caractère spécial (non alphanumérique)
    const lengthRegex = /.{8,}/; // Au moins 8 caractères

    // Vérifier chaque condition et ajouter ou supprimer la classe correspondante
    document.getElementById('majusc').classList.toggle('validated', majusculeRegex.test(pass));
    document.getElementById('minusc').classList.toggle('validated', minusculeRegex.test(pass));
    document.getElementById('digit').classList.toggle('validated', chiffreRegex.test(pass));
    document.getElementById('special').classList.toggle('validated', specialRegex.test(pass));
    document.getElementById('length').classList.toggle('validated', lengthRegex.test(pass));
});

function initialiser() {
    // vider la zone de message msg
    msg.innerHTML = "";
    $.ajax({
        url: "ajax/initialiser.php",
        data: {
            password: password.value,
            login: login,
            token: token
        },
        method: 'post',
        dataType: "json",
        success: (data) => {
            if (data.success) {
                // masquer la zone de saisie
                zoneSaisie.style.display = "none";
                // afficher la zone de réponse
                zoneReponse.style.display = "block";
            } else {
                for (const key in data.error) {
                    const message = data.error[key];
                    if (key === 'system') {
                        console.log(message);
                        afficherErreur('Une erreur inattendue est survenue');
                    } else if (key === 'global') {
                        msg.innerText =  message;
                    } else {
                        afficherErreurSaisie(key, message);
                    }
                }
            }
        },
        error: reponse => {
            afficherErreur('Une erreur imprévue est survenue');
            console.log(reponse.responseText);
        }
    });
}