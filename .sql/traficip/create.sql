set default_storage_engine = innodb;

use vds;

drop table if exists traficip;

create table traficip
(
    ip         varchar(50)  not null,
    horodatage timestamp    not null default current_timestamp,
    url        varchar(255) not null
);

-- Activer l'Event Scheduler
SET GLOBAL event_scheduler = ON;

-- Créer un événement pour nettoyer la table traficip toutes 30 jours
drop event if exists effacerTraficIp;

create event effacerTraficIp
    on schedule every 5 minute
    do
    delete
    from traficip
    where horodatage < now() - interval 5 minute;


