set default_storage_engine = innodb;
SET NAMES utf8mb4 COLLATE utf8mb4_0900_ai_ci;

use vds;

set foreign_key_checks = 0;

drop table if exists membre;

create table membre
(
    id              int auto_increment primary key,
    login           varchar(50)  not null unique,
    password        varchar(64)  not null,
    nom             varchar(30)  not null,
    prenom          varchar(50)  not null,
    email           varchar(100) not null,
    telephone       varchar(10)  null,
    photo           varchar(100) null,
    autMail         tinyint(1)   not null default '0',
    unique (nom, prenom, email)
);

drop trigger if exists avantAjoutMembre;

create trigger avantAjoutMembre before insert on membre
    for each row
begin
    # déclaration des variables
    declare nb INT;
    declare nouveauLogin varchar(50);
    declare baseLogin varchar(50);
    declare msg varchar(255);

    # contrôle de la colonne id
    if new.id is null or new.id = 0 or new.id not regexp '^[0-9]+$' or exists (select 1 from membre where id = new.id) then
        set new.id = (select coalesce(max(id), 0) + 1 from membre);
    end if;

    -- Contrôle sur la colonne nom
    if new.nom is null then
        signal sqlstate '45000' set message_text = '#Le nom doit être renseigné';
    end if;

    set new.nom = ucase(new.nom);

    if char_length(new.nom) not between 3 and 30 then
        signal sqlstate '45000' set message_text = '#Le nom doit comporter entre 3 et 30 caractères';
    end if;

    if new.nom not regexp '^[A-Z]( ?[A-Z])*$' then
        set msg = concat('#Le nom ', new.nom, ' ne respecte pas le format attendu');
        signal sqlstate '45000' set message_text = msg;
    end if;

    -- Contrôle sur la colonne prenom
    if new.prenom is null then
        signal sqlstate '45000' set message_text = '#Le prénom doit être renseigné';
    end if;

    set new.prenom = ucase(new.prenom);

    if char_length(new.prenom) not between 3 and 30 then
        signal sqlstate '45000' set message_text = '#Le prénom doit comporter entre 3 et 30 caractères';
    end if;

    if new.prenom not regexp '^[A-Z]( ?[A-Z])*$' then
        set msg = concat('#Le prénom ', new.prenom, ' ne respecte pas le format attendu');
        signal sqlstate '45000' set message_text = msg;
    end if;

    -- Contrôle sur la colonne email
    if new.email is null then
        signal sqlstate '45000' set message_text = '#L\'email est obligatoire.';
    end if;
    if new.email not regexp '^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*[\.][a-zA-Z]{2,4}$' then
        set msg = concat('#L''email ne respecte pas le format attendu : ', new.email);
        signal sqlstate '45000' set message_text = msg;
    end if;

    -- Contrôle sur la colonne telephone si le champ est renseigné
    if new.telephone is not null then
        if new.telephone not regexp '^0(6|7)[0-9]{8}$' then
            set msg = concat('#Le numéro de téléphone portable ne respecte pas le format attendu : ', new.telephone);
            signal sqlstate '45000' set message_text = msg;
        end if;
    end if;

    -- Contrôle de l'unicité du triplet nom, prénom, email
    if exists (select 1 from membre where nom = new.nom and prenom = new.prenom and email = new.email) then
        signal sqlstate '45000' set message_text = '#Ce membre est déjà inscrit';
    end if;

    # création du login : première lettre du prénom suivie du nom en minuscules avec un suffixe en cas de doublon
    SET baseLogin = CONCAT(LOWER(LEFT(NEW.prenom, 1)), LOWER(replace(NEW.nom, ' ', '')));
    SET nouveauLogin = baseLogin;
    Set nb = 1;
    WHILE EXISTS (SELECT 1 FROM membre WHERE login = nouveauLogin) DO
            SET nouveauLogin = CONCAT(baseLogin, nb);
            SET nb = nb + 1;
        END WHILE;
    SET NEW.login = nouveauLogin;
    # initialisation du mot de passe par défaut : 0000
    SET NEW.password = SHA2('0000', 256);
end