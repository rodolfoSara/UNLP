{El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
implementar un programa que procese la información y determine:
● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
a) Un módulo para la lectura de la información de la escuela.
b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
de alumnos y la cantidad de docentes)}

program registroEjercicio3;

type
	escuela = record
	cue: integer;
	nombreEstab: string;
	cantDoc: real;
	cantAlum: real;
	localidad: string;
end;

procedure leerEscuela (var e: escuela);
begin 
	writeln ('escribir el código único de establecimiento ');
	readln(e.cue);
	
	writeln('escribir el nombre del establecimiento');
	readln (e.nombreEstab);
	
	writeln ('escribir la cantidad de docentes');
	readln (e.cantDoc);
	
	writeln ('escribir la cantidad de Alumnos');
	readln (e.cantAlum);
	
	writeln ('escribir el lugar del esstablecimiento');
	readln (e.localidad);
end;


function eslaPlata (e: escuela; relacion:real; var cant: integer):integer;
begin
	if relacion < (e.cantAlum/e.cantDoc) then
	begin
		cant:= cant + 1;
		eslaPlata:= cant;
	end;
end;


procedure mejor (var primeroCUE, segundoCUE: integer; var primeroNombre, segundoNombre: string; var relacionPrimero, relacionSegundo: real; e: escuela);
var
relacionDocente: real;
begin
	relacionDocente:= (e.cantAlum/e.cantDoc);
	if (relacionDocente < relacionPrimero) then
	begin
		relacionSegundo:= relacionPrimero;
		segundoCUE:= primeroCUE;
		segundoNombre:= primeroNombre;
		relacionPrimero:= relacionDocente;
		primeroCUE:= e.cue;
		primeroNombre:= e.nombreEstab;
	
	
	end
	else if (relacionDocente < relacionSegundo) then
	begin
		relacionSegundo:= relacionDocente;
		segundoCUE:= e.cue;
		segundoNombre:= e.nombreEstab;
	end;
	

end;




	
var
	primeroCUE, segundoCUE, cant, i, laplata: integer;
	primeroNombre, segundoNombre: string;
	relacionPrimero, relacionSegundo:real;
	colegio: escuela;
    relacion: real;

begin
	relacion:= 23.435;
	cant:=0;
	primeroCUE:=0;
	segundoCUE:=0;
	primeroNombre:=' ';
	segundoNombre:= ' ';
	relacionPrimero:= 1500;
	relacionSegundo:= 2000;
	i:=0;
	laplata:=0;
	
	
	
	for i:= 1 to 2 do
	begin
		leerEscuela(colegio);
		if (colegio.localidad = 'La Plata') then
			laplata:= eslaPlata (colegio, relacion, cant );
		mejor (primeroCUE, segundoCUE, primeroNombre, segundoNombre, relacionPrimero, relacionSegundo, colegio);
	end;
	writeln('la cantidad de escuela de la plata ', laplata);
	writeln ('el nombre y CUE de la escuela con mejor relacion de alumnos / docentes es ', primeroNombre, ' ' , primeroCUE );
	writeln ('el nombre y CUE de la escuela con SEGUNDO mejor relacion de alumnos / docentes es ', segundoNombre, ' ' , segundoCUE)
END.
		
			
	
	
