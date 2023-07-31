{Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se                                 
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído)}

program practica1_ejercicio5;
	
var
  num, x, num1, cant: integer;
  
  

begin
  write ('escriba numero  ');
  readln(num);
  x:=num *2;
  while (num <> x) and (cant < 10) do begin
    cant:= cant +1;
    readln(num);
    
  end;
	
end.


