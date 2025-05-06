<?php
declare(strict_types=1);

// définition de la table membre : id, login, password, nom, prenom, email, telephone, photo, autMail

class Membre extends Table
{
    public function __construct()
    {
        parent::__construct('membre');

        // seuls les colonnes pouvant être modifiées par l'administrateur sont définies

        // nom
        $input = new inputText();
        $input->Require = true;
        $input->Casse = 'U';
        $input->SupprimerAccent = true;
        $input->SupprimerEspaceSuperflu = true;
        $input->Pattern = "^[A-Z]( ?[A-Z]+)*$";
        $input->MaxLength = 30;
        $this->columns['nom'] = $input;

        // prenom
        $input = new inputText();
        $input->Require = true;
        $input->Casse = 'U';
        $input->SupprimerAccent = true;
        $input->SupprimerEspaceSuperflu = true;
        $input->Pattern = "^[A-Z]( ?[A-Z]+)*$";
        $input->MaxLength = 30;
        $this->columns['prenom'] = $input;

        //  email
        $input = new inputEmail();
        $input->Require = true;
        $input->MaxLength = 100;
        $this->columns['email'] = $input;
    }

    // ------------------------------------------------------------------------------------------------
    // Méthodes statiques relatives aux opérations de consultation
    // ------------------------------------------------------------------------------------------------

    public static function getAll(): array
    {
        // Récupération des paramètres du téléversement
        $sql = <<<EOD
        Select id, concat(nom, ' ' , prenom) as nomPrenom, nom, prenom, email, 
               ifnull(photo, 'Non renseignée') as photo,  login,
               if(autMail, 'Oui', 'Non') as afficherMail,  
               ifnull(telephone, 'Non renseigné') as telephone,
               if(SHA2('0000', 256) = password, '0000', 'Modifié') as password
        From membre
        Order by nom, prenom;
EOD;
        $select = new Select();
        return $select->getRows($sql);
    }

    /**
     * Récupère les membres pour affichage dans l'annuaire
     * @return array
     */
    public static function getLesMembres(): array
    {
        // Récupération des paramètres du téléversement
        $lesParametres = require RACINE . '/.config/membre.php';
        $repertoire = $lesParametres['repertoire'];
        $sql = <<<EOD
        Select nom, prenom,  
        if(autMail, email, 'Non communiqué') as mail,  
        ifnull(telephone, 'Non renseigné') as telephone,
        ifnull(photo, 'Non renseignée') as photo 
        From membre
        order by nom, prenom;
EOD;
        $select = new Select();
        $lesLignes = $select->getRows($sql);
        // vérification de l'existence des photos sinon elle est remplacée par la photo par défaut selon le sexe
        for ($i = 0; $i < count($lesLignes); $i++) {
            if ($lesLignes[$i]['photo'] !== "Non renseignée") {
                $lesLignes[$i]['photo'] = $repertoire . '/' . $lesLignes[$i]['photo'];
            } else {
                $lesLignes[$i]['photo'] = "Photo non trouvée";
            }
        }
        return $lesLignes;
    }

    /**
     * Récupère les données d'un membre à partir de son login
     * @param string $login
     * @return array|false*
     */
    public static function getByLogin(string $login)
    {
        $sql = <<<EOD
            Select id, login, email, nom, prenom
            from membre 
            where login = :login;
EOD;
        $select = new Select();
        return $select->getRow($sql, ['login' => $login]);
    }

    /**
     * Récupère les données d'un membre à partir de son id
     * @param int $id
     * @return array|false
     */
    public static function getById($id)
    {
        $sql = <<<EOD
             Select id, nom, prenom, email, login, telephone, autMail
             From membre
             where id = :id;
EOD;
        $select = new Select();
        return $select->getRow($sql, ['id' => $id]);
    }

    /**
     *  Récupère la photo d'un utilisateur
     * @param int $id
     * @return string|null
     */
    public static function getPhoto(int $id): string|null
    {
        $lesParametres = require RACINE . '/.config/membre.php';
        $repertoire = $lesParametres['repertoire'];
        $sql = <<<EOD
        Select photo
        from membre 
        where id = :id;
EOD;
        $select = new Select();
        $photo = $select->getValue($sql, ['id' => $id]);
        if ($photo && file_exists(RACINE . $repertoire . '/' . $photo)) {
            return $repertoire . '/' . $photo;
        } else {
            return null;
        }
    }

