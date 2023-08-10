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
	dimMax= 50;
type
	numeros= array [1..dimMax] of integer;
	
procedure cargar (var n: numeros; var dl: integer);
var
	num:integer;
begin
	

	while (dl < dimMax ) and (num <> 50)  do
	begin
		dl:= dl + 1;
		n[dl]:= abs(random(maxint))
		
		
	end;
end; 



{e) elementoMaximo: retorna la posición del mayor elemento del vector}

procedure elementoMaximoMinimo (n: numeros; var max, posMax, min, posMin: integer);
var 
	i: integer;
begin
	
	for i:= 1 to dimMax do
	begin
		if (n[i] > max) then
		begin
			max:= n[i];
			posMax:= i;
		
		end
		else if (n[i] < Min) then
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
	num:numeros;
	dl, max, posMax, min, posMin:integer;

begin
    dl:=0;
    max:=0;
	posMax:= 0;
	min:=30000;
	posMin:= 1;
	
	

	cargar(num, dl);
	imprimir(num);
	
	
	
	
	elementoMaximoMinimo (num, max, posMax, min, posMin);
	
	writeln ('El elemento mayor ', max, ' en la posicion ', posMax);
	writeln ('El numero menor ', min, ' en la posicion ', posMin);
	
	
end.
