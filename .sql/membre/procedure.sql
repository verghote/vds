use vds;

drop procedure if exists enregistrerConnexion;

create procedure enregistrerConnexion(_id int) sql security definer
begin
    update membre
    set nbConnexion = nbConnexion + 1
    where id = _id;
end


