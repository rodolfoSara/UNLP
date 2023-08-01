{Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se
lee: nro de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con nro de inscripción
1200, que debe procesarse. Se pide calcular e informar:
●Apellido de los dos alumnos con nro de inscripción más chico.
●Nombre de los dos alumnos con nro de inscripción más grande.
●Porcentaje de alumnos con nro de inscripción par.}

Program ejercicio11;
type
  string20= string [20];
  
procedure leer_alumno (var inscripcion: integer; var apellido:string20; var nombre: string20 );
	var
	  min1, min2, max1, max2: integer;
	  apellidoMin1, apellidoMin2, nombreMax1, nombreMax2: string20;

	begin
	
		min1:= 28000;
		min2:= 29000;
		max1:= 1;
		max2:=0;
		apellidoMin1:= '';
		apellidoMin2:= '';
		nombreMax1:= ' ';
		nombreMax2:=' ';
	repeat 
		writeln ('numero de inscripcion');
		readln(inscripcion);
		writeln ('escriba su apellido');
		readln(apellido);
		writeln ('escriba su nombre');
		readln(nombre);
		if (inscripcion < min1) then begin 
		  min2:= min1;
		  apellidoMin2:= apellidoMin1;
		  min1:= inscripcion;
		  apellidoMin1:= apellido
		end
		else if (inscripcion < min2) then begin
		    min2:= inscripcion;
		    apellidoMin2:= apellido
		end
		else 
		  if (inscripcion > max1) then begin
		    max2:= max1;
		    nombreMax2:= nombreMax1;
		    max1:= inscripcion;
		    nombreMax1:= nombre;
		end
		else
		  if (inscripcion > max2) then begin
		    max2:= inscripcion;
		    nombreMax2:= nombre
		end;
		
	  until (inscripcion = 1200);
	writeln(' Apellido de los dos alumnos con nro de inscripción más chico', apellidoMin1, apellidoMin2, nombreMax1, nombreMax2 ); 
	end;
var
	  inscripcion: integer;
	  apellido, nombre: string20;

begin
	writeln ('numero de inscripcion');
	readln(inscripcion);
	writeln ('escriba su apellido');
	readln(apellido);
	writeln ('escriba su nombre');
	readln(nombre);
	leer_alumno (inscripcion, apellido, nombre);
    
end.
