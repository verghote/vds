SET default_storage_engine = InnoDb;

use vds;

drop table if exists oubli;

create table oubli
(
    login varchar(50) primary key,
    token varchar(255) not null unique,
    date  dateTime     not null default current_timestamp,
    foreign key (login) references membre (login) on delete cascade
);


