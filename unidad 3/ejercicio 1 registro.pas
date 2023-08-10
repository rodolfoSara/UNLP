{a. Completar el programa principal para que lea información de alumnos (código, nombre, promedio) e informe
la cantidad de alumnos leídos. La lectura finaliza cuando ingresa un alumno con código 0, que no debe
procesarse. Nota: utilizar el módulo leer.
b. Modificar al programa anterior para que, al finalizar la lectura de todos los alumnos, se informe también el
nombre del alumno con mejor promedio.}

program Registros;
type
	alumno = record
	codigo : integer;

	promedio : real;
	nombre : string;
end;
procedure leer(var alu:alumno);
begin
	writeln('ingrese el codigo del alumno');
	read(alu.codigo);
	if (alu.codigo <> 0) then 
	begin
		
		writeln('ingrese el promedio del alumno');
		readln(alu.promedio);
		writeln('ingrese el NOMBRE del alumno');
		readln(alu.nombre);
		
		end;
	end;



procedure promedioMayor (promedio: real; nombre: string; var promMayor: real; var nombreMayor: string);
begin
	if (promedio > promMayor) then
	begin
		promMayor:= promedio;
		nombreMayor:= nombre;
	end;
end;
		
	
	
	
	
	
var
a : alumno;
cantAlumnos: integer;
nombreMayor: string;
promMayor: real;


begin
cantAlumnos:=0;
promMayor:=-1;



leer (a);
while (a.codigo <> 0) do begin
    cantAlumnos:= cantAlumnos + 1;
    promedioMayor (a.promedio, a.nombre, promMayor, nombreMayor);
    leer (a);
	end;
  
writeln('la cantidad de alumnos leidos: ', cantAlumnos);
writeln ('el nombre de alumno con promedio mayor es ', nombreMayor);

end.
  
