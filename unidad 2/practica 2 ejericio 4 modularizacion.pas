program ejercicio5;

procedure doble (num1, num2: integer; var cantdoble: integer);
 
begin
  
  
  if (num2 = (num1 * 2)) then begin
    writeln('numero 2 es el doble que numero 1');
    cantdoble:= cantdoble + 1;
  end;
end;

var nume1, nume2, dobleCant, cantPares : integer;

begin
    dobleCant:=0;
    cantPares:=0;
	writeln('escribe numero 1');
	readln(nume1);
	writeln('escribe numero 2');
	readln(nume2);
	
	while (nume1 <> 0) and (nume2 <> 0) do begin
		doble(nume1, nume2, dobleCant);
		cantPares:= cantPares +1;
		
		
		writeln('escribe numero 1');
		readln(nume1);
		writeln('escribe numero 2');
		readln(nume2);
		
	
	end;
	writeln('cantidad de pares introducidos ', cantPares);
	writeln('cantidad de numero DOS doble de numero UNO ', dobleCant);
		
    
end.

