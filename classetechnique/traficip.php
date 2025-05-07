<?php
declare(strict_types=1);

/**
 * Classe TraficIp
 *
 * Gère l'enregistrement et la surveillance des requêtes HTTP par adresse IP.
 * Permet de détecter un comportement abusif (requêtes répétées dans un court délai).
 *
 * ⚠️ L'appelant reste responsable du blocage ou du traitement de l'alerte.
 *
 * @author Guy Verghote
 * @version 2025.2
 * @date 05/05/2025
 */
class TraficIp
{
    /** Seuil maximal de requêtes autorisées par IP dans la fenêtre d’observation */
    private const QUOTA = 10;

    /** Durée (en secondes) de la fenêtre glissante pour comptabiliser les requêtes */
    private const DUREE_FENETRE = 5;

    /** Durée de rétention (en seconde) des traces avant purge */
    private const DUREE_CONSERVATION = 600; // 1 heure


    /**
     * Retourne l'historique complet du trafic IP.
     *
     * @return array<int, array{ip: string, horodatage: string, url: string}>
     *     Liste chronologique décroissante des requêtes enregistrées.
     */
    public static function getAll(): array
    {
        $sql = <<<SQL
            SELECT ip, horodatage, url
            FROM traficip
            ORDER BY horodatage DESC;
SQL;

        $select = new Select();
        return $select->getRows($sql);
    }

    /**
     * Enregistre une requête pour une IP, et détecte un comportement anormal.
     *
     * @param string $ip Adresse IP de l’appelant
     * @return bool true si l’IP dépasse le seuil autorisé, false sinon
     */
    public static function ajouter(string $ip): bool
    {
            self::purgerSiNecessaire();
            self::enregistrerRequete($ip);
            if (self::estSuspect($ip)) {
                Journal::enregistrer("Plus de " . self::QUOTA . " requêtes en moins de " . self::DUREE_FENETRE . " secondes", 'menace');
                return true;
            }
            return false;
    }

    /**
     * Enregistre l'appel de l'IP courante dans la base.
     *
     * @param string $ip Adresse IP appelante
     * @return void
     */
    private static function enregistrerRequete(string $ip): void
    {
        $db = Database::getInstance();
        $curseur = $db->prepare("INSERT INTO traficip(ip, url) VALUES (:ip, :url);");
        $curseur->bindParam(':ip', $ip);
        $curseur->bindParam(':url', $_SERVER['REQUEST_URI']);
        $curseur->execute();
    }

    /**
     * Vérifie si l’IP dépasse le seuil de requêtes autorisées dans la fenêtre temporelle.
     *
     * @param string $ip
     * @return bool true si seuil dépassé
     */
    private static function estSuspect(string $ip): bool
    {
        $sql = <<<SQL
            SELECT COUNT(*) AS nb
            FROM traficip
            WHERE ip = :ip
              AND horodatage > NOW() - INTERVAL :fenetre SECOND
SQL;

        $select = new Select();
        $lesParametres = [
            'ip' => $ip,
            'fenetre' => self::DUREE_FENETRE
        ];

        $nb = (int)$select->getValue($sql, $lesParametres);
        return $nb > self::QUOTA;
    }

    /**
     * Supprime les entrées trop anciennes pour limiter la taille de la table.
     *
     * @return void
     */
    private static function purger(): void
    {
        $sql = "delete from traficip where horodatage < now() - interval " . self::DUREE_CONSERVATION . " second";
        Database::getInstance()->exec($sql);
    }

    /**
     * Purge les entrées anciennes si la dernière purge remonte à plus d'une heure.
     *
     * @return void
     */
    private static function purgerSiNecessaire(): void
    {
        $fichier = __DIR__ . '/.derniere_purge';
        // Vérifier la date de dernière purge (le fichier n'existe pas au premier appel)
        $dernier = file_exists($fichier) ? filemtime($fichier) : 0;

        // Si la durée de conservation est dépassée, purger les anciennes entrées
        if ((time() - $dernier) > self::DUREE_CONSERVATION) {
            self::purger();
            @touch($fichier); // Met à jour le timestamp du fichier
        }
    }
}
