{6. a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. Al finalizar la
lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.
b. Implemente un programa que invoque al módulo del inciso a. }


{program alcance4a;
var a,b: integer;
procedure uno;
begin
a := 1;
writeln(a);
end;
begin
a:= 1;
b:= 2;
uno;
writeln(b, a);
end.}


program ejercicio6;

procedure leerMax ( num: integer; var max: integer);
begin
  max:=0;
  while (num > 0) do
    begin
      if (num > max ) then
        max:= num;
  writeln('escriba un numero entero');
  readln (num);
    end;
  writeln('el numero maximo es ', max);
end;
var maximo, numero: integer;
begin
  writeln('escriba un numero entero');
  readln (numero);
  leerMax(numero, maximo)
end.

