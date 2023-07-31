{Realice un programa que lea 10 números e informe cuál fue el mayor número leído. Por ejemplo, si
se lee la secuencia:
3  5  6  2  3  10  98  8  -12   9
deberá informar: “El mayor número leído fue el 98”}

Program Ejercicio2;
var 
  i, numero, mayor, max:integer;
  
  begin 
    numero := 0;
    mayor:=0;
    i:=0;
    max:=-1;
    for i:= 1 to 10 do begin
     read (numero); 
     if (numero > max) then
       max:=numero
  end;
  writeln ('el numero mayor es ' , max);
  
end. 
