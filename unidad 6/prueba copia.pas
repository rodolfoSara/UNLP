program pruebaCopia;

type
	lista = ^datos;
	
	datos = record
		elem: integer;
		sig: lista;
	end;
	
procedure agregarAdelante (var lorig: lista; num: integer);
var
	nue: lista;
begin
	new(nue);
	nue^.elem:= num;
	nue^.sig:= nil;
	
	if (lorig = nil) then
		lorig:=nue
	else
	begin
		nue^.sig:= lorig;
		lorig:= nue;
	end;

end;

procedure imprimir (a: lista);
var
	aux: lista;
begin 
	aux:= a;

	while (aux <> nil) do
	begin
		writeln(aux^.elem);
		aux:= aux^.sig;
	end;
end;

procedure agregarDuplicado (var lDuplicada: lista; num: integer);
var
	nuevo: lista;
begin
	new (nuevo);
	nuevo^.elem:= num;
	nuevo^.sig:= nil;
	
	if (lDuplicada = nil) then lDuplicada:= nuevo
	else
	begin
		nuevo^.sig:= lDuplicada;
		lDuplicada:= nuevo;
	end;

end;
	
var
	lorig, lDuplicada: lista;
	num: integer;
begin
	lorig:= nil;
	lDuplicada:= nil;
	
	writeln('Leer numero');
	readln(num);
	while (num > 0) do
	begin
		readln(num);
		if (num < 5) then
			agregarDuplicado (lDuplicada, num);
		agregarAdelante (lorig, num);
		writeln('Leer numero');
	end;
	
	imprimir (lorig);
	imprimir (lDuplicada);
end.
	
{	
p2:=p1
ver si puedo hacer que cargue el valor del nodo
y no que apunte como p2 = p1

procedure cambiar (lorig: lista, var lDuplicada: lista }
