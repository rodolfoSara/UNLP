{8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.}


program ejercicio8;

const
	df= 4;

type
	alumnos= record
	nroInscripcion: integer;
	dni: integer;
	nombre: string;
	apellido: string;
	anoNacimiento: integer; 
	end;
	
	vectorAlumno= array [1..df] of alumnos;


procedure leerAlumnos (var a:alumnos);
begin
	writeln ('Numero de inscripcion ');
	readln(a.nroInscripcion);
		
	writeln ('Ingrese DNI');
	readln(a.dni);
		
	writeln ('Escriba su nombre');
	readln(a.nombre);
		
	writeln('Escriba su apellido');
	readln(a.apellido);
		
	writeln ('ano de nacimiento');
	readln(a.anoNacimiento);
	
	writeln ('/////////////////////////////////////');
end;

procedure cargarVector (var va:vectorAlumno);
var
	i: integer;
begin
	for i:= 1 to df do
		leerAlumnos (va[i])
end;	

{a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.}

function esPar ( va: vectorAlumno; df: integer; var cant: integer): integer;
var
	resto, i: integer;
	ok: boolean;
begin
	
	
	for i:= 1 to df do
	begin
		ok:= True;
		writeln('//////////////////', va[i].dni);
		while (va[i].dni <> 0) and (ok= True) do
		begin
			resto:= va[i].dni mod 10;
			if (resto mod 2 = 0) then
				ok:= True
		
			else
				ok:= False;
				
			writeln('//////////////////', ok);
			va[i].dni:= va[i].dni div 10;	
		end;
		
		
		if (ok) then
			cant:= cant + 1;
	end;
	
	
	esPar:= cant;
end;

{b) Apellido y nombre de los dos alumnos de mayor edad.}

procedure mayor (va: vectorAlumno; df: integer; var apellidoMayor1, nombreMayor1, apellidoMayor2, nombreMayor2: string; var anoNacimientoMayor1, anoNacimientoMayor2: integer);
var
	i:integer;

begin
	for i:= 1 to df do
	begin
		if (va[i].anoNacimiento < anoNacimientoMayor1) then
		begin
			anoNacimientoMayor2:= anoNacimientoMayor1;
			apellidoMayor2:= apellidoMayor1;
			nombreMayor2:= nombreMayor1; 
			
			anoNacimientoMayor1:= va[i].anoNacimiento;
			apellidoMayor1:= va[i].apellido;
			nombreMayor1:= va[i].nombre;
		end
		else if (va[i].anoNacimiento < anoNacimientoMayor2) then
		begin
			anoNacimientoMayor2:= va[i].anoNacimiento;
			apellidoMayor2:= va[i].apellido;
			nombreMayor2:= va[i].nombre;
		
		end;
	end;

end;



var
	
	va: vectorAlumno;
	cant, cantPar, anoNacimientoMayor1, anoNacimientoMayor2:integer;
	porcentage: real;
	apellidoMayor1, nombreMayor1, apellidoMayor2, nombreMayor2: string;
begin
	cant:=0;
	porcentage:= 0;
	
	apellidoMayor1:='';
	nombreMayor1:= '';
	apellidoMayor2:='';
	nombreMayor2:='';
	anoNacimientoMayor1:=25000;
	anoNacimientoMayor2:=24000;
	

	cargarVector (va);
	
	cantPar:= esPar ( va, df, cant);
	writeln('Laq cantidad de par es ', cantPar );

	 porcentage:= cant * 100 / df;
	writeln('El procentage de DNI con numeros pares es ', porcentage:2:2);
	
	
	mayor (va, df, apellidoMayor1, nombreMayor1, apellidoMayor2, nombreMayor2, anoNacimientoMayor1, anoNacimientoMayor2);
	
	writeln('EL nombre y apellido del mayor es ', apellidoMayor1, ' y ', nombreMayor1);
	writeln('EL nombre y apellido del SEGUNDO mayor es ', apellidoMayor2, ' y ', nombreMayor2);

end.