    /**
     *  Modifie la photo d'un utilisateur
     * @param int $id
     * @param string $nomFichier
     * @return void
     */
    public static function modifierPhoto(int $id, string $nomFichier): void
    {
        try {
            $sql = <<<EOD
            update membre 
            set photo = :nomFichier
            where id = :id
EOD;
            $db = Database::getInstance();
            $curseur = $db->prepare($sql);
            $curseur->bindValue('id', $id);
            $curseur->bindValue('nomFichier', $nomFichier);
            $curseur->execute();
        } catch (Exception $e) {
            Erreur::envoyerReponse($e->getMessage());
        }
    }

    /**
     *   Supprime la photo d'un utilisateur : remettre la photo par défaut
     * @param int $id
     * @return void
     */
    public static function supprimerPhoto(int $id): void
    {
        try {
            $sql = <<<EOD
                update membre 
                set photo = null
                where id = :id; 
EOD;
            $db = Database::getInstance();
            $curseur = $db->prepare($sql);
            $curseur->bindValue('id', $id);
            $curseur->execute();
        } catch (Exception $e) {
            Erreur::envoyerReponse($e->getMessage());
        }
    }

    /**
     * Modifie le mot de passe d'un utilisateur
     * @param string $login
     * @param $password
     * @return void
     */
    public static function modifierPassword(string $login, string $password): void
    {
        try {
            // Chiffrement du mot de passe
            $hash = password_hash($password, PASSWORD_DEFAULT);
            // enregistrement et archivage du nouveau mot de passe
            $db = Database::getInstance();
            $sql = <<<EOD
            Update membre 
            Set password = :password  
            Where login = :login;
EOD;
            $curseur = $db->prepare($sql);
            $curseur->bindValue('login', $login);
            $curseur->bindValue('password', $hash);
            $curseur->execute();
        } catch (Exception $e) {
            Erreur::envoyerReponse($e->getMessage());
        }
    }

    /**
     *  Modifie l'email d'un utilisateur
     * @param int $id
     * @param $email
     * @return void
     */
    public static function modifierEmail(int $id, string $email): void
    {
        try {
            $db = Database::getInstance();
            $sql = <<<EOD
                Update membre 
                Set email = :email  
                Where id = :id;
EOD;
            $curseur = $db->prepare($sql);
            $curseur->bindValue('id', $id);
            $curseur->bindValue('email', $email);
            $curseur->execute();
        } catch (Exception $e) {
            Erreur::envoyerReponse($e->getMessage());
        }
    }

    /**
     * Modifie les informations facultatives d'un utilisateur
     * @param int $id
     * @param string $telephone
     * @param int $autorisation
     * @return void
     */
    public static function modifierProfil(int $id, string $telephone, int $autorisation): void
    {
        try {
            // génération de la requête
            $sql = "Update membre set ";
            $sql .= empty($telephone) ? " telephone = null" : " telephone = :telephone";
            $sql .= ", autMail = :autorisation ";
            $sql .= " where id = :id";
            $db = Database::getInstance();
            $curseur = $db->prepare($sql);
            $curseur->bindValue('id', $id);
            $curseur->bindValue('autorisation', $autorisation, PDO::PARAM_BOOL);
            if (!empty($telephone)) {
                $curseur->bindValue('telephone', $telephone);
            }
            $curseur->execute();
        } catch (Exception $e) {
            Erreur::envoyerReponse($e->getMessage());
        }
    }

    // ------------------------------------------------------------------------------------------------
    // Méthodes statiques relatives aux opérations liées à la connexion
    // ------------------------------------------------------------------------------------------------

    /**
     * Contrôle l'accès au répertoire courant pour l'administrateur connecté
     */
    public static function controlerAcces(): void
    {
        if (!isset($_SESSION['membre'])) {
            $_SESSION['url'] = $_SERVER['PHP_SELF'];
            header("location:/membre/connexion/");
            exit;
        }

        // vérification de la validité de la connexion
        if (time() - $_SESSION['membre']['debut'] > 10) {
            self::deconnexion();
            Erreur::envoyerReponse('Votre session a expiré, veuillez vous reconnecter.', 'global');
        } else {
            // actualisation de la connexion
            $_SESSION['membre']['debut'] = time();
        }
    }

