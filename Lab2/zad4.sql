create table buildings (
	id int primary key,
	geom geometry,
	name varchar
);
create table roads (
	id int primary key,
	geom geometry,
	name varchar
);
create table poi (
	id int primary key,
	geom geometry,
	name varchar(255)
);