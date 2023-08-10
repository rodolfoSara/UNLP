program sumador;
type
vnums = array [1..10] of integer;
var
numeros : vnums;
i: integer; 

procedure cargarVector(var v:vdatos; var dimL : integer);



begin
	for i:= 1 to 10 do
		numeros[i]:= numeros[i] + (numeros[i - 1]);
	
	for i:= 1 to 10 do
		writeln (numeros[i]);

end.