    /**
     *  Vérifie si un password est correct
     * @param int $id
     * @param string $password
     * @return bool
     */
    public static function verifierPassword(int $id, string $password): bool
    {
        $sql = <<<EOD
                 Select password from membre 
                 where id = :id;
EOD;
        $select = new Select();
        $ligne = $select->getRow($sql, ['id' => $id]);
        if (!$ligne) {
            return false;
        }
        // Vérifier si c'est un hachage sha256 (mot de passe initial ou ancien mot de passe)
        if (strlen($ligne['password']) === 64) {
            if ($ligne['password'] === hash('sha256', $password)) {
                // c'est un mot de passe initial ou ancien mot de passe, il faut actualiser son empreinte
                $membre = self::getById($id);
                self::modifierPassword($membre['login'], $password);
                return true;
            } else {
                return false;
            }
        } else {
            // C'est un hash créé par password_hash
            return password_verify($password, $ligne['password']);
        }
    }

    /**
     * Connexion de l'utilisateur
     * @param array $membre
     * @param bool $permanente
     * @return void
     */
    public static function connexion(array $membre, bool $permanente = false): void
    {
        // mémorisation de la connexion dans une variable de session
        $_SESSION['membre'] = $membre;

        // horodatage de la connexion pour en limité la durée
        $_SESSION['membre']['debut'] = time();

        if ($permanente) {
            // création d'un cookie pour mémoriser la connexion
            $lesOptions = [
                'expires' => time() + 3600 * 24 * 7,
                'path' => '/',
                'secure' => false,
                'httponly' => false
            ];
            $valeur = hash('sha256', $membre['login'] . $membre['email'] . $_SERVER['HTTP_USER_AGENT']);
            setcookie('membre', $valeur, $lesOptions);
        }

        // incrémentation du nombre de connexions
        try {
            $db = Database::getInstance();
            $sql = <<<EOD
            Update membre   
                Set nbConnexion = nbConnexion + 1
            Where id = :id;
EOD;
            $curseur = $db->prepare($sql);
            $curseur->bindValue('id', $membre['id']);
            $curseur->execute();
        } catch (Exception $e) {
            Erreur::envoyerReponse($e->getMessage());
        }

        // traçabilite de la connexion
        $evenement = $membre['nom'] . ' ' . $membre['prenom'];
        Journal::enregistrer($evenement, 'connexion');
    }

    /**
     * Déconnexion de l'utilisateur
     * @return void
     */
    public static function deconnexion()
    {
        // supprimer le contenu du tableau $_SESSION
        session_unset();
        // supprimer le tableau $_SESSION
        session_destroy();

        // destruction du cookie membre s'il existe
        if (isset($_COOKIE['membre'])) {
            $lesOptions = [
                'expires' => time() - 1,
                'path' => '/',
                'secure' => false,
                'httponly' => false
            ];
            $valeur = '';
            setcookie('membre', $valeur, $lesOptions);
        }
    }

    /**
     * Connexion automatique de l'utilisateur si un cookie 'membre' existe
     * @return void
     */
    public static function connexionAutomatique(): void
    {
        // la connexion est-elle conservée dans un cookie 'membre' mais pas encore dans la session 'membre'
        if (isset($_COOKIE['membre']) && !isset($_SESSION['membre'])) {
            // récupération des données de l'utilisateur
            $sql = <<<EOD
            Select id, login, email, nom, prenom
            from membre 
            where sha2( concat(login, email, :agent), 256) = :token;
EOD;
            $select = new Select();
            // $membre = $select->getRow($sql, ['token' => $_COOKIE['membre']]);
            $membre = $select->getRow($sql, ['token' => $_COOKIE['membre'], 'agent' => $_SERVER['HTTP_USER_AGENT']]);

            // création de la variable de session si l'utilisateur existe
            if ($membre) {
                // connexion de l'utilisateur
                self::connexion($membre);
            } else {
                // supprimer le cookie Membre
                $lesOptions = [
                    'expires' => time() - 1,
                    'path' => '/',
                    'secure' => false,
                    'httponly' => false
                ];
                $valeur = '';
                setcookie('membre', $valeur, $lesOptions);
            }
        }
    }

