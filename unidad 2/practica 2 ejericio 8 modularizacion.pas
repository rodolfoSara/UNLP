
{8. Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada
producto debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
● Código de los dos productos más baratos.
● Código del producto de tipo “pantalón” más caro.
● Precio promedio.}

program modularizacionParte2ejericicio8;

procedure leer (codigo: integer; precio: real; var primerbarato,segundoBarato: real; var codBarato1, codBarato2: integer);

begin
	
	
	if (precio < primerbarato) then
	begin
		segundoBarato:= primerbarato;
		codBarato2:= codBarato1;
		primerbarato:= precio;
		codBarato1:= codigo
	end
	else if ( precio < segundoBarato) then begin
		segundoBarato:= precio;
		codBarato2:= codigo;
	 
		
	end;


end;


procedure pantCaro ( precio: real; codigo: integer; var precioPantCaro: real; var codPantCaro:integer);

	
begin
	if (precio > precioPantCaro) then
	begin
		precioPantCaro:= precio;
		codPantCaro:= codigo;
	end;

end;

function promedio (suma: real; cantAlumnos:integer; var precioPromedio: real): real;
	
begin
	precioPromedio:= suma / cantAlumnos;
	promedio:= precioPromedio;
	
end;



var 
	codigo: integer;
	precio: real;
	tipo:string;
	primerbarato,segundoBarato, precioPantCaro, precioPromedio, suma: real;
	codBarato1, codBarato2, codPantCaro, cantAlumnos, i, cantIngreso: integer;
	
	
	

begin
primerbarato:=10000;
segundoBarato:=12000;
precioPantCaro:=0;
codPantCaro:=0;
precioPromedio:=0;
suma:=0;
codBarato1:=0;
codBarato2:=0;
cantAlumnos:=0;
cantIngreso:= 3;
	
for i:= 1 to cantIngreso do
	begin
		writeln ('codigo de producto');
		readln(codigo);
		
		writeln ('precio de producto');
		readln(precio);
		
		writeln ('tipo de producto - pantalon, remera, camisa');
		readln(tipo);
		
		suma:= precio + suma;
		
		cantAlumnos:= cantAlumnos +1;
		
		if (tipo = 'pantalon') then 
		  pantCaro(precio, codigo, precioPantCaro, codPantCaro);
		  
		 
	     
	     
	    leer (codigo, precio, primerbarato, segundoBarato, codBarato1, codBarato2);
	    
        
        
	

	end; 


writeln('El codigo  del producto mas barato ', codBarato1  );

writeln('El codigo  del segundo producto mas barato ', codBarato2  );
writeln('El codigo del pantalo mas caro ', codPantCaro );
writeln ('el promedio de precio es ', promedio (suma, cantAlumnos, precioPromedio ));


end.
