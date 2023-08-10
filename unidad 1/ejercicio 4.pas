{ Implemente un programa que lea dos números reales e imprima el resultado de la división de                               
los mismos con una precisión de dos decimales. Por ejemplo, si se ingresan los valores 4,5 y 7,2,                                   
debe imprimir:   ​El resultado de dividir 4,5 por 7,2 es 0,62 }

program ejercicio1;
var
  diam, radio, pi, area, perimetro: real;
  
  
begin
  pi:=3.14;
  readln(diam);
  
  radio:= diam / 2;
  area:= pi * (radio*radio);
  perimetro:= 2*pi*radio;
  writeln('el diametro es: ', diam:1:2);
  writeln('El radio es: ', radio:1:2);
  writeln('El area es: ', area:1:2);
  writeln('El perimetro es: ', perimetro:1:2);
end.
