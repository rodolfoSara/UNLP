{Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se                                 
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído)
* 
* Modifique el ejercicio anterior para que, luego de leer el número X, se lean ​alosumo​10 números                                  
reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo                                       
número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”. }

program practica1_ejercicio5;
	
var
  num, x, num1, cant: integer;
  
  

begin
  write ('escriba numero  ');
  readln(num);
  cant:=0;
  x:=num *2;
  while (num <> x) and (cant < 10) do begin
    cant:= cant +1;
    
    write ('escriba numero  ');
    readln(num);
  end;
	
end.


