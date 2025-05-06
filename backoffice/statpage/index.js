"use strict";

/* global data, date, Tabulator */

// récupération des élements sur l'interface

if (data.length === 0) {
    document.getElementById("btnExporter").style.visibility = 'visible';
}

// Création du tableau
const table = new Tabulator("#table", {
    data: data,
    layout: "fitDataFill",
    movableColumns: true,
    responsiveLayout: "collapse", // 🧩 comportement mobile
    columns: [
        {
            title: "Nom",
            field: "nom",
            headerSort: true,
            widthGrow: 1, // ✅ Prend tout l’espace restant
        },
        {
            title: "Nombre",
            field: "nb",
            hozAlign: "center",
            headerSort: true,
            width: 100,
        },
    ],
    pagination: false,
});

// Export CSV
document.getElementById("btnExporter").addEventListener("click", () => {
    table.download("csv", "page visitées au " + date + ".csv");
});

