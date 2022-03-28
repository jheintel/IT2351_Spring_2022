#delete tables I am attempting to create if they exist
drop table if exists committees;
drop table if exists members;
drop table if exists members_committees;

#create committees table with two columns
create table committees
(
	committee_id int primary key auto_increment,
    committee_name varchar(50) not null unique
);

#create members table with all associated columns
create table members
(
	member_id int primary key auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    address varchar(50),
    city varchar(50),
    state varchar(50),
    phone varchar(50)
);

#create a table that references the committes and members IDs
# and pairs them
create table members_committees
(
	member_id    int not null,
    committee_id int not null,
	constraint members_committees_fk_members
		foreign key (member_id)
			references members (member_id),
            
	constraint members_committees_fk_committees
		foreign key (committee_id)
			references committees (committee_id)
);
