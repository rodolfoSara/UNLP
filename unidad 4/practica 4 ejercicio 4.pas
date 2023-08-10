{Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.
b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.
c) sumaVector: retorna la suma de todos los elementos del vector.
d) promedio: devuelve el valor promedio de los elementos del vector.
e) elementoMaximo: retorna la posición del mayor elemento del vector
f) elementoMinimo: retorna la posicion del menor elemento del vector}

program program4;
const
	dimMax= 15;
type
	numeros= array [1..dimMax] of integer;
	
procedure cargar (var n: numeros);
var
	i:integer;
begin
	for i:= 1 to dimMax do
		n[i]:= i; { abs(random(maxint))}

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

function elementoMaximo (n: numeros): integer;
var 
	max, pos, i: integer;
begin
	max:=0;
	pos:= 0;
	for i:= 1 to dimMax do
	begin
		if (n[i] > max) then
		begin
			max:= n[i];
			pos:= i;
		
		end;
	end;
	elementoMaximo:= pos;

end; 	

{f) elementoMinimo: retorna la posicion del menor elemento del vector}


function elementoMinimo (n: numeros): integer;
var 
	min, pos, i: integer;
begin
	min:=30000;
	pos:= 0;
	for i:= 1 to dimMax do
	begin
		if (n[i] < min) then
		begin
			min:= n[i];
			pos:= i;
		
		end;
	end;
	elementoMinimo:= pos;

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
	pos:integer;

begin


	cargar(num);
	imprimir(num);
	pos:= posicion(num);
	writeln('Ese numero se encuentra en la posicion ', pos);
	imprimirXY (num, numxy);
	
	writeln('La suma del vecto es ', sumaVector(num));
	
	writeln ('La posicion del numero mayor es ', elementoMaximo(num));
	
	writeln ('La posicion del numero mayor es ', elementoMinimo(num));
end.
