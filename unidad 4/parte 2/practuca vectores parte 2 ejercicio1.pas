{1. a. Dado un vector de enteros de a lo sumo 500 valores,
*  realice un módulo que reciba dicho vector y un valor
n y retorne si n se encuentra en el vector o no.
b. Modifique el módulo del inciso a. considerando ahora que el vector 
* se encuentra ordenado de manera
ascendente.}

program ejercicio1;

const
	df = 10;
	
type
	entero = array [1..df] of integer;
	
procedure leerEntero (var en: entero);
var
	i: integer;
begin
	for i:= 1 to df do
		en[i]:= random(10);

end;

function buscar (en: entero; num, df:integer): boolean;
var
	esta: boolean;
	pos: integer;
begin
	esta:= False;
	pos:=1;
	while ((pos <= df) and (not esta)) do
	begin
		if (en[pos] = num) then esta:= True
		else
			pos:= pos + 1;
	end;
	buscar:= esta;

end;

procedure ordenar (var en: entero; df: integer);
var
	i, j, p, item: integer;
begin
	for i:= 1 to df - 1 do
	begin
		p:= i;
		for j:= i+1 to df do
			if en[j] < en[p] then
				p:=j;
		item:= en[p];
		en[p]:= en[i];
		en[i]:= item;
	end;

end;

var
	en: entero;
	num, i: integer;
	
begin
	leerEntero (en);
	for i:= 1 to df do
		writeln (en[i]);
		
	{b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
ascendente.}
	ordenar (en, df); 
	for i:= 1 to df do
		writeln (en[i]);
		
	writeln('Escribir un numero');
	readln(num);
	writeln ('el num ', num , ' esta? ', buscar (en, num, df));
end.
