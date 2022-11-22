insert into obiekty values (7, ST_COLLECT(array[(select geometry from obiekty where name='obiekt3'),
												(select geometry from obiekty where name='obiekt4')]), 'obiekt7');