"use strict";

/* global data, Tabulator */

import {
    afficherCompteur,
} from "https://verghote.github.io/composant/fonction.js";


// récupération des élements sur l'interface
const btnSupprimer = document.getElementById('btnSupprimer');
const modal = document.getElementById('confirmationModal');
const btnConfirmer = document.getElementById('btnConfirmerSuppression');
const btnAnnuler = document.getElementById('btnAnnulerSuppression');

// Initialisation du composant Tabulator
let options = {
    data: data, // Données existantes
    layout: "fitColumns", // Les colonnes s'ajustent à la largeur du conteneur
    movableColumns: true, // Permet de réorganiser les colonnes par glisser-déposer

    columns: [
        {
            title: "Horodatage",
            field: "horodatage",
            sorter: "datetime",
            maxWidth: 180,
            hozAlign: "left"
        },
        {
            title: "IP",
            field: "ip",
            editor: "input",
            maxWidth: 300,
            hozAlign: "left"
        },
        {
            title: "Url",
            field: "url",
            hozAlign: "left",
            widthGrow: 1 // ✅ Occupe tout l’espace restant
        }
    ]
};

let table = new Tabulator("#table", options);

afficherCompteur(document.getElementById('compteur'), data.length,3000);

// Lorsqu'on clique sur "Supprimer"
btnSupprimer.onclick = () => {
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


