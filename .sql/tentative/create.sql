SET default_storage_engine = InnoDb;

use vds;

drop table if exists tentative;

create table tentative
(
    id       int auto_increment primary key,
    date     datetime    not null default now(),
    ip       varchar(50) not null,
    login    varchar(30) not null,
    password varchar(50) not null
)

