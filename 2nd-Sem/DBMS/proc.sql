DELIMITER //

create procedure proc(IN voter_id varchar(10),
                      IN vname varchar(50),
                      IN age int(3),
                      IN const_id varchar(10), 
                      IN cand_id varchar(10))
begin

declare display_msg varchar(20);

if age>=18 then
	insert into VOTER(voter_id,vname,age,const_id,cand_id)values(voter_id,vname,age,const_id,cand_id);
	set display_msg="Row inserted";

else
	set display_msg="Voter not eligible";

end if;

select display_msg;

end //

DELIMITER ;
