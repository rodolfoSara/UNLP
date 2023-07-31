{Realice un programa que lea 10 números e informe cuál fue el mayor número leído. Por ejemplo, si
se lee la secuencia:
3  5  6  2  3  10  98  8  -12   9
deberá informar: “El mayor número leído fue el 98”
* Modifique el programa anterior para que, además de informar el mayor número leído, se
informe el número de orden, dentro de la secuencia, en el que fue leído. Por ejemplo, si se lee la
misma secuencia:
3  5  6  2  3  10  98  8  -12   9
deberá informar: “El mayor número leído fue el 98, en la posición 7”}

Program Ejercicio3;
var 
  i, numero, mayor, max, posicion, posicionMayor:integer;
  
  begin 
    numero := 0;
    mayor:=0;
    i:=0;
    max:=-1;
    posicion:=0;
    posicionMayor:= 0;
    for i:= 1 to 5 do begin
     read (numero);
     posicion:= posicion +1;
     if (numero > max) then begin
       max:=numero;
       posicionMayor:= posicion;
     end;
       
  end;
  writeln ('el numero mayor es ' , max);
  writeln (' la posicion del numero mayor es ' , posicionMayor);  
end. 
