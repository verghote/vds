"use strict";

/* global data, Tabulator */

import {
    afficherCompteur,
    afficherErreur, ajax
} from "https://verghote.github.io/composant/fonction.min.js";

// récupération des élements sur l'interface
let journal = document.getElementById('journal');
let btnSupprimer = document.getElementById('btnSupprimer');
let btnExporter = document.getElementById('btnExporter'); // bouton pour export CSV
const modal = document.getElementById('confirmationModal');
const btnConfirmer = document.getElementById('btnConfirmerSuppression');
const btnAnnuler = document.getElementById('btnAnnulerSuppression');

let table = null; // instance Tabulator

// Alimentation de la liste des journaux
for (let cle in data) {
    let option = document.createElement('option');
    option.value = cle;
    option.innerText = data[cle];
    journal.appendChild(option);
}

journal.onchange = () => getLeJournal(journal.value);

btnExporter.onclick = () => {
    if (table) {
        table.download("csv", journal.value + ".csv");
    }
};

// Chargement initial
getLeJournal(journal.value);

function getLeJournal(nom) {
    ajax({
        url: 'ajax/afficher.php',
        method: 'POST',
        data: { journal: nom },
        dataType: "json",
        success: function (data) {
            if (data.error) {
                for (const id in data.error) {
                    const message = data.error[id];
                    if (id === 'system') {
                        afficherErreur('une erreur inattendue est survenue');
                    } else if (id === 'global') {
                        afficherErreur(message);
                    }
                }
            } else {
                // document.getElementById('compteur').innerText = data.length + " enregistrements";
                afficherCompteur(document.getElementById('compteur'), data.length, 3000, '20px');
                afficherTableau(data);
            }
        },
        error: reponse => {
            afficherErreur('Une erreur imprévue est survenue');
            console.log(reponse.responseText);
        }
    });
}

function afficherTableau(data) {
    // Conversion : tableau de tableaux → tableau d’objets pour Tabulator
    const donnees = data.map(ligne => ({
        date: ligne[0],
        evenement: ligne[1],
        url: ligne[2],
        ip: ligne[3],
    }));

    if (table) {
        table.replaceData(donnees);
        return;
    }

    table = new Tabulator("#table", {
        data: donnees,
        layout: "fitColumns", // ✅ Utilise toute la largeur disponible
        movableColumns: true,
        columns: [
            {
                title: "Date",
                field: "date",
                sorter: "datetime",
                width: 150, // ✅ Largeur fixe
            },
            {
                title: "Événement",
                field: "evenement",
                widthGrow: 1, // ✅ Prend tout l’espace restant
            },
            {
                title: "URL",
                field: "url",
                widthGrow: 1, // ✅ Prend tout l’espace restant
            },
            {
                title: "IP",
                field: "ip",
                width: 300 // ✅ Largeur fixe
            }
        ],
        pagination: false,
    });
}

// Lorsqu'on clique sur "Vider le journal"
btnSupprimer.onclick = () => {
    modal.style.display = 'flex';
};

// Si l'utilisateur confirme
btnConfirmer.onclick = () => {
    modal.style.display = 'none';
    // rediriger vers la page de suppression du journal par un appel direct du script vider.php
    window.location.href = "vider.php?journal=" + journal.value;
};

// Si l'utilisateur annule
btnAnnuler.onclick = () => {
    modal.style.display = 'none';
};