{3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados (agregar atrás).
b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados, manteniendo un puntero al último ingresado.}

program listaPractica3B;

type 
	lista = ^nodo;
	
	nodo = record
		num : integer;
		sig :lista;
	end;
	
procedure armarNodo (var l, ult: lista; v: integer); 
var
	nue: lista;
begin
	new(nue);
	nue^.num:= v;
	nue^.sig := nil;
	
	if (l = nil) then 
	l:= nue
	else
		ult^.sig:= nue;
	ult:= nue;
	
	
	
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
	pri, ult: lista;
	valor, sumar : integer;
	
begin
	pri:= nil;
	writeln('Ingrese un numero');
	readln(valor);
	while (valor <> 0) do
	begin
		armarNodo (pri, ult, valor);
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
