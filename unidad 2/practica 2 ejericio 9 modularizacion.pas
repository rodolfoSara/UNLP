{9. a. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que
posee y la suma de los mismos.
b. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la
cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman exactamente 10, el
cual debe procesarse.}

program modularizacionParte2ejericicio9;

procedure descomponer (num:integer; var suma, cant:integer);
var
 dig:integer;

Begin
  suma:=0;
  cant:=0;
  while (num <> 0) do
    begin
     dig:= num MOD 10;
     suma:= suma + dig;
     num:= num DIV 10;
     cant:= cant + 1;
    end;
end;

	var
		num, suma, cant, cantTotal:integer;

begin 

	cantTotal:=0;

	repeat
		writeln('Escribe un numero');
		readln(num);
	    descomponer (num, suma, cant);
	    cantTotal:= cantTotal + cant;
	    writeln('la cantidad de digitos es ', cant);
	    writeln ('la suma es ', suma);
	until (suma = 10);

   writeln ('la cantidad total de digitos leidos ', cantTotal );


end.



