select st_area(st_buffer(st_shortestline((select geometry from obiekty where name='obiekt3'),
										(select geometry from obiekty where name='obiekt4')), 5));