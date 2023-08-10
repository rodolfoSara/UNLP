{2. Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
c. Lea un nombre y lo inserte en la posición 4 del vector.
d. Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias.}


program ejercicio2;
const
	df=500;

type
	alumnos = array [1..df] of string;
	
procedure leerAlumnos (var al: alumnos; var dl: integer);
var
	nombre: string;
begin
	dl:= 0;
	writeln('Escriba nombre de alumno');
	readln (nombre);
	while (nombre <> 'ZZZ') and (dl < df) do
	begin
		dl:= dl + 1;
		al[dl]:= nombre;
		writeln('Escriba nombre de alumno');
		readln (nombre);
	end;
end;
	
{b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.}

procedure buscarNombre (al:alumnos; dl:integer; NombreBorrar: string; var esta: boolean; var posNum: integer);
var
	
	pos: integer;
begin
	pos:=1;
	
	esta:= False;
	while (pos <= dl) and (not esta) do
	begin
		if (NombreBorrar = al[pos]) then
		begin
			esta:= true;
			posNum:= pos;
			
		end
		else
			pos:= pos + 1;	
	end;
end;

procedure eliminarNombre (var al: alumnos; var dl: integer; esta: boolean; posNum: integer);
var
	i: integer;
	
begin
	if (posNum >= 1) and (posNum <= dl) and (esta) then
	begin
		for i:= posNum to (dl - 1) do
			al[i]:= al[i + 1];
		dl:= dl - 1;
	end;

end;

{c. Lea un nombre y lo inserte en la posición 4 del vector.}

procedure insertarPos4 (var al: alumnos; var dl: integer; nombreInsertar: string);
var
	pos, i: integer;
begin
	pos:= 4; 
	if ((dl + 1) <= df) and (pos >= 1) and (pos <= dl) then
	begin
		for i:= dl downto pos do
			al[i + 1]:= al[i];
		al[pos]:= nombreInsertar;
		dl:= dl + 1;
	end;

end;

{d. Lea un nombre y lo agregue al vector. }

procedure agregar (var al: alumnos; var dl: integer; nombreAgregar: string);

begin
	if ((dl + 1)<= df) then
	begin
		dl:= dl + 1;
		al[dl]:= nombreAgregar;	
	end;
end;





var
	dl, posNum, i: integer;
	al: alumnos;
	esta: boolean; 
	NombreBorrar, nombreInsertar, nombreAgregar: string;

begin
	posNum:= 0;
	
	leerAlumnos (al, dl);
	
	writeln ('Escribe el nombre que quiere eliminar');
	readln(NombreBorrar);
	 buscarNombre (al, dl, NombreBorrar, esta, posNum);
	 eliminarNombre (al, dl, esta, posNum);
	 
	 for i:= 1 to dl do
		writeln(al[i]);
	
	writeln ('Escribe el nombre que quiere insertar ');
	readln(nombreInsertar);	
	insertarPos4 (al, dl, nombreInsertar);
	
	for i:= 1 to dl do
		writeln(al[i]);
		
	writeln ('Escribe el nombre que quiere agregar ');
	readln(nombreAgregar);	
		
	agregar (al, dl, nombreAgregar);
	
	for i:= 1 to dl do
		writeln(al[i]);

end.
