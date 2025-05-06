SET default_storage_engine = InnoDb;

use vds;

drop table if exists statpage;


Create table statpage
(
    nom       varchar(150) primary key,
    nb        int  not null default 1
);
