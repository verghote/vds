use vds;

drop trigger if exists apresModificationMembre;

-- lorsque le mot de passe est modifié, l'ancien est conservé dans la table password

create trigger apresModificationMembre after update on membre
    for each row
    if new.password != old.password then
        insert into password (login, password) values (old.login, old.password);
    end if;

