-- zad 1 shp2pgsql -s 4326 C:\Users\ons22\Downloads\Cw3_Karlsruhe_Germany_Shapefile(1)\T2019_KAR_GERMANY\T2019_STREET_NODE.shp T2019_STREET_NODE | psql -U postgres -h localhost -p 5432 -d lab3


create view new_b as
(
select geom from t2019_kar_buildings 
except 
select geom from t2018_kar_buildings
);

select * from new_b;

--zad 2

create view new_p as (
select geom,type from t2019_kar_poi_table
except 
select geom, type from t2018_kar_poi_table
);

select count(new_p.geom), new_p.type
from new_p new_p 
join new_b new_b on st_contains(st_buffer(new_b.geom, 0.005), new_p.geom)
group by new_p.type

-- zad 3
create table streets_reprojected as
(select * from t2019_kar_streets);

select UpdateGeometrySRID('streets_reprojected','geom', 3068)

-- zad 4
create table input_points(id int, geom geometry, name varchar);

insert into input_points values (1, 'POINT(8.36093 49.03174)', 'A')
								,(2, 'POINT(8.39876 49.00644)', 'B')
								
-- zad 5
select UpdateGeometrySRID('input_points','geom', 3068)	

-- zad 6
select UpdateGeometrySRID('t2019_kar_street_node','geom', 3068)	

with distLower200 as(
select st_buffer(st_MakeLine(geom),0.002)
from input_points)

select streets.geom
from t2019_kar_street_node streets
join distLower200 dist on st_intersects(dist.st_buffer, streets.geom)

-- zad 7
create view sport_shops as (
select * 
from t2019_kar_poi_table
where type= 'Sporting Goods Store'
);

create view parks as (
select * 
from t2019_kar_land_use_a
where type like '%Park%'
);

select count(shops.geom)
from sport_shops shops
join parks parks on st_contains(st_buffer(parks.geom, 0.003), shops.geom)

--zad 8
select st_intersection(rail.geom, water.geom)
into t2019_kar_bridges
from t2019_kar_railways rail
join t2019_kar_water_lines water on st_intersects(rail.geom, water.geom);

select * from t2019_kar_bridges