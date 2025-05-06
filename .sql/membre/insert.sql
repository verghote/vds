use vds;

set foreign_key_checks = 0;

delete from membre;

alter table membre auto_increment = 1;

insert into membre (nom, prenom, email)
values ('VERGHOTE', 'GUY', 'guy.verghote@saint-remi.net'),
       ('BERNARD', 'JULIEN',  'julien.bernard@saint-remi.net'),
       ('CARON', 'ADAM', 'adam.caron@saint-remi.net'),
       ('BOULARBI', 'MEDDHY',  'meddhy.boularbi@saint-remi.net'),
       ('CHARKAOUI', 'RAYANE',  'rayane.charkaoui@saint-remi.net'),
       ('CHASTAGNER', 'ARTHUR',  'arthur.chastagner@saint-remi.net'),
       ('COULON', 'ALEXANDRE',  'alexandre.coulon@saint-remi.net' ),
       ('DUBOIS', 'ALEXANDRE',  'alexandre.dubois@saint-remi.net'),
       ('JOSSE', 'THOMAS',  'thomas.josse@saint-remi.net'),
       ('LE CANU', 'MATHIS',  'mathis.le-canu@saint-remi.net'),
       ('LION', 'ZIGGY',  'ziggy.lion@saint-remi.net'),
       ('LONGBY', 'RENEDI',  'renedi.longby@saint-remi.net'),
       ('LOURDEL', 'MATHIS',  'mathis.lourdel@saint-remi.net'),
       ('MORALES', 'SIMON',  'simon.morales@saint-remi.net'),
       ('NEDELEC', 'FLORE', 'flore.nedelec@saint-remi.net'),
       ('PARIS', 'THOMAS',  'thomas.paris@saint-remi.net'),
       ('RICHARD', 'TONNY',  'tonny.richard@saint-remi.net'),
       ('RICHARD', 'TOM',  'tom.richard@saint-remi.net'),
       ('ROELENS', 'GABRIEL',  'gabriel.roelens@saint-remi.net'),
       ('SOUKTANI', 'LEO',  'leo.souktani@saint-remi.net'),
       ('SUBERU', 'MOUBARAK',  'moubarak.suberu@saint-remi.net'),
       ('TISON', 'CLAIRE',  'claire.tison@saint-remi.net');

update membre set login = 'admin', password = sha2('Admin123!', 256) where id = 1;
-- update membre set login = 'admin', password = sha2('1111', 256) where id = 1;
update membre set login = 'admin', password = sha2('Test.000', 256) where id = 1;

Select * from membre;