{10. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se
completa el vector. Una vez finalizada la carga de datos se pide:
a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.}

program ejercicio10;

const
	df=300;

type	
	salarios= array [1..df] of real;

procedure leerSalario (var sa: salarios; var dl: integer);
var
	num: real; 
begin
	writeln('Escriba el salario');
	readln (num);
	while (num > 0) and (dl< df) do
	begin
		dl:= dl + 1;
		sa[dl]:= num;
		num:= abs(random(maxint));
	end;
end;
procedure imprimirSalario (sa: salarios; dl: integer);
var
	i: integer;
begin
	for i:= 1 to dl do
		writeln (sa[i]:2:2)

end;

procedure incrementoSalario (var sa: salarios; dl:integer);
var
	i: integer;
begin
	for i:= 1 to dl do
		sa[i]:= sa[i] + (sa[i]* 0.15);
end;

procedure promedio (var sa: salarios; dl:integer; var prom:real);
var
	i: integer;
	total: real;
begin
	total:=0;
	for i:= 1 to dl do
		total:= total + sa[i];
	prom:= total / dl;
	
end;

var
	dl: integer;
	salario: salarios;
	prom: real;

begin
	dl:=0;
	prom:= 0;
	
	
	leerSalario (salario, dl);
	writeln ('Salario ');
	imprimirSalario (salario, dl);
	writeln ('Salario mas el incremento');
	incrementoSalario (salario, dl);
	imprimirSalario (salario, dl);
	
	
	promedio (salario, dl, prom);
	writeln ('Promedio salario ', prom:2:2);

end.
