{a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de numA.
b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea secuencias de pares de
números hasta encontrar el par (0,0), e informe la cantidad total de pares de números leídos y la cantidad de
pares en las que numB es el doble de numA.
Ejemplo: si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los valores
4 (cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA)..}

Program Ejercicio5;

procedure par (numA, numB:integer);
var doble, contador: integer;
  
  begin
  doble:=0;
  contador:=0;
    while (numA <> 0) and (numB<> 0) do begin
		if (numB = 2*numA) then
		  doble:= doble + 1;
		  contador:= contador + 1;
		  writeln('el numero 2 es el doble que el primero');
		  writeln ('escriba el primner numero');
		  readln (numA);
		  writeln ('escriba el segundo numero');
		  readln (numB);
    end;
    writeln ('la cantidad de pares leidos son: ', contador);
    writeln ('la cantidad donde el 2do num es el doble del primero son: ', doble);
  end;
  
var num1, num2: integer;  
begin
  writeln ('escriba el primner numero');
  readln (num1);
  writeln ('escriba el segundo numero');
  readln (num2);
  par (num1, num2)
end. 
