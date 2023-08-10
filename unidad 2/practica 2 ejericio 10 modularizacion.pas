{10. Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando llega
el número 123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus dígitos
pares y la cantidad de dígitos impares que posee.}

program modularizacionParte2ejericicio9;


Procedure secuencia (num: integer; var sumaPar:integer; var cantDigImpar: integer  );
	var dig: integer;
begin
     sumaPar:=0;
	cantDigImpar:=0;
	
	while (num <> 0) do
	begin
		dig:= num MOD 10;
		writeln('el digito es ', dig);
		if ((dig mod 2) = 0) then begin
			sumaPar:= sumaPar + dig;
			
		end	
		else begin
		    cantDigImpar:= cantDigImpar + 1;
		    
		 end;
		num:= num div 10;
		writeln('el numero es ', num);
	end;
     
end; 
var
num, sumaPar, cantDigImpar: integer;


begin 
    
	 
	writeln('escribir un numero');
	readln(num);
	while (num <> 12345) do {pascal no aguanta nro tan alto como 123456}
		begin
		    secuencia(num, sumaPar, cantDigImpar); 
		    writeln('la cant Dig Impar  es ', cantDigImpar);
		    writeln('la suma de digitos par es ', sumaPar);
			writeln('escribir un numero');
			readln(num);
		end;


end.

