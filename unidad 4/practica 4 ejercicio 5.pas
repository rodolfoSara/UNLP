{Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.
b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.
c) sumaVector: retorna la suma de todos los elementos del vector.
d) promedio: devuelve el valor promedio de los elementos del vector.
e) elementoMaximo: retorna la posición del mayor elemento del vector
f) elementoMinimo: retorna la posicion del menor elemento del vector
* 
* ////////////////////////////////////////////////////////
* 
* Utilizando los módulos implementados en el ejercicio 4, realizar un programa que lea números enteros
desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0. Al finalizar
la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento, e informe la
operación realizada de la siguiente manera: “El elemento máximo ... que se encontraba en la posición ...
fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”.
* 
* 
* 
* 
* }

program program4;
const
	dimMax= 5;
type
	numeros= array [1..dimMax] of integer;
	
procedure cargar (var n: numeros; var dl: integer);
var
	num:integer;
begin
	writeln ('escriba un numero');
	readln(num);

	while (dl < dimMax ) and (num <> 50)  do
	begin
		dl:= dl + 1;
		n[dl]:= num; { abs(random(maxint))}
		
		writeln ('escriba un numero');
		readln(num);
	end;
end; 

function posicion (n: numeros):integer;
var
	pos, x:integer;
	seguir:boolean;
begin
	seguir:= True;
	pos:=1;
	writeln('Escribe un numero para saber su posicion en el vecto o sino esta');
	readln(x);
	while (seguir= True) and (pos <= dimMax) do
	begin
		if (n[pos] = x) then
			seguir:= False
		else
			pos:= pos +1;
	end;
	if (seguir = False) then 
		posicion:= pos
	else
		posicion:= -1;
	
end;

{b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.}

procedure imprimirXY (n, nxy: numeros);
var x, y, i, j: integer;
begin 
	j:=0;
	writeln ('escriba un valor X');
	readln (x);
	writeln ('escriba un valor y');
	readln (y);
	
	if (x < y) then
	begin
		for i:= x to y do
		begin
			j:= j +1;
			nxy[j]:= n[i];
			writeln(nxy[j])
		end;
	end
	
	else if (x > y) then
	begin
		for i:= x downto y do
		begin
			j:= j +1;
			nxy[j]:= n[i];
			writeln(nxy[j])
		end;
	end;
			

end; 

{c) sumaVector: retorna la suma de todos los elementos del vector.}

function sumaVector (n: numeros): integer; 
var
	suma, i: integer;
begin
	suma:=0;
	for i:= 1 to dimMax do
		suma:= suma + n[i];
	sumaVector:= suma;

end;

{e) elementoMaximo: retorna la posición del mayor elemento del vector}

procedure elementoMaximo (n: numeros; var max, posMax: integer);
var 
	i: integer;
begin
	
	for i:= 1 to dimMax do
	begin
		if (n[i] > max) then
		begin
			max:= n[i];
			posMax:= i;
		
		end;
	end;
	

end; 	

{f) elementoMinimo: retorna la posicion del menor elemento del vector}


procedure elementoMinimo (n: numeros; var min, posMin: integer );
var 
	i: integer;
begin
	
	for i:= 1 to dimMax do
	begin
		if (n[i] < posMin) then
		begin
			min:= n[i];
			posMin:= i;
		
		end;
	end;


end; 	


procedure imprimir (var n: numeros);
var
	i:integer;
begin
	for i:= 1 to dimMax do
		writeln(n[i]);

end; 



var
	num, numxy:numeros;
	pos, dl, max, posMax, min, posMin, posMax1, posMin1:integer;

begin
    dl:=0;
    max:=0;
	posMax:= 0;
	min:=30000;
	posMin:= 1;
	
	posMax1:= posMax;
	posMin1:= posMin;
	num[posMax1]:= num[posMin];
	num[posMin1]:= num[posMax];

	cargar(num, dl);
	imprimir(num);
	pos:= posicion(num);
	writeln('Ese numero se encuentra en la posicion ', pos);
	imprimirXY (num, numxy);
	
	writeln('La suma del vecto es ', sumaVector(num));
	
	elementoMaximo (num, max, posMax);
	elementoMinimo (num, min, posMin);
	
	writeln('El elemento maximo ', num[posMax], ' que se encontraba en la posicion ', posMax, ' fue intercambiado con el elemento minimo ', num[posMin], ' que se encontraba en la posición ', posMin);
	
	
end.
