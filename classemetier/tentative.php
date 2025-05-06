<?php
declare(strict_types=1);

class Tentative
{
    /**
     * Enregistre une tentative de connexion infructueuse
     * @param string $login
     * @param string $password
     */
    public static function enregistrer(string $login, string $password): void
    {
        // récupération de l'adresse IP
        $ip = Journal::getIp();
        // enregistrement de la tentative
        try {
            $sql = <<<EOD
            insert into tentative(login, password, ip) 
            values (:login, :password, '$ip');
EOD;
            $db = Database::getInstance();
            $curseur = $db->prepare($sql);
            $curseur->bindParam('login', $login);
            $curseur->bindParam('password', $password);
            $curseur->execute();
        } catch (Exception $e) {
            Erreur::envoyerReponse($e->getMessage());
        }
        // récupération du nombre de tentatives dans les 10 dernières minutes
        $nbTentative = self::getNb($login);
        // si le nombre de tentatives est supérieur ou égal à 5, on envoie une réponse qui am_ne le visiteur ver sune page d'erreur
        if ($nbTentative >= 5) {
            $_SESSION['erreur']['message'] = 'Trop de tentatives de connexion, veuillez attendre 10 minutes avant une nouvelle tentative';
            $reponse = ['success' => '/erreur'];
            echo json_encode($reponse, JSON_UNESCAPED_UNICODE);
            exit;
        }
        // sinon, on envoie une réponse qui informe le visiteur du nombre de tentatives restantes
        $msg = "Nom d’utilisateur et/ou mot de passe incorrect.";
        $msg .= " Il vous reste ";
        $msg .= $nbTentative === 4 ? "une seule tentative !" : (5 - $nbTentative) . " tentatives.";
        Erreur::envoyerReponse($msg, 'global');
    }

    /**
     * Retourne le nombre de tentatives de connexion infructueuses pour un login et une adresse ip
     * @param string $login
     * @return int
     */
    public
    static function getNb(string $login = ''): int
    {
        // Récupération de l'adresse IP
        $ip = Journal::getIp();
        $sql = <<<EOD
            Select count(*) from tentative
            where ( login = :login or ip = :ip)
              and  date > now() - interval 10 minute;  
EOD;
        $select = new Select();
        return $select->getValue($sql, ['login' => $login, 'ip' => $ip]);
    }

    public static function getTempsAttenteRestant(): int
    {
        // Récupération de l'adresse IP
        $ip = Journal::getIp();

        // SQL pour obtenir la date de la dernière tentative
        $sql = <<<EOD
        SELECT MAX(date) as derniere_tentative
        FROM tentative
        WHERE ip = :ip
          AND date > NOW() - INTERVAL 10 MINUTE;
EOD;
        $select = new Select();
        $derniereTentative = $select->getValue($sql, ['ip' => $ip]);

        // Si aucune tentative récente n'est trouvée, retourner 0
        if (!$derniereTentative) {
            return 0;
        }

        // Calculer le temps écoulé depuis la dernière tentative
        $tempsEcoule = time() - strtotime($derniereTentative);

        // Calculer le temps restant en secondes (10 minutes = 600 secondes)
        $tempsRestantSecondes = max(600 - $tempsEcoule, 0);

        // Convertir en minutes et arrondir au supérieur
        return intval($tempsRestantSecondes / 60) + 1;
    }
}