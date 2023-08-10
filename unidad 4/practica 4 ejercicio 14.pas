{El repositorio de código fuente más grande en la actualidad, GitHub, desea estimar el monto invertido en
los proyectos que aloja. Para ello, dispone de una tabla con información de los desarrolladores que
participan en un proyecto de software, junto al valor promedio que se paga por hora de trabajo:

Realizar un programa que procese la información de los desarrolladores que participaron en los 1000
proyectos de software más activos durante el año 2017. De cada participante se conoce su país de
residencia, código de proyecto (1 a 1000), el nombre del proyecto en el que participó, el rol que cumplió en
dicho proyecto (1 a 5) y la cantidad de horas trabajadas. La lectura finaliza al ingresar el código de proyecto
-1, que no debe procesarse. Al finalizar la lectura, el programa debe informar:
a) El monto total invertido en desarrolladores con residencia en Argentina.
b) La cantidad total de horas trabajadas por Administradores de bases de datos.
c) El código del proyecto con menor monto invertido.
d) La cantidad de Arquitectos de software de cada proyecto.}


program ejercicio14;
const
	df=3;
	
type
	
	
	proyecto= record
	pais: string;
	codigo: integer;
	nombreProyecto: string;
	rol: integer;
	cantHoras: integer;
	end;
	
	proyectoVector = array [1..df] of proyecto;
	codigoVector = array [1..5] of integer;
	cantidadHoras = array [1..5] of integer;
	
	valorHoraVector = array [1..5] of real;
	
	
procedure leerProyecto (var p: proyecto);
begin
	writeln('Pais de residencia del programador');
	readln(p.pais);
	
	writeln('Codigo del proyecto');
	readln(p.codigo);
	
	if (p.codigo <> -1) then
	begin
		writeln('nombre del proyecto');
		readln(p.nombreProyecto);
		
		writeln('Rol: 1 Analista Funcional, 2 Programador, 3 Administrador de bases de datos, 4 Arquitecto de software, 5 Administrador de redes y seguridad');
		readln(p.rol);
		
		writeln('Cantidad de horas del rol');
		readln(p.cantHoras);
	end;
	writeln('/////////////////////////////////////');
end;

procedure leerProyectoVector (var pv: proyectoVector; var dl: integer );
var
	codigoActual, cantArq: integer;
	
begin
	leerProyecto(pv[dl]);
	while ( pv[dl].codigo <> -1) and (dl < df) do
	begin
		cantArq:= 0;
		dl:= dl + 1;
		codigoActual:=  pv[dl].codigo;
		while (pv[dl].codigo = codigoActual) and ( pv[dl].codigo <> -1) and (dl < df) do
		begin
			if (pv[dl].rol = 4) then
				cantArq:= cantArq + 1;
			
			leerProyecto(pv[dl]);
			dl:= dl + 1;
		end;
		writeln ('La cantidad de Arquitecto de software en el proyecto ', codigoActual, ' es ', cantArq );
	end;
end;

{a) El monto total invertido en desarrolladores con residencia en Argentina.}

procedure inicializarCV (var cv: codigoVector);
var
	i:integer;
begin
	for i:= 1 to 5 do
		cv[i]:= 0;
end;


procedure inicializarCantHoras (var ch: cantidadHoras);
var
	i:integer;
begin
	for i:= 1 to 5 do
		ch[i]:= 0;
end;

procedure cuentoCodigos (pv: proyectoVector; var cv: codigoVector; var ch: cantidadHoras; dl: integer); 
var
	i, j :integer;
begin
	
	for i:= 1 to dl do
	begin
		if (pv[i].pais = 'arg') then
		begin
			j:= pv[i].rol;
			ch[j]:= ch[j] + pv[j].cantHoras
		end;
	end;
	
end;

function montoTotal(cv: codigoVector; ch: cantidadHoras):real;
var
	uno, dos, tres, cuatro, cinco, total: real;
begin
	uno:=  35.20 * ch[1];
	dos:=  27.45 * ch[2];
	tres:=  31.03 * ch[3];
	cuatro:=  44.28 * ch[4];
	cinco:=   39.87 * ch[5];
	
	total:= uno + dos + tres + cuatro + cinco;
	montoTotal:= total;	 
end;

{aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa}


{b) La cantidad total de horas trabajadas por Administradores de bases de datos.}
function cantHoras (pv: proyectoVector; dl:integer):integer;
var
	totalHoras, i: integer;
begin
	totalHoras:=0;
	for i:= 1 to dl do
	begin
		if (pv[i].rol = 3) then
			totalHoras:= totalHoras + pv[i].cantHoras;
	end;
	cantHoras:= totalHoras
end; 

{c) El código del proyecto con menor monto invertido.}
procedure leerValorHora (var vh: valorHoraVector);
begin
	vh[1]:= 35.20;
	vh[2]:= 27.45;
	vh[3]:= 31.03;
	vh[4]:= 44.28;
	vh[5]:= 39.87;
end; 


procedure menorMonto (pv: proyectoVector; dl:integer; vh: valorHoraVector);
var
	montoProyecto, montoMenor: real;
	codigoMenorMonto: integer;
	i, j: integer;
begin
	
	montoMenor:= 30000;
	codigoMenorMonto:= 0;
	
	for i:= 1 to dl do
		begin
			montoProyecto:=0;
			j:= pv[i].rol;
			montoProyecto:= pv[i].cantHoras * vh[j];
			
			if (montoProyecto < montoMenor) then
			begin
				montoMenor:= montoProyecto;
				codigoMenorMonto:= pv[i].codigo;
			
			end;
		end;

	writeln('El codigo del proyecto con menor monto es ', codigoMenorMonto)
end;



var
	proyectoV: proyectoVector;
	dl:integer;
	cv: codigoVector;
	ch: cantidadHoras;
	vh: valorHoraVector;
begin
	dl:=1;
	leerProyectoVector(proyectoV, dl);
	
	{monto total en argentina}
	inicializarCV (cv);
	inicializarCantHoras (ch);
	 cuentoCodigos (proyectoV, cv, ch, dl); 
	writeln('El total invertido en dolares en desarrolladores con residencia en ARG es ', montoTotal(cv, ch):2:2 );
	writeln ('La cantidad de horas en programadores de base de datos: ', cantHoras(proyectoV, dl));
	
	{****************}
	
	leerValorHora (vh);
	menorMonto (proyectoV, dl, vh);
	

end.
