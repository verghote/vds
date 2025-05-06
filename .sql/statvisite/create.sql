SET default_storage_engine = InnoDb;

use vds;

drop table if exists statvisite;

CREATE TABLE statvisite (
    date      date  primary key,
    nb        int  not null default 1
);

