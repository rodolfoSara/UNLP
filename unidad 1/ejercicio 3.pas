{ Implemente un programa que lea dos números reales e imprima el resultado de la división de                               
los mismos con una precisión de dos decimales. Por ejemplo, si se ingresan los valores 4,5 y 7,2,                                   
debe imprimir:   ​El resultado de dividir 4,5 por 7,2 es 0,62 }

program ejercicio1;
var
  diam, num2, resultado: real;
  
  
begin
  
  readln(num1);
  readln(num2);
  resultado:= num1 / num2;
  writeln(resultado:1:2);
  
end.
