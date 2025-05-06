"use strict";

import {
    afficherErreur,
    confirmer,
    genererMessage, ajax
} from "https://verghote.github.io/composant/fonction.js";

/* global data */

// chargement des données
let msg = document.getElementById('msg');
let lesLignes = document.getElementById('lesLignes');
const btnSupprimerTous = document.getElementById('btnSupprimerTous');
const modal = document.getElementById('confirmationModal');
const btnConfirmer = document.getElementById('btnConfirmerSuppression');
const btnAnnuler = document.getElementById('btnAnnulerSuppression');

// Lancer l'affichage
afficher(data);

// afficher les fichiers de sauvegarde sql
function afficher(lesFichiers) {
    // affichage des données
    lesLignes.innerHTML = "";
    for (let j in lesFichiers) {
        let element = lesFichiers[j];
        let tr = lesLignes.insertRow();
        tr.style.verticalAlign = 'middle';
        tr.id = j;

        // colonne contenant un lien vers un fichier pdf
        let td = tr.insertCell();
        td.style.textAlign = 'center';

        // lien pour le téléchargement du fichier de sauvegarde
        let a = document.createElement('a');
        // a.href = 'sql/' + element;
        a.href = 'telecharger.php?fichier=' + element
        // a.download = element;
        let i = document.createElement('i');
        i.classList.add("bi", "bi-cloud-download", "text-danger", "fs-2", "me-2");
        i.title = "Télécharger sur le poste de travail";
        a.appendChild(i);
        td.appendChild(a);

        // lien pour la suppression
        i = document.createElement('i');
        i.classList.add('bi', 'bi-x', 'fs-2', 'text-danger');
        i.title = "Supprimer";
        i.style.cursor = "pointer";
        i.onclick = () => confirmer(() => supprimer(j, element));
        td.appendChild(i);

        // colonne sauvegarde
        tr.insertCell().innerText = element;
    }
}


// suppression du fichier de sauvegarde
// l'identifiant de la ligne est aussi transmis afin de pouvoir supprimer cette dernière sur l'interface en cas de succès
function supprimer(j, fichier) {
    $.ajax({
        url: 'ajax/supprimer.php',
        method: 'post',
        data: {nomFichier: fichier},
        dataType: "json",
        success: (data) => {
            if (data.success) {
                $('#' + j).remove();
            } else {
                for (const key in data.error) {
                    const message = data.error[key];
                    if (key === 'system') {
                        afficherErreur('Une erreur inattendue est survenue');
                    } else {
                        msg.innerHTML = genererMessage(message, 'rouge');
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

// Lorsqu'on clique sur "Supprimer"
btnSupprimerTous.onclick = () => {
    modal.style.display = 'flex';
};

// Si l'utilisateur confirme
btnConfirmer.onclick = () => {
    modal.style.display = 'none';
    // rediriger vers la page de suppression par un appel direct du script vider.php
    window.location.href = "vider.php";
};

// Si l'utilisateur annule
btnAnnuler.onclick = () => {
    modal.style.display = 'none';
};