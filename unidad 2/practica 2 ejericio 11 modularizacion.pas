{11. Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se
lee: número de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con número de
inscripción 1200, que debe procesarse. Se pide calcular e informar:
● Apellido de los dos alumnos con número de inscripción más chico.
● Nombre de los dos alumnos con número de inscripción más grande.
● Porcentaje de alumnos con nro de inscripción par.}

program modularizacionParte2ejericicio11;


procedure Min (inscripcion: integer; apellido: string; var  min1, min2:integer; var apellidoMin1, apellidoMin2: string );
begin
	if (inscripcion < min1) then 
	 begin
	   min2:=min1;
	   apellidoMin2:=apellidoMin1;
	   min1:= inscripcion;
	   apellidoMin1:=apellido;
	 end
	 else if (inscripcion<min2) then 
		begin
		 min2:= inscripcion;
		 apellidoMin2:= apellido;
	 end;
end;

procedure Max (inscripcion: integer; nombre: string; var max1, max2: integer; var nombreMax1, nombreMax2: string);

begin
  if (inscripcion > max1) then 
	    begin
	      max2:=max1;
	      nombreMax2:= nombreMax1;
	      max1:= inscripcion;
	      nombreMax1:= nombre;
	     end
   else if (inscripcion > max2) then
        begin
          max2:= inscripcion;
          nombreMax2:= nombre;
        end;
 end;         

procedure par (inscripcion: integer; var cantPar: integer );
	begin
		if ((inscripcion mod 2) = 0) then
		  cantPar:= cantPar + 1;
		  writeln('la cantidad de par es ', cantPar);
	  

	end;


var
inscripcion,  max1, max2, min1, min2, cant, cantPar : integer;
apellido, nombre, apellidoMin1, apellidoMin2, nombreMax1, nombreMax2: string;
porcentage:real; 

begin
    max1:=0;
    max2:=0;
    min1:=30000;
    min2:=32000;
    cant:=0;
    cantPar:=0;
    porcentage:=0;
    
	repeat
	  writeln('numero de inscripcion');
	  readln(inscripcion);
	  writeln('Nombre del alumno');
	  readln(nombre);
	  writeln('apellido del alumno');
	  readln(apellido);
	  cant:= cant +1;
	  writeln('la cantidad de cantidad es ', cant);
	  Min (inscripcion, apellido, min1, min2, apellidoMin1, apellidoMin2 );
	  Max (inscripcion, nombre, max1, max2, nombreMax1, nombreMax2);
	  par (inscripcion, cantPar);
	    writeln('la cantidad de par es ', cantPar);

	until(inscripcion = 1200);
	
	
	porcentage:= (cantPar * 100) / cant;
	writeln('el porcentage de incripciones par es ', porcentage); 
	Writeln('El apellido con el numero de incripcion mas bajo es ', apellidoMin1);
	Writeln('El apellido con el numero de incripcion segundo mas bajo es ', apellidoMin2);
	Writeln('El nombre con el numero de incripcion mas alto es ', nombreMax1);
	Writeln('El nombre con el numero de incripcion segundo mas alto es ', nombreMax2);

end.
