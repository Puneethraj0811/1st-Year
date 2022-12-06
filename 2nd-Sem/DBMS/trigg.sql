DELIMITER $$

create trigger trigg

after insert on VOTER for each row

begin

update CONSTITUENCY set CONSTITUENCY.No_of_voters=CONSTITUENCY.No_of_voters+10
where const_id=new.const_id;

end$$
