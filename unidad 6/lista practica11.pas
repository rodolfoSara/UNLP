{11. La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les
entregará el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido y el
promedio obtenido durante toda su carrera.
Implementar un programa que:
a. Lea la información de todos los egresados, hasta ingresar el código 0, el cual no debe procesarse.
b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los
egresados que recibirán el premio. La información debe imprimirse ordenada según el promedio del egresado
(de mayor a menor).}

program listaPractica11;

type
	alumnos= record
		codigo: integer;
		apellido: string;
		promedio: real;
	end;
	
	listaAlumno= ^datosAlumnos;
	
	datosAlumnos= record
		elem: alumnos;
		sig: listaAlumno;
	end;
	

procedure leerAlumnos (var al:alumnos);
begin
	writeln ('Codigo: ');
	readln(al.codigo);
	
	if (al.codigo <> 0) then
	begin
		writeln ('Apellido ');
		readln(al.apellido);
		
		writeln ('Promedio ');
		readln(al.promedio);
		
		writeln ('/////////////////////////////');
	end;
end;

procedure insertarOrdenado (var lal: listaAlumno; al:alumnos);
var
	nue, act, ant: listaAlumno;
	
begin
	new (nue);
	nue^.elem:= al;
	act:= lal;
	ant:= lal;
	
	while (act <> nil) and (al.promedio < act^.elem.promedio ) do
	begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = ant) then
		lal:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;

end;

procedure cargarLista (var lal: listaAlumno);
var
	al: alumnos;
begin
	leerAlumnos (al);
	while (al.codigo <> 0) do
	begin
		insertarOrdenado (lal, al);
		leerAlumnos (al);
	end;
end;

procedure imprimir (lal: listaAlumno);
var
	aux: listaAlumno;
begin
	aux:= lal;
	while (aux <> nil) do
	begin
		writeln ('El codigo ', aux^.elem.codigo);
		writeln ('El apellido ', aux^.elem.apellido);
		writeln ('El promedio ', aux^.elem.promedio:2:2);
		aux:=  aux^.sig;
	end;
end;

procedure mejorPromedio (lal: listaAlumno);
var
	aux: listaAlumno;
	i: integer;
begin
	aux:= lal;
	for i:= 1 to 3 do
	begin
		writeln ('El codigo ', aux^.elem.codigo);
		writeln ('El apellido ', aux^.elem.apellido);
		writeln ('El promedio ', aux^.elem.promedio:2:2);
		aux:=  aux^.sig;
	end;
end; 

var
	lal: listaAlumno;
	
begin
	 
	cargarLista (lal);
	imprimir (lal);
	
	writeln ('Mejor promedio');
	mejorPromedio (lal);

end.
