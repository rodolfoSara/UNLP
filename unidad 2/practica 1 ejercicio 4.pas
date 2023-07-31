{Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se                                 
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído)}

program ifelse_ifelseChecking;
	
var
  num, x, num1: real;
  
  

begin
  write ('escriba numero  ');
  readln(num1);
  x:=num1;
  while (num <> x*2) do begin
    readln(num);
  end;
	
end.


