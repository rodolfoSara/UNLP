{13. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A%B*, donde:
- A es una secuencia de caracteres en la que no existe el carácter ‘$’.
- B es una secuencia con la misma cantidad de caracteres que aparecen en A y en la que aparece a lo sumo
3 veces el carácter ‘@’.
- Los caracteres % y * seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió}



program modularizacionParte2ejericicio13;

procedure esA (a:char; var long: integer; var cumple: boolean);
begin
	long:=0;
	writeln('escribe un caracter');
	readln(a);
	
	if (a='$') then
	  cumple:= False;
	  
	while (a <> '$') and (a <> '%') do begin
		long:= long +1;
		
		writeln('escribe un caracter');
		readln(a);
	end;
	
	if (a='$') then
	  cumple:= False;
	
end;

function esB (a:char; var cumple: boolean; long: integer):boolean;

{function esB(a: char; var cumple: boolean; long: integer):boolean;}

var longB, longArroba: integer;
begin
	longB:=0;
	longArroba:=0;
    writeln('escribe un caracter');
	readln(a);
	

	while (a <> '*') do 
		begin
			longB:= longB +1;
			if (a = '@') then 
				longArroba:= longArroba +1;
			writeln('escribe un caracter');
			readln(a);
		end;
		  
	if (longArroba <> 3) or (longB <> long) then
		cumple:= False;
		
    esB:=cumple;
	
end;

var
  long: integer;
  a: char;
  cumple, esBB: boolean;

begin

cumple:= True;

	esA (a, long, cumple);
	if (cumple = True) then begin
		writeln ('se completo la seccion A');
		esBB:= esB(a, cumple, long);
		if (cumple) then
		   writeln ('se completo la seccion B')
		  
		else
	       writeln ('NO se completo la seccion B')
	end	   
	else
	   writeln ('NO se completo la seccion A');

	
end.
