{8. Utilizando el programa del ejercicio 1, modificar el módulo armarNodo para que los elementos de la lista
queden ordenados de manera ascendente (insertar ordenado).}

program listaPractica1;

type 
	lista = ^nodo;
	
	nodo = record
		num : integer;
		sig :lista;
	end;
	
procedure insertarOrdenado (var l: lista; v: integer);
var
	nue, ant, actual: lista;
begin
	new(nue);
	nue^.num:= v;
	nue^.sig := nil;
	
	if (l = nil) then
		l:= nue
	else 
	begin
		actual:= l;
		ant:= l;
		
		while (actual <> nil) and (actual^.num < nue^.num) do
		begin
			ant:= actual;
			actual:= actual^.sig
		end;
		if (actual =l) then
		begin
			nue^.sig:= l;
			l:= nue;
		end
		else if (actual <> nil) then
		begin
			ant^.sig:= nue;
			nue^.sig:= actual;		
		end
		else
		begin
			ant^.sig:= nue;
			nue^.sig:= nil
		end;
	end;
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
		insertarOrdenado (pri, valor);
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
		
