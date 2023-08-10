{7. Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:
a. la cantidad de ocurrencias de cada dígito procesado.
b. el dígito más leído.
c. los dígitos que no tuvieron ocurrencias.}

program ejercicio7;

type
	rango= 0..9;
	numeros= array [rango] of integer;


procedure inicializar (var n:numeros);
var
	i: rango;
begin
	for i:= 0 to 9 do
		n[i]:= 0;
end;

procedure descomponer ( var n: numeros; cargar: integer);
var
	resto: rango;
begin
	while (cargar <> 0) do
	begin
		resto:= cargar mod 10;
		n[resto]:= n[resto] + 1;
		cargar:= cargar div 10;
	
	end;
end;

function digitoMax (n:numeros): integer;
var
	digMax, max, i:integer;
begin
	digMax:= -1;
	max:=0;
	for i:= 0 to 9 do
	begin
		if (n[i] > max) then
		begin
			max:= n[i];
			digMax:= i;
		end;
	end;
	digitoMax:= digMax;
end;

{c. los dígitos que no tuvieron ocurrencias.}
{
function esCero (valor: integer): boolean;
begin
	esCero:= (valor = 0);
end;
}


procedure ocurrencias (n: numeros; var sinocurrencias: numeros; var j: integer);
var
	i:integer;
begin
	j:= 0;
	for i:= 0 to 9 do
	begin
		if (n[i] = 0) then
		begin
			J:= J +1;
			sinocurrencias[j]:= i;
			
		end;
	end;
end;

procedure imprimirOcurrencias (sinocurrencias: numeros; j:integer);
var
	i:integer;
begin
	for i:= 0 to j do
		writeln ('Los numeros que no tuvieron ocurrencias ', i , ' = ', sinocurrencias[i]);
		writeln ('Los numeros que no tuvieron ocurrencias ', i , ' = ', sinocurrencias[i]);
		

end; 


procedure imprimir (n: numeros);
var
	i:integer;
begin
	for i:= 0 to 9 do
		writeln ('los valores de cada uno ', i , ' = ', n[i]);

end;

var
	num, sinocurrencias: numeros;
	cargar, j:integer;

begin
	j:= 0;
	inicializar (num);
	writeln('escribir un numero');
	readln(cargar);
	while (cargar <> -1) do
	begin
		descomponer (num, cargar);
		
		writeln('escribir un numero');
		readln(cargar);
	
	end;
	
	
	imprimir (num);
	writeln ('El digito que mas aparecio es ', digitoMax(num));
	ocurrencias (num, sinocurrencias, j);
	imprimirOcurrencias (sinocurrencias, j);
	
	

end.
