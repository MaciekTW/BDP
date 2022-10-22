insert into buildings(id, geom, name)
values (1, 'POLYGON((8 4, 10.5 4, 10.5 1.5, 8 1.5, 8 4))', 'BuildingA'),
       (2, 'POLYGON((4 7, 6 7, 6 5, 4 5, 4 7))', 'BuildingB'),
       (3, 'POLYGON((3 8, 5 8, 5 6, 3 6, 3 8))', 'BuildingC'),
       (4, 'POLYGON((9 9, 10 9, 10 8, 9 8, 9 9))', 'BuildingD'),
       (5, 'POLYGON((1 2, 2 2, 2 1, 1 1, 1 2))', 'BuildingF');
       
      
insert into roads(id, geom, name)
VALUES (1, 'LINESTRING(0 4.5, 12 4.5)', 'RoadX'),
       (2, 'LINESTRING(7.5 10.5,7.5 0)', 'RoadY');
       

insert into poi(id, geom, name)
VALUES (1, 'POINT(1 3.5)', 'G'),
       (2, 'POINT(5.5 1.5)', 'H'),
       (3, 'POINT(9.5 6)', 'I'),
       (4, 'POINT(6 9.5)', 'K'),
       (5, 'POINT(6.5 6)', 'J');
       