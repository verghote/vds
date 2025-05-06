use vds;

-- création de 60 jours de visites aléatoires
create procedure if not exists initVisite()
    sql security definer
begin
    declare i int default 0;
    declare date date;
    declare nb int;
    while i < 60
        do
            set date = curdate() - interval i day;
            set nb = floor(100 + rand() * (300 - 100 + 1));
            insert into statvisite(date, nb) values (date, nb);
            set i = i + 1;
        end while;
end;

delete from statvisite;

call initVisite();

select * from statvisite;
