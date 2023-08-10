{ Implemente un programa que lea dos números reales e imprima el resultado de la división de                               
los mismos con una precisión de dos decimales. Por ejemplo, si se ingresan los valores 4,5 y 7,2,                                   
debe imprimir:   ​El resultado de dividir 4,5 por 7,2 es 0,62 }

program ejercicio1;
var
  caram, clientes, cantCaram, sobra: integer;
  valor: real;
  
  
begin
  readln(caram);
  readln(clientes);
  cantCaram:= caram div clientes;
  sobra:= caram mod clientes;
  valor:= 1.6 * (caram - sobra) ;
  writeln('La cantidad de caramelos por clientes es ', cantCaram);
  writeln('Los caramelos que sobran ', sobra);
  writeln ('Los caramelos que sobran ', valor:1:2);
  
   
end.
