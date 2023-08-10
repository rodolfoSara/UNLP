{4. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de elementos de la
lista que son múltiplos de A.}

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

function maximo  (l: lista): integer;
var
	max: integer;
	aux: lista;
begin
	aux:= l;
	max:= -10000;
	while (aux <> nil) do
	begin
		if (aux^.num > max) then
			max:= aux^.num;
		aux:= aux^.sig ;
	end;
	maximo:= max;
end;
	
function minimo (l:lista):integer;
var
	aux: lista;
	min: integer;
begin
	min:=32333;
	aux:= l;
	
	while (aux <> nil) do
	begin
		if (aux^.num < min) then
			min:=aux^.num;
		aux:= aux^.sig;	
	end;
	
	minimo:= min;
end;	

function multiplo (l:lista; numM: integer): integer;
var
	cantM: integer;
	aux:lista;
begin
	cantM:= 0;
	aux:=l;
	while (aux <> nil) do
	begin
		if (aux^.num mod numM = 0) then
			cantM:= cantM + 1;
		aux:= aux^.sig;
	end;
	
	multiplo:= cantM;
end;
	
	
var
	pri, ult: lista;
	valor, sumar, numM : integer;
	
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
	
	writeln ('El numero maximo es ',  maximo (pri));
	
	writeln ('El numero minimo es ',  minimo (pri));
	
	writeln ('Escriba un numero para Multiplo');
	readln (numM);	
	writeln ('La cantidad de multiplos es ',  multiplo (pri, numM));
	
	
	
end.
