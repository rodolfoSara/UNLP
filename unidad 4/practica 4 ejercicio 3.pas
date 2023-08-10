{Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.
d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.}

program practica3;

const
	dimF= 10;
type
	numeros = array [1..dimF] of integer;
	
procedure cargar (var n:numeros; var dimL: integer);
var
	i:integer;
begin
	for i:= 1 to dimF do
	begin
		n[i]:=abs(random(maxint));
		dimL:= dimL + 1;
	end;
end;

procedure imprimir (n:numeros);
var
	i:integer;
begin
 for i:= 1 to dimF do
	writeln (n[i])

end;

procedure imprimirReves (n:numeros; dimL:integer);
var
	i:integer;
begin

 for i:= dimL downto 1 do
	writeln (n[i])

end;

{c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.}

procedure imprimirMitadPrimera (n:numeros; dimL:integer);
var
	i, mitad1:integer;
begin
  mitad1:= dimL div 2;
 for i:= mitad1  downto 1 do
	writeln (n[i])

end;

procedure imprimirMitadSegundo (n:numeros; dimL:integer);
var
	i, mitad2:integer;
begin
  mitad2:= (dimL div 2)+1;
 for i:= mitad2  to dimL do
	writeln (n[i])

end;

{d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.}

procedure imprimiXY (n:numeros; dimL:integer);
var x, y, i: integer;
begin
	writeln('escribir el valor de X');
	readln(x);
	
	writeln('escribir el valor de Y');
	readln(y);
	
	if (x > y) then
	begin
		for i:= x downto y do
			writeln(n[i]);
    end
	else if (x < y) then
	begin
		for i:= x to y do
			writeln(n[i])
	
	end;


end;





var
	num: numeros;
	dimL: integer;

begin
	 dimL:=0;
	 
	 
	 
	cargar(num, dimL);
	writeln('imprimimos los numeros');
	imprimir (num);
	
	writeln('imprimimos los numeros al reves');
	imprimirReves (num, dimL);
	
	writeln('imprimimos desde la mitad al primero');
	imprimirMitadPrimera (num, dimL);
	
	writeln('imprimimos desde la mitad hasta el final ');
	imprimirMitadSegundo (num, dimL);
	
	writeln('imprimimos desde la posicion deseada ');
	imprimiXY (num, dimL);



end.
