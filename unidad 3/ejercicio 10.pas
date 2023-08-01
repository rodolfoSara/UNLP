{Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando llega
el número 123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus dígitos
pares y la cantidad de dígitos impares que posee.}
Program ejercicio9;


Procedure leer_digitos(num: integer );

  var
    suma, digitos, digitosPar, digitosImpar:integer;
begin
  suma:=0;
  digitosImpar:=0;
  digitosPar:=0;
  digitos:=0;
  if (num <> 1234) then begin
	  while (num <> 0) do begin
		digitos:= num mod 10;
		
		
		if ((digitos mod 2) = 0 ) then begin
		  digitosPar:= digitos;
		  suma:= suma + digitosPar
		end
		else begin
		  digitosImpar:= digitosImpar + 1;
		end;
		num:= num div 10;
     
	 
	  writeln ('la suma de los digitos pares es ', suma);
	  writeln ('la cantidad de digitos impar es ', digitosImpar);
	  readln (num); 
     end;
  end;
var
  num: integer;
  

begin
  writeln ('ingresar un numero');
  readln (num);
  leer_digitos(num)
end.
