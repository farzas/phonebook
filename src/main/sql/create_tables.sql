drop table if exists contact_group;
drop table if exists CONTACT;
drop table if exists GROUP1;
create table CONTACT (contact_id integer not null auto_increment, city varchar(255), country varchar(255), email varchar(255), name varchar(255), phone_number bigint, state varchar(255), street varchar(255), zip integer, primary key (contact_id));
/* The name is given as GROUP1 since GROUP is a keyword*/
create table GROUP1 (group_id integer not null auto_increment, name varchar(255), primary key (group_id));
create table contact_group (group_id integer not null, contact_id integer not null);
alter table contact_group add constraint FK_CONTACT foreign key (contact_id) references CONTACT (contact_id);
alter table contact_group add constraint FK_GROUP foreign key (group_id) references GROUP1 (group_id);
