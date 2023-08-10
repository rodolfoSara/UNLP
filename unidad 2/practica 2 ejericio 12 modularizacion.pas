{12. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A$B#, donde:
- A es una secuencia de sólo letras vocales
- B es una secuencia de sólo caracteres alfabéticos sin letras vocales
- los caracteres $ y # seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}

program modularizacionParte2ejericicio12;


function esVocal (a: char): boolean;
begin 
  esVocal:= (a='a') or (a='e') or (a='i') or (a='o') or (a='u') or (a='A') or (a='E') or (a='I') or (a='O') or (a='U');

{PODRIAMOS ESCRIBIR

var ok: boolean 
if (a:='a') or (a:='e')..... then
   ok:= True
else
*  ok:=False
esa:= ok
* 
GENERA DOSS PUNTOS de salida de la funcion y no esta bueno

}

end;

function esA (var cumple: boolean): boolean;
var
  c:char;
  
begin
	writeln('ingrese caracteres vocales');
	readln(c);
	while (c <>'$') and (cumple ) do begin
	   if (not esVocal(c)) then begin
		  cumple:=false;
		  writeln('no es una vocal');
		  writeln (cumple);
		  end
	else begin
	   readln(c);
	   end;
    
    end;
    esA:= cumple;
end;

function esB (var cumple: boolean): boolean;
var
	c: char;
begin
	writeln('ingrese caracteres sin vocales');
	readln(c);
	while (c <> '#') and (cumple) do begin
		if( esVocal(c) ) then begin
		  cumple:= False;
		  writeln ('no es una consonante');
		  writeln (cumple)
		end
		else begin
		  readln(c)
	    end;
	 end;
  esB:= cumple;
end;  


var cumple, esAA, esBB: boolean;
begin
cumple:= True;
 esAA:= esA(cumple);
 if (esAA) then begin
    esBB:= esB(cumple);
   if (esBB) then
      writeln('se cumplio con la secuenca de caracteres')
   else
      writeln('no se cumplio la secuencia B, caracteres sin vocales');
      
      TERMINAR LOS ELSE************************************************************
      
  end
 else begin
   writeln('no se cumplio con la secuencia A, solo vocales');
 end;
end.


