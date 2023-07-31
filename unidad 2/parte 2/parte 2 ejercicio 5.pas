{Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se
ingrese el número 100, el cual debe procesarse. Informar en pantalla:
◦El número máximo leído.
◦El número mínimo leído.
◦La suma total de los números leídos.}

Program Ejercicio5;
 
var 
  
  numero, min, max, suma:integer;
begin
numero:=0;
min:= 32000;
max:=-1;
suma:=0;
  
 repeat 
   readln(numero); 
   if (numero > max) then 
     max:= numero;
   end
   else if (numero < min) then begin
     min:= numero;
   end;
   suma:= suma + numero; 
 until (numero <> 100)
 end
 writeln ('el numero maximo es ',  max);
 writeln ('el numero minimo es ', min);
 writeln ('la suma de todos los numero es ' suma)

end. 
