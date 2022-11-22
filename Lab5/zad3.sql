-- Musimy domknać łamaną

update obiekty 
set geometry = ST_MakePolygon(ST_MakeLine(ST_LineMerge(geometry), ST_PointN(ST_LineMerge(geometry), 1)))
where name='obiekt4';