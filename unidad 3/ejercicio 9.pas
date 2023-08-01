{a. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que
posee y la suma de los mismos.
b. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la
cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman exactamente 10, el
cual debe procesarse.}
Program ejercicio9;


Procedure leer_digitos(num: integer; var cantDigitos, suma: integer );

  var
    digitos:integer;
begin
  digitos:=0;
  cantDigitos:=0;
  suma:=0;
  while (num <> 0) do begin
    digitos:= num mod 10;
    cantDigitos:= cantDigitos + 1;
    suma:= suma + digitos;
    num:= num div 10;
    
  end;
 
end;


var
  cantD, num, sumaD: integer;
begin
  cantD:=0;
  sumaD:=0;
  writeln ('escribe numero');
  readln (num);
  leer_digitos (num, cantD, sumaD);
  writeln ('la cantidad de digitos son ', cantD  );
  writeln ('la suma de cada digitos es ', sumaD);
end.
  
  
