program Vectores;
const
	cant_datos = 5;
type
	vdatos = array[1..cant_datos] of real;
	
procedure cargarVector(var v:vdatos; var dimL : integer);
var
	num: integer;
begin
	writeln('escriba un numero para dar valor');
	readln (num);
	while (dimL < cant_datos) and (num <> 0) do
	begin
		dimL:= dimL + 1;
		v[dimL]:= num;
		
		if (dimL < cant_datos) then
		begin
			writeln('escriba un numero para dar valor');
			readln (num);
		end;
	end;
end;


procedure modificarVectorySumar(var v:vdatos; dimL : integer; n: real; var suma: real);
var 
	i: integer;
begin
	for i:=1 to dimL do
	begin
		
		v[i]:= v[i] + n;
		write (v[i]);
		suma:= suma + v[i];
		
		if (i > dimL) then
			writeln('escriba un numero para intrementar el valor');
			readln(n);
	end;

writeln ('sumaaaaaaaaaaaaaaaaaaaaa', suma);

end;


var
datos : vdatos;
dim : integer;
num, suma : real;



begin
dim := 0;
suma := 0;
	cargarVector(datos, dim);
	
	writeln ('ingrese un numero a sumar');
	readln(num);
	modificarVectorySumar(datos, dim, num, suma);
	writeln('La suma de los valores es: ', suma);
	writeln('Se procesaron: ', dim, 'numeros') 
end.
