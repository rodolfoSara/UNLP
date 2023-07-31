{4. Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son
los dos números mínimos leídos.
a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual debe procesarse.
b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual no debe procesarse}

Program Ejercicio4;
 
var 
  
  numero, min1, min2:integer;
  
  begin 
    
    numero:=0;
    min1:=32000;
    min2:=29000;
    repeat
      writeln ('dame un numero ');
      readln(numero);
      if (numero < min1) then begin
        min2 := min1;
        min1 := numero;
      end
        
      else if (numero < min2) then begin
        min2:= numero;
      end;
    until (numero <> 0);  
 
    writeln ('el numero menor es ' , min1);
    writeln (' el 2do numero menor es  ' , min2);  
  end. 
