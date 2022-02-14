-- delete the burt ruggles releases table if it exists
-- then recreate it with all the ruggles titles within the items table
-- add a new album names Apocalypse Cow
-- set the rating of every album to a 10
-- Jon Heintel 2/13/22

drop table if exists Burt_Ruggles_Releases;

create table Burt_Ruggles_Releases
	select title
	from items
	where artist = "Burt Ruggles"
    order by title asc;
    
insert into burt_ruggles_releases (
	title
)
values(
	'Apocalypse Cow'
);

alter table burt_ruggles_releases
add rating int;

update burt_ruggles_releases
set rating = 10;