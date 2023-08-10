{12. En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo
Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
a) la cantidad de galaxias de cada tipo.
b) la masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.
c) la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d) el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.}


program ejercicio12;

const
	df=5;

type
	galaxia= record
	nombre: string;
	tipo: string;
	masa: real;
	distancia: real;
	end;
	
    vectorGalaxia= array [1..df] of galaxia;
    
    
procedure leerGalaxia (var g:galaxia);
begin
	writeln ('Nombre de la galaxia');
	readln(g.nombre);
	
	writeln ('Tipo de la galaxia: 1. eliptica, 2 espiral, 3 lenticular, 4 irregular ');
	readln(g.tipo);
	
	writeln ('Masa');
	readln(g.masa);
	
	writeln ('Distancia');
	readln(g.distancia);
	
	writeln ('///////////////////////////////////');
end;

procedure leerVector (var galaxy: vectorGalaxia);
var
	i:integer;
begin
	for i:= 1 to df do
		leerGalaxia (galaxy[i]);

end;

{a) la cantidad de galaxias de cada tipo.}

procedure cantGalaxia (galaxy: vectorGalaxia; var cantEliptica, cantEspiral, cantLenticular, cantIrregular: integer);
var
	i: integer;
begin
	for i:= 1 to df do
	begin
		if (galaxy[i].tipo = 'eliptica') then
			cantEliptica:= cantEliptica + 1
		else if (galaxy[i].tipo = 'espiral') then
			cantEspiral:= cantEspiral + 1
		else if (galaxy[i].tipo = 'lenticular') then
			cantLenticular:= cantLenticular + 1
		else if (galaxy[i].tipo = 'irregular') then
			cantIrregular:= cantIrregular + 1;
	end;
end;


{b) la masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.}

procedure galaxiaMasa (galaxy: vectorGalaxia; var masaTresGalaxias, masaTotal: real);
var
	i:integer;
	
begin
	for i:= 1 to df do
	begin
	if (galaxy[i].nombre = 'via lactea') or (galaxy[i].nombre = 'andromeda') or (galaxy[i].nombre = 'triangulo') then
		masaTresGalaxias:= masaTresGalaxias + galaxy[i].masa;
		
	masaTotal:= masaTotal +  galaxy[i].masa;	
	end;
end;

{c) la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.}
function noIrregulares (galaxy: vectorGalaxia): integer;
var
	i, cant: integer;
begin
	cant:=0;
	
	for i:= 1 to df do
		if (galaxy[i].tipo <> 'irregular' ) and (galaxy[i].distancia < 1000 ) then
			cant:= cant + 1;
	noIrregulares:= cant;
end; 

{d) el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.}

procedure mayorMenor (galaxy: vectorGalaxia);
var
	i:integer;
	max1, max2, min1, min2: real;
	nombreMax1, nombreMax2, nombreMin1, nombreMin2: string; 
begin
	max1:=0;
	max2:= 1;
	min1:= 33000;
	min2:=32000;
	nombreMax1:='';
	nombreMax2:='';
	nombreMin1:='';
	nombreMin2:='';

	for i:= 1 to df do
	begin
		if (galaxy[i].masa > max1) then
		begin
			max2:= max1;
			nombreMax2:= nombreMax1;
			nombreMax1:= galaxy[i].nombre;
			max1:= galaxy[i].masa
		end
		else if (galaxy[i].masa > max2)  then
		begin
			nombreMax2:= galaxy[i].nombre;
			max2:= galaxy[i].masa
		
		end;
		if (galaxy[i].masa < min1) then
		begin
			min2:= min1;
			nombreMin2:= nombreMin1;
			nombreMin1:= galaxy[i].nombre;
			min1:= galaxy[i].masa;		
		end
		else if (galaxy[i].masa < min2) then
		begin
			nombreMin2:= galaxy[i].nombre;
			min2:= galaxy[i].masa;		
		end;
		
	end;
	writeln ('El nombre de la galaxia con mayor masa es ', nombreMax1);
	writeln ('El nombre de la segunda galaxia con mayor masa es ', nombreMax2);
	
	writeln ('El nombre de la galaxia con menor masa es ', nombreMin1);
	writeln ('El nombre de la segunda galaxia con menor masa es ', nombreMin2);
end;

var
	galaxy: vectorGalaxia;
	cantEliptica, cantEspiral, cantLenticular, cantIrregular: integer;
	masaTresGalaxias, masaTotal, porcentage: real;

begin
	cantEliptica:=0;
	cantEspiral:=0;
	cantLenticular:=0;
	cantIrregular:=0;
	
	{masa galaxias}
	masaTresGalaxias:=0;
	masaTotal:=0; 
	porcentage:=0;
	
	leerVector (galaxy);
	
	cantGalaxia (galaxy, cantEliptica, cantEspiral, cantLenticular, cantIrregular);
	writeln(cantEliptica, cantEspiral, cantLenticular, cantIrregular);
	
	
	galaxiaMasa (galaxy, masaTresGalaxias, masaTotal);
	porcentage:= masaTresGalaxias * 100 / masaTotal;
	writeln('La suma de la masa de las 3 galaxias: via lactea, andromeda y triangulo es ', masaTresGalaxias:2:2);
	writeln('La suma de la masa de todas las galaxias es ', masaTotal:2:2);
	writeln('El porcentage de la suma de las 3 galaxias con respecto al total es ', porcentage:2:2);
	
	
	writeln('La cantidad de galaxias no irregulares y a menos de 1000 pc ', noIrregulares (galaxy));
	
	mayorMenor(galaxy);
end.



