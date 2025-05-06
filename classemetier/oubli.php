<?php
declare(strict_types=1);

class Oubli
{
    /**
     * Supprime les enregistrements de plus de 60 minutes
     */
    public static function supprimerAncienne()
    {
        $sql = <<<EOD
                delete from oubli 
                where date < now() - interval 5 minute
EOD;
        $db = Database::getInstance();
        try {
            $db->exec($sql);
        } catch (Exception $e) {
            Erreur::envoyerReponse($e->getMessage());
        }
    }

    /**
     * Vérifie si un compte est en attente de réinitialisation
     * @param string $login
     * @return bool
     */
    public static function verifier($login)
    {
        $sql = <<<EOD
            SELECT 1
            FROM oubli
            Where login = :login
EOD;
        $select = new Select();
        $ligne = $select->getRow($sql, ['login' => $login]);
        return $ligne ? true : false;
    }


    /**
     * Ajoute un enregistrement dans la table oubli et retourne le token généré
     * @param string $login
     */
    public static function enregistrer(string $login)
    {
        try {
            $token = bin2hex(openssl_random_pseudo_bytes(30));
            $sql = <<<EOD
            insert into oubli (token, date, login) values
                (:token, now(), :login);    
EOD;
            $db = Database::getInstance();
            $curseur = $db->prepare($sql);
            $curseur->bindParam('token', $token);
            $curseur->bindParam('login', $login);
            $curseur->execute();
            return $token;
        } catch (Exception $e) {
            Erreur::envoyerReponse($e->getMessage());
        }
    }

    /**
     * Vérifie si un token existe et retourne le login associé et si la demande est encore valide
     * @param string $token
     * @return array|false
     */
    public static function getByToken(string $token) : array|false
    {
        $sql = <<<EOD
            SELECT login, if(date + interval 30 minute > now(), true, false) as valide
            FROM oubli
            WHERE token = :token
EOD;
        $db = Database::getInstance();
        $curseur = $db->prepare($sql);
        $curseur->bindParam('token', $token);
        $curseur->execute();
        $ligne = $curseur->fetch();
        $curseur->closeCursor();
        return $ligne;
    }

    /**
     * Supprime un enregistrement
     * @param string $login
     */
    public static function supprimer(string $login) : void
    {
        try {
            $sql = <<<EOD
            DELETE FROM oubli 
            WHERE login = :login; 
EOD;
            $db = Database::getInstance();
            $curseur = $db->prepare($sql);
            $curseur->bindParam('login', $login);
            $curseur->execute();
        } catch (Exception $e) {
            Erreur::envoyerReponse($e->getMessage());
        }
    }
}