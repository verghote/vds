"use strict";

import {
    afficherCompteur,
} from "https://verghote.github.io/composant/fonction.js";


/* global data, stat, date, Tabulator*/

// alimentation des stats
afficherCompteur(document.getElementById('max'), stat.max);
afficherCompteur(document.getElementById('min'), stat.min);
afficherCompteur(document.getElementById('moyenne'),stat.moyenne);
afficherCompteur(document.getElementById('total'), stat.total);

// Création du tableau
const table = new Tabulator("#table", {
    data: data,
    layout: "fitColumns", // 🧩 adapte la largeur des colonnes à la largeur dispo
    movableColumns: true,
    responsiveLayout: "collapse", // 🧩 comportement mobile
    columns: [
        {
            title: "Date",
            field: "dateFr",
            sorter: "datetime",
            hozAlign: "center",
            headerHozAlign: "center",
            headerSort: true,
        },
        {
            title: "Nombre",
            field: "nb",
            hozAlign: "center",
            headerHozAlign: "center",
            headerSort: true
        },
    ],
    pagination: true, // active la pagination
    paginationSize: 10, // taille de page initiale
    paginationSizeSelector: [10, 50, 100], // options de taille de page
});

// Export CSV
document.getElementById("btnExporter").addEventListener("click", () => {
    table.download("csv", "statistiques au " + date + ".csv");
});



