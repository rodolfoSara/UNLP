{Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A$B#, donde:
-A es una secuencia de sólo letras vocales
-B es una secuencia de sólo caracteres alfabéticos sin letras vocales
-los caracteres $ y # seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}

program ejericio12;

function esVocalMinuscula (c: char):boolean;
begin
  esVocalMinuscula:=(c='a') or (c='e') or (c='i') or (c='o') or (c='u');
end;

procedure esA (cumple: boolean);
  var
    c: char; 
  begin
      writeln ('escriba una vocal minuscula ');
      readln (c);
	  while (c <> '$') and (cumple) do begin
		if (not esVocalMinuscula (c)) then
		  cumple:= false
		else
		  writeln ('escriba una vocal minuscula ');
		  readln (c)
	   end;
  end; 
function esNumero (c: char): boolean;
  begin
    esNumero:= (c>='0') or (c<='9');
  end;

procedure esB ( var cumple: boolean);
  var
    c: char; 
  begin
      writeln ('escriba una vocal minuscula ');
	  readln (c);
	  while (c <> '#') and (cumple) do begin
		if (esNumero (c)) and (esVocalMinuscula (c)) then
		  cumple:= false
		else
		   writeln ('escriba caracteres ');
		   readln (c)
		end;
  end;


var 
  c: char;
  cumple: boolean;
begin
  cumple:= true;
  writeln ('escriba una vocal minuscula ');
  readln (c);
  if esA (cumple) then begin
    if esB ( cumple) then
      writeln ('todo salio bien ')
    else
      writeln ('no cumple con B secuencia de caracteres ')
  else
    writeln ('no cumple con A, secuencia de vocales ')
  
  end;


end.
    
