"use strict";

/* global lesClassements */

let detailClassement = document.getElementById('detailClassement');

// afficher les derniers classements pdf
for (const element of lesClassements) {
    let a = document.createElement('a');
    a.style.display = 'block';
    a.href = "/afficherclassement.php?id=" + element;
    a.innerText = '📑' + element;
    a.target = 'classement';
    detailClassement.appendChild(a);
}