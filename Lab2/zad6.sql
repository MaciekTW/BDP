select sum(st_length(geom)) 
from roads; 	
 	
select St_AsText(geom),ST_Area(geom),ST_Perimeter(geom) from buildings where name = 'BuildingA';


select name,ST_Area(geom) from buildings order by name;

select name,ST_Perimeter(geom) as perim from buildings order by perim limit 2;

select ST_Distance(poi.geom, buildings.geom) as dist from buildings cross join poi where poi.name = 'K' and buildings.name = 'BuildingC' order by dist DESC limit 1;

select st_area(st_difference(buildings1.geom, st_buffer(buildings2.geom, 0.5))) from buildings as buildings1, buildings as buildings2
where buildings1.name = 'BuildingC' and buildings2.name = 'BuildingB';

select buildings.name from buildings, roads
where roads.name = 'RoadX' and st_y(st_centroid(buildings.geom)) > st_y(st_centroid(roads.geom));

select st_area(st_symdifference(geom,  st_geomfromtext('POLYGON((4 7, 6 7, 6 8, 4 8, 4 7))'))) from buildings
where name = 'BuildingC';