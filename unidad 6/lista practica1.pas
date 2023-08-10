program listaPractica1;

type 
	lista = ^nodo;
	
	nodo = record
		num : integer;
		sig :lista;
	end;
	
procedure armarNodo (var l: lista; v: integer);
var
	aux: lista;
begin
	new(aux);
	aux^.num:= v;
	aux^.sig := l;
	l:= aux;
end;

procedure imprimirLista (l: lista);
var
	aux: lista;
begin
	aux:= l;
	while (aux <> nil) do
	begin
		writeln ('El valor del nodo actual es: ', aux^.num);
		aux:= aux^.sig ;
	end;
end;

procedure incrementarValor (var l: lista; sumar: integer);
var
	aux: lista;
begin
	aux:=l;
	while (aux <> nil) do
	begin
		aux^.num:= aux^.num + sumar;
		writeln ('El valor del nodo actual mas la suma es: ', aux^.num);
		aux:= aux^.sig ;
	end;
end;
	
var
	pri: lista;
	valor, sumar : integer;
	
begin
	pri:= nil;
	writeln('Ingrese un numero');
	readln(valor);
	while (valor <> 0) do
	begin
		armarNodo (pri, valor);
		writeln('Ingrese un numero');
		readln(valor);
	end;
	
	imprimirLista (pri);
	
	
	writeln ('Escribir un valor a sumar');
	readln (sumar);
	incrementarValor (pri, sumar);
	
	writeln ('Escribir un valor a sumar/////////////////');
	imprimirLista (pri); 
end.
		
