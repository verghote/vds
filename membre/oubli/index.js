"use strict";

import {
    configurerFormulaire,
    donneesValides,
    afficherErreurSaisie,
    afficherErreur
} from "https://verghote.github.io/composant/fonction.js";

/*global token */

// récupération des éléments du DOM
const login = document.getElementById('login');
const btnEnvoyer = document.getElementById('btnEnvoyer');
const msg = document.getElementById('msg');
const zoneSaisie = document.getElementById('zoneSaisie');
const zoneReponse = document.getElementById('zoneReponse');
const adresse = document.getElementById('adresse');

configurerFormulaire();

btnEnvoyer.onclick = () => {
    if (donneesValides()) {
        envoyer();
    }
};

login.focus();

function envoyer() {
    // vider la zone de message msg
    msg.innerHTML = "";
    $.ajax({
        url: 'ajax/envoyerlien.php',
        method: 'POST',
        data: {
            login: login.value,
            token: token
        },
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
                        msg.innerText = message;
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
