SET default_storage_engine = InnoDb;

use vds;

drop table if exists password;

create table password
(
    login varchar(50)  not null,
    password varchar(64) not null,
    date  dateTime     not null default current_timestamp,
    primary key (login, password),
    foreign key (login) references membre (login) on delete cascade
);