    /**
     * Contrôle par L'API Have I Been Pwned
     * @param string $password
     * @return bool
     */
    public static function estUnMotDePasseCompromis(string $password): bool
    {
        // Calculer le hachage SHA-1 des 5 premiers caractères du mot de passe
        $hash_prefix = strtoupper(substr(hash('sha1', $password), 0, 5));

        // URL de la liste Have I Been Pwned
        $url = 'https://api.pwnedpasswords.com/range/' . $hash_prefix;

        // Récupérer les hachages SHA-1 correspondant aux 5 premiers caractères du mot de passe
        $response = file_get_contents($url);

        // Parcourir les hachages et vérifier si le hachage complet du mot de passe est présent dans la liste
        $hashes = explode("\n", $response);
        foreach ($hashes as $hash) {
            list($hash_suffix, $count) = explode(':', $hash);
            if (strtoupper(hash('sha1', $password)) === $hash_prefix . $hash_suffix) {
                // Le mot de passe a été divulgué $count fois
                return true;
            }
        }
        return false;
    }

    /**
     * Vérifie si le mot de passe a déjà été utilisé
     * @param string $login identifiant du membre
     * @param string $password
     * @return bool
     */
    public static function estUnAncienMotDePasse(string $login, string $password): bool
    {
        $sql = <<<EOD
            select password
            from password
            where login = :login
EOD;
        $select = new Select();
        $lesLignes = $select->getRows($sql, ['login' => $login]);
        // Vérifier si le hash du nouveau mot de passe correspond à l'un des anciens
        foreach ($lesLignes as $ligne) {
            if (password_verify($password, $ligne['password'])) {
                return true;
            }
        }
        return false;
    }

    /**
     * Génère un code aléatoire pour la réinitialisation du mot de passe
     * @param string $login
     * @param string $email
     */
    public static function envoyerCode(string $login, string $email): void
    {
        // Faut-il supprimer la session en cours ?
        if (isset($_SESSION['reset']) and (time() - $_SESSION['reset']['time'] > 300 or $_SESSION['reset']['login'] !== $login)) {
            unset($_SESSION['reset']);
        }

        if (!isset($_SESSION['reset'])) {
            // génération du code aléatoire
            $code = "";
            for ($i = 1; $i <= 6; $i++) {
                $code .= rand(0, 9);
            }

            // Création de la variable de session
            $_SESSION['reset'] = ['code' => $code, 'login' => $login, 'time' => time()];

            // envoi du mail
            $sujet = "Demande de réinitialisation de mot de passe sur le site de l'amicale du Val de Somme";
            $contenu = <<<EOD
    Bonjour
           <br> Nous avons reçu une demande de réinitialisation du mot de passe réalisée depuis notre site.
           
            <br>Votre code de confirmation se trouve ci-dessous, saisissez-le dans la fenêtre ouverte de votre navigateur et 
            indiquez votre nouveau de passe en le confirmant.
             <br>
            Votre code de confirmation  :  <strong>$code</strong>
            <br>
            Attention : ce code n'est valable que pendant 5 minutes.
            <br>  
            <br>Si vous n'avez pas fait cette demande, vous pouvez ignorer cet e-mail.
            <br><br>
            Cordialement
  <br>L'Amicale du Val de Somme
EOD;
            $mail = new Mail();
            $mail->envoyer($email, $sujet, $contenu);
        }
    }

    /**
     * Génère un code aléatoire pour la réinitialisation du mot de passe
     * @param string $login
     * @param string $code
     * @return string
     */
    public static function verifierCode(string $login, string $code): string
    {
        $reponse = 'ok';
        if (!isset($_SESSION['reset'])) {
            $reponse = 'La session a expiré, veuillez recommencer la procédure';
        } else if (time() - $_SESSION['reset']['time'] > 300) {
            $reponse = 'La durée de validité de ce code est dépassé, veuillez recommencer la procédure';
            unset($_SESSION['reset']);
        } else if ($_SESSION['reset']['login'] !== $login) {
            $reponse = "Nous n'avons aucune demande de réinitialisation concernant ce login";
        } else if ($_SESSION['reset']['code'] !== $code) {
            $reponse = 'Code de vérification incorrect';
        }
        return $reponse;
    }
}