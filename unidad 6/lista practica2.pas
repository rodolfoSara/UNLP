program listaPractica2;

type
	persona = record
		dni: integer;
		nombre: string;
		apellido: string;
	end;
	
	
	lista = ^nodo;
	
	nodo = record
		dato: persona;
		sig: lista;
	end;
	
	
procedure leerPersona (var p: persona);
begin
	writeln('DNI');
	readln(p.dni);
	
	if (p.dni <> 0) then
	begin
		writeln('Nombre');
		readln(p.nombre);
		
		writeln('Apellido');
		readln(p.apellido);
		
		writeln('//////////////////////')
	end;
end;

procedure insertarAdelante (var pri: lista; p: persona);
var
	nue: lista;
	
begin
	new (nue);
	nue^.dato:= p;
	nue^.sig:= nil;
	
	
	
	if (pri = nil) then pri:= nue
	else begin
		nue^.sig:= pri;
		pri:= nue;
	end;
	
end;


procedure cargarLista (var pri: lista);
var
	p: persona;
begin
	
	leerPersona (p);
	while ( p.dni <> 0) do
	begin
		insertarAdelante(pri, p);
		leerPersona (p);
	end;
end;


procedure imprimir (pri: lista);
var
	aux: lista;
begin
	aux:= pri;
	while (aux <> nil) do
	begin
		writeln (aux^.dato.dni);
		writeln (aux^.dato.nombre);
		writeln (aux^.dato.apellido);
		aux:= aux^.sig;
	end;

end;



var
	p: persona;
	pri: lista;
begin
	pri:= nil;

	cargarLista (pri);
	imprimir (pri);

end.
