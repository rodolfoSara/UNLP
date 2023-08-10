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
	
	df = 4;
	proyecto=4; {1000}
type
	rangoCodigo = -1..1000;
	rangoRol = 1..5;
	
	desarolladores = record
	pais: string;
	codigo: rangoCodigo;
	nombreProyecto: string;
	rol: rangoRol;
	cantHoras: real;
	end;
	
	desarolladoresVector = array [1..df] of desarolladores;
	
	valorHora = array [1..5] of real;
	
	valorPorProyecto = array [1..proyecto] of real;
	
	cantArq = array [1..proyecto] of integer;
	
procedure leerDesarrollador (var d: desarolladores);
begin
	writeln ('Pais del desarrollador');
	readln(d.pais);
	
	writeln('Codigo del proyecto');
	readln(d.codigo);
	
	if (d.codigo <> -1) then
	begin
		writeln('nombre de proyecto');
		readln(d.nombreProyecto);
		
		writeln('Rol: 1 Analista Funcional, 2 Programador, 3 Administrador de bases de datos, 4 Arquitecto de software, 5 Administrador de redes y seguridad');
		readln(d.rol);
		
		writeln('Cantidad de horas trabajadas');
		readln(d.cantHoras);
		
		writeln('///////////////////////////////////////');
	end;
end;

procedure leerDesarolladoresVector (var dv: desarolladoresVector; var dl: integer);
begin
	leerDesarrollador (dv[dl]);
	while (dv[dl].codigo <> -1) and (dl < df) do
	begin		
		dl:= dl + 1;
		leerDesarrollador(dv[dl]);
	end;
end;

procedure iniciarValorHora (var vh:valorHora);
begin
	vh[1]:= 35.20;
	vh[2]:= 27.45;
	vh[3]:= 31.03;
	vh[4]:= 44.28;
	vh[5]:= 39.87;

end; 

{a) El monto total invertido en desarrolladores con residencia en Argentina.}
procedure montoArg (dv: desarolladoresVector; vh:valorHora; dl: integer);
var
	i, j: integer;
	total: real;
begin
	total:= 0;
	
	for i:= 1 to dl do
	begin
		if (dv[i].pais = 'arg') then
		begin
			j:= dv[i].rol;
			total:= total + (vh[j] * dv[i].cantHoras);
		end;
	end;
	writeln ('Lo invertido en desarrolladores de argentina es ', total:2:2);
end;

{b) La cantidad total de horas trabajadas por Administradores de bases de datos.}
function totalBaseDatos (dv: desarolladoresVector; dl:integer):real;
var
	i:integer;
	cantHorasDatos:real;
begin
	cantHorasDatos:= 0;
	
	for i:= 1 to dl do
	begin
		if (dv[i].rol = 3 ) then
			cantHorasDatos:= cantHorasDatos + dv[i].cantHoras;	
	end;
	totalBaseDatos:= cantHorasDatos;
	
end;

{c) El código del proyecto con menor monto invertido.}
{creo nuevo vector con el monto por proyecto}

procedure inicianizarMontoPorProyecto (var vPp: valorPorProyecto);
var
	i:integer;
begin
	for i:= 1 to proyecto do
		vPp[i]:= 0;
end;

procedure montoPorProyecto (dv: desarolladoresVector; vh:valorHora; var vPp: valorPorProyecto; dl: integer);
var
	i, j, s:integer;
	monto: real;
begin
	for i:= 1 to dl do
	begin
			monto:= 0;
			j:= dv[i].rol;
			monto:= vh[j] * dv[i].cantHoras;
			s:= dv[i].codigo;
			vPp[s]:= vPp[s] + monto;
			
	end;
	
end;

procedure menorMonto (vPp: valorPorProyecto; var codMenorMonto: integer; var montoMenor: real; dl:integer);
var
	i: integer;
	
begin
	
	
	for i:= 1 to dl do
	begin
		if (vPp[i] < montoMenor) then
		begin
			montoMenor:=vPp[i];
			codMenorMonto:= i;
			writeln ('el valor codMenorMonto ', codMenorMonto, 'el monto menor es ',montoMenor:2:2);
		end;
	end;
end;

{d) La cantidad de Arquitectos de software de cada proyecto.}

procedure InicializarCantArq (var ca: cantArq);
var
	i: integer;
begin
	for i:= 1 to proyecto do
		ca[i]:= 0;

end;

procedure contarArq (dv: desarolladoresVector; var ca: cantArq; dl: integer);
var
	i, j: integer;
begin
		for i:= 1 to dl do
		begin
			if (dv[i].rol = 4) then
			begin
				j:= dv[i].codigo;
				ca[j]:= ca[j] + 1;
			end;
		end;

end;

procedure imprimiArq (ca: cantArq);
var 
	i: integer;
begin
	for i:= 1 to proyecto do
		writeln ('La cantidad de arq en ', i, ' es ', ca[i]);
end; 

var
	
	dv: desarolladoresVector;
	dl, codMenorMonto: integer;
	
	 vh:valorHora;
	 vPp: valorPorProyecto;
	 
	 montoMenor: real;
	  ca: cantArq;
begin
	dl:=1; 
	montoMenor:= 32000;
	codMenorMonto:= 0;
	
	leerDesarolladoresVector (dv, dl);
	
	iniciarValorHora (vh);
	
	{a) El monto total invertido en desarrolladores con residencia en Argentina.}
	montoArg (dv, vh, dl);
	
	{b) La cantidad total de horas trabajadas por Administradores de bases de datos.}
	writeln('La cantidad de horas trabajadas por adm de base de datos ', totalBaseDatos (dv, dl):2:2);
	 inicianizarMontoPorProyecto (vPp);
	montoPorProyecto (dv, vh, vPp, dl);
	menorMonto (vPp, codMenorMonto, montoMenor, dl);
	writeln ('el codigo del menor monto ', codMenorMonto);
	
	InicializarCantArq (ca);
	contarArq (dv,  ca, dl);
	imprimiArq (ca);

end.
