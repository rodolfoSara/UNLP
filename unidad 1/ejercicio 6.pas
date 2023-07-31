{ Realice un programa que informe el valor total en pesos de una transacción en dólares. 
Para ello, el programa debe leer el monto total en dólares de la transacción, el valor del 
1 
 
CADP – Práctica 0 – Introducción a la programación  2021 
 
 
dólar al día de la fecha y el porcentaje  (en pesos) de la comisión que cobra el banco por la 
transacción. Por ejemplo, si la transacción se realiza por 10 dólares, el dólar tiene un valor 
20,54 pesos y el banco cobra un 4% de comisión, entonces el programa deberá informar: }

program ejercicio1;
var
  
  pesos, total, dolar, porcentaje: real;
  
  
begin
  readln(pesos);
  dolar:=20.54;
  porcentaje:= 0.04*pesos;
  total:= (pesos / 20.54 ) - porcentaje;
  
  
  
  writeln('La comision es de ', porcentaje:1:2);
  writeln('Su total es ', total:1:2);
 
  
   
end.
