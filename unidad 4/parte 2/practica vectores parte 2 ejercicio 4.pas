{4. Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por
nro de alumno de manera ascendente. Se pide:
a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
alumno seguro existe.
b. Un módulo que reciba un alumno y lo inserte en el vector.
c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datos
leídos de teclado.}

program ejercicio4;
const
	df= 100; {1000} 
	dimItem=1001; {agregue un punto mas a la DF para poner valor al item}
type
	alumnos = record
	nroAlumno: integer;
	nombre: string;
	apellido: string;
	asistencia: integer;
	end;
	
	alumnosVector = array [1..dimItem] of alumnos;

	
procedure leerAlumnos (var al: alumnos);
begin
	writeln('///////////////////////////////////');
	writeln ('Escriba el numero de alumno');
	readln(al.nroAlumno);
	
	writeln('Nombre de alumno');
	readln(al.nombre);
	
	writeln('Apellido de alumno');
	readln(al.apellido);
	
	writeln('Cantidad de asistencia a clases');
	readln(al.asistencia);
	
	writeln('///////////////////////////////////');

end;

procedure leerAlumnosVector (var alV: alumnosVector; var dl: integer);
var
	num: integer;
begin
	while (num <> 0) and (dl < df) do
	begin
		dl:= dl + 1;
		leerAlumnos(alV[dl]);
		
		writeln ('escriba cero si quiere terminar '); readln(num);
	end;

end;

{ORDENAMOS EL VECTOR}

procedure ordenar (var alV: alumnosVector; dl: integer);
var
	i, j, p, item: integer;

begin
	item:= dimItem;
	for i:= 1 to (dl - 1) do
	begin
		p:=i;
		for j:= i+1 to dl do
		begin
			if (alV[j].nroAlumno < alV[p].nroAlumno) then
				p:= j;
		end;
		alv[item]:= alV[p];
		alV[p]:= alV[i];
		alV[i]:= alv[item];
	end;
end;

{a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
alumno seguro existe.}

function buscar (alV: alumnosVector; dl: integer; valor: integer): integer;
var
	esta: boolean;
	pos: integer;
begin
	esta:= False;
	pos:=1;
	while (pos <= dl) and (not esta) do
	begin
		if (alV[pos].nroAlumno = valor) then
		begin
			esta:= True;
		end
		else 
		begin
			pos:= pos + 1;
		end;
	end;
	buscar:= pos;
end;


{b. Un módulo que reciba un alumno y lo inserte en el vector.}

procedure agregarAlum (var alV: alumnosVector; var dl: integer );
begin
	if ((dl + 1) <= df) then
	begin
		dl:= dl + 1;
		leerAlumnos(alV[dl]);
		
	end
	else
		writeln ('no hay espacio fisico para agregar un alumno');
end; 

{c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.}

procedure eliminar (var alV: alumnosVector; var dl: integer; pos: integer );
var
	i: integer;
	
begin
	if (pos >= 1) and (pos <= dl) then
	begin
		for i:= pos to (dl - 1) do
			alV[i]:= alV[i + 1];
		dl:= dl - 1;
	end;
	
end;

{d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector}
procedure eliminarNroAlumno (var alV: alumnosVector; var dl: integer; nroAlum: integer );
var
	esta: boolean;
	pos, i: integer;
begin
	esta:= False;
	pos:= 1;
	while (pos<= dl) and (not esta) do
	begin
		if (alV[pos].nroAlumno = nroAlum) then
			esta:= True
		else
			pos:= pos + 1; 

	end;
	if (esta) then
	begin
		for i:= pos to dl do
			alV[i]:= alV[i + 1];
		dl:= dl - 1;
	end;
	
end;

{e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.}
procedure eliminarAsistencias (var alV: alumnosVector; var dl: integer);
var
	i, j, pos: integer;
begin
	for i:= dl downto 1 do
	begin
		if (alV[i].asistencia = 0) then
		begin
			pos:= i;
			for j:= pos to dl do
				alV[j]:= alV[j + 1];
			dl:= dl - 1;
		end;
		
	end;
end;

var
	alV: alumnosVector;
	dl, i, valor, buscado, pos, nroAlum: integer;
	
begin
	dl:= 0;
	
	leerAlumnosVector (alV, dl);
	for i:= 1 to dl do
	 begin
		writeln (alV[i].nroAlumno);
		writeln (alV[i].nombre);
		writeln (alV[i].apellido);
		writeln (alV[i].asistencia);
	end;
	
	ordenar (alV, dl);
	 
	
	 
	 writeln('vector ordenado');
	 for i:= 1 to dl do
	 begin
		writeln (alV[i].nroAlumno);
		writeln (alV[i].nombre);
		writeln (alV[i].apellido);
		writeln (alV[i].asistencia);
	end;
	
	{AAAAAAA buscar}
	writeln ('buscar la posicion a traves de su numero de alumno');
	readln (valor);
	buscado:= buscar (alV, dl, valor);
	writeln ('la posicion del alumno buscado es ', buscado );
	
	{BBBBBBBB  agregar}
	writeln('agregar un alumno');
	agregarAlum (alV, dl);
	
	 for i:= 1 to dl do
	 begin
		writeln (alV[i].nroAlumno);
		writeln (alV[i].nombre);
		writeln (alV[i].apellido);
		writeln (alV[i].asistencia);
	end;
	
	
	{CCCCCCC eliminar}
	writeln('Escriba la posicion que quiere eliminar');
	readln (pos);
	eliminar (alV, dl, pos);
	 for i:= 1 to dl do
	 begin
		writeln (alV[i].nroAlumno);
		writeln (alV[i].nombre);
		writeln (alV[i].apellido);
		writeln (alV[i].asistencia);
	end;
	
	{DDDDD eliminar nro}
	writeln('Escriba el numero de alumno que quiera eliminar');
	readln(nroAlum);
	eliminarNroAlumno (alV, dl, nroAlum);

	 for i:= 1 to dl do
	 begin
		writeln (alV[i].nroAlumno);
		writeln (alV[i].nombre);
		writeln (alV[i].apellido);
		writeln (alV[i].asistencia);
	end;
	
	{EEEEEE eliminar vector con asistencia en 0}
	writeln ('Eliminamos todos los usuarios con 0 asistencias ');
	eliminarAsistencias (alV, dl);
	writeln ('////////////////////////// saber el DL ', dl);
	for i:= 1 to dl do
	 begin
		writeln (alV[i].nroAlumno);
		writeln (alV[i].nombre);
		writeln (alV[i].apellido);
		writeln (alV[i].asistencia);
	end;
end.
