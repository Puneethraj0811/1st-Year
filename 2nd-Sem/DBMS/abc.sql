DELIMITER //

create procedure abc(cname varchar(20))

begin

select No_of_voters from CONSTITUENCY where const_name=cname;

end //

DELIMITER ;
