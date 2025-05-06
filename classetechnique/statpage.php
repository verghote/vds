<?php
/**
 * Classe permettant de gérer les visites journalières
 * Nécessite la création de la table statpage(nom varchar(150), nb int)
 * @Author : Guy Verghote
 * @Version : 2025.1
 * @Date : 05/05/2025
 */

class StatPage
{
    /**
     * Récupère toutes les visites par jour, triées par date décroissante
     *
     * @return array[] tableau associatif indexé, chaque entrée contient :
     *   - 'nom'    => string (format YYYY-MM-DD)
     *   - 'nb'      => int (nombre de visites sur cette page)
     */
    public static function getAll(): array
    {
        $sql = <<<SQL
            SELECT nom, nb
            FROM statpage
            ORDER BY nom
SQL;
        $select = new Select();
        return $select->getRows($sql);
    }

    /**
     * Comptabiliser la visite d'une page dans la table statpage
     * seul le nom de la page est pris en compte sans les paramètres éventuels
     */
    public static function comptabiliser(): void
    {
        // récupération du nom de la page
        $nom = $_SERVER['REQUEST_URI'];
        if (!isset($_SESSION['page'][$nom])) {
            $_SESSION['page'][$nom] = true;
            $db = Database::getInstance();
            $sql = <<<SQL
                insert into statpage (nom, nb)
                values (:nom, 1)
                on duplicate key update nb = nb + 1
SQL;
            $curseur = $db->prepare($sql);
            $curseur->bindParam(':nom', $nom, PDO::PARAM_STR);
            $curseur->execute();
        }
    }

}
