{9. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o false en
caso contrario.
b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si existe). Nota:
la lista podría no estar ordenada.
c. Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista con todos
los elementos de la lista L mayores que A y menores que B.
d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de
manera ascendente.
e. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de
manera descendente.}

program listaPractica9;

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

function esOrdenada (l: lista): boolean;
var
	ant, actual: lista;
	ok: boolean;
begin
	ok:= True;
	actual:= l;
	ant:= l;
	while (actual <> nil) and (ok = True) do
		if ( ant^.num <= actual^.num) then
		begin
			ant:= actual;
			actual:= actual^.sig;
		end
		else
			ok:= False;
	esOrdenada:= ok;

end;

procedure eliminar (var l: lista; numero: integer);
var
	ant, actual: lista;
begin
	actual:= l;
	
	while (actual <> nil) and (actual^.num <> numero) do
	begin
		ant:= actual;
		actual:= actual^.sig;
	end;
	
	if (actual <> nil) then
		if (actual = l) then
		begin
			l:= l^.sig;
			dispose (actual);
		end
		else 
		begin
			ant^.sig:= actual^.sig;
			dispose (actual);
		end;
end;

procedure cargarNuevaLista (var nueLis:lista; valor: integer);
var
	nue: lista;
begin
	new(nue);
	nue^.num:= valor;
	nue^.sig:= nil;
	
	if (nueLis = nil) then nueLis:= nue
	else
	begin
		nue^.sig:= nueLis;
		nueLis:= nue;
		
	end;
end;


procedure nuevaLista ( l: lista; num1, num2: integer; var nueLis:lista);
var
	aux: lista;

begin
	
	aux:= l;
	while (aux <> nil) do
	begin
		if (aux^.num > num1) and (aux^.num < num2) then
		begin
			cargarNuevaLista (nueLis, aux^.num );
			
		end;
		
		aux:= aux^.sig;
	end;
end;	

	
var
	pri, nueLis: lista;
	valor, sumar, nume, num1, num2 : integer;
	
begin
	pri:= nil;
	nueLis:= nil;	
	
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
	
	writeln ('Es ordenada la lista ', esOrdenada (pri));
	
	writeln ('Escriba un nujmero a eliminar');
	readln(nume);
	eliminar (pri, nume);
	
	writeln ('Lista con numero eliminado');
	imprimirLista (pri); 
	
	writeln ('Escribir dos numero para imprimir nujeva lista');
	writeln ('Num 1');
	readln (num1);
	writeln ('Num 2');
	readln (num2);
	
	nuevaLista (pri, num1, num2, nueLis);
	writeln ('imprimir Nueva Lista ');
	imprimirLista (nueLis);
		
	
end.
		
