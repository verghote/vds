<?php
/**
 * Classe StatVisite
 *
 * Gère les statistiques de visites quotidiennes sur le site, avec détection des robots.
 * Requiert la table SQL suivante :
 *   CREATE TABLE statvisite (
 *       date DATE PRIMARY KEY,
 *       nb INT NOT NULL DEFAULT 1
 *   );
 *
 * @author Guy Verghote
 * @version 2025.1
 * @date 05/05/2025
 */
class StatVisite
{
     /**
     * Récupère toutes les visites par jour, triées par date décroissante
     *
     * @return array[] tableau associatif indexé, chaque entrée contient :
     *   - 'date'    => string (format YYYY-MM-DD)
     *   - 'dateFr'  => string (format JJ/MM/AAAA)
     *   - 'nb'      => int (nombre de visites ce jour-là)
     */
    public static function getAll(): array
    {
        $sql = <<<SQL
            SELECT date, DATE_FORMAT(date, '%d/%m/%Y') AS dateFr, nb
            FROM statvisite
            ORDER BY date DESC
SQL;
        $select = new Select();
        return $select->getRows($sql);
    }

    /**
     * Retourne les statistiques globales (max, min, moyenne, total)
     *
     * @return array tableau associatif :
     *   - 'max'      => int (maximum de visites sur un jour)
     *   - 'min'      => int (minimum de visites sur un jour)
     *   - 'moyenne'  => int (moyenne arrondie des visites par jour)
     *  - 'total'     => int (total cumulé des visites)
     */
    public static function getStat(): array
    {
        $sql = <<<SQL
            select max(nb) as max, min(nb) as min, ceiling(avg(nb)) as moyenne, sum(nb) as total
            from statvisite
SQL;
        $select = new Select();
        return $select->getRow($sql);
    }

    /**
     * Comptabilise une visite humaine unique par session
     * N'incrémente pas si l'utilisateur est déjà comptabilisé ou s'il s'agit d'un robot
     *
     * @return void
     */
    public static function comptabiliser(): void
    {
        // Vérifie qu'on n'a pas déjà compté ce visiteur ET qu'il n'est pas un robot
        if (!isset($_SESSION['visiteur']) && !ClientHttp::estUnRobot()) {
            $_SESSION['visiteur'] = true; // Marqueur de visite comptée

            $db = Database::getInstance();
            $aujourdhui = date('Y-m-d');

            // Incrémentation atomique : insère une nouvelle ligne ou incrémente si elle existe
            $sql = <<<SQL
                insert into statvisite (date, nb)
                values (:date, 1)
                on duplicate key update nb = nb + 1
SQL;
            $curseur = $db->prepare($sql);
            $curseur->execute([':date' => $aujourdhui]);
        }
    }
}
