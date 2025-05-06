"use strict";

import {
    configurerFormulaire,
    donneesValides,
    afficherErreurSaisie,
    afficherErreur,
} from 'https://verghote.github.io/composant/fonction.js';

/*global token */

// récupération des éléments du DOM
const btnEnvoyer = document.getElementById('btnEnvoyer');
const zoneReponse = document.getElementById('zoneReponse');
const zone1 = document.getElementById('zone1');
const zone2 = document.getElementById('zone2');
const btnValider = document.getElementById('btnValider');
const password = document.getElementById('password');
const code = document.getElementById('code');
const login = document.getElementById('login');

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

configurerFormulaire();

btnEnvoyer.onclick = () => {
    if (donneesValides(zone1)) {
        envoyer();
    }
};

// Choix de la phase à afficher : étape 1 : il n'y a pas de clé login dans SessionStorage
// mais comment récupérer le login : le stocker à l'issue de la phase 1
/*
if (sessionStorage.login) {
    login.value = sessionStorage.login;
    login.disabled = true;
    zone2.style.display = "block";
} else {
    login.disabled = false;
    zone1.style.display = "block";
    zone2.style.display = "none";
}
*/
// phase 1 : envoi du code
function envoyer() {
    $.ajax({
        url: 'ajax/envoyercode.php',
        method: 'POST',
        data: {
            login: login.value,
            token: token
        },
        dataType: "json",
        success: (data) => {
            if (data.success) {
                // masquer la zone 1
                zone1.style.display = "none";
                // afficher la zone 2
                zone2.style.display = "block";
                sessionStorage.login = login.value;
            } else {
                for (const key in data.error) {
                    const message = data.error[key];
                    if (key === 'system') {
                        console.log(message);
                        afficherErreur('Une erreur inattendue est survenue');
                    } else if (key === 'global') {
                        afficherErreur(message);
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

// phase 2 : demande de réinitialisation après contrôle des données saisies
btnValider.onclick = () => {
    if (donneesValides(zone2)) {
        reinitialiser();
    }
};

function reinitialiser() {
    $.ajax({
        url: "ajax/initialiser.php",
        data: {
            login: login.value,
            password: password.value,
            code: code.value,
            token: token
        },
        method: 'post',
        dataType: "json",
        success: (data) => {
            if (data.success) {
                // masquer les zones 1 et 2
                zone1.style.display = "none";
                zone2.style.display = "none";
                // afficher la zone de réponse
                zoneReponse.style.display = "block";
                // suppression de la valeur stockée dans sessionStorage
                sessionStorage.removeItem("login");
            } else {
                for (const key in data.error) {
                    const message = data.error[key];
                    if (key === 'system') {
                        console.log(message);
                        afficherErreur('Une erreur inattendue est survenue');
                    } else if (key === 'global') {
                        afficherErreur(message);
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

