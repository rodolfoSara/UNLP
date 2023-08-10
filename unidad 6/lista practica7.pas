{7. El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar
proyectos de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio anterior, se
han determinado los siguientes criterios:
- sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
* - no se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse desde la
superficie terrestre con grandes antenas.
A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6), implementar
un programa que:
a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con los
nuevos criterios H2020.
b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de la ESA y
retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro con aquellos que no
los cumplen.
c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad y el
costo total (construcción y mantenimiento) de los proyectos que no serán financiados por H2020. Para ello,
utilice el módulo realizado en b.}

program listaPractica6;

type

	sonda = record
		nombre: string;
		duracionMision: integer;
		costoCostruccion: real;
		costoMantenimiento: real;
		rango: integer;
	end;
	
	listaSonda = ^nodo;
	
	nodo = record
		dato: sonda;
		sig: listaSonda;
	end;
	
	 listaCumple = ^nodoCumple;
	 
	 nodoCumple = record
		dato: sonda;
		sig: listaCumple;
	end;
		
	
	rangoVector= array [1..7] of integer;
	
	
	
procedure leerSonda (var s:sonda);
begin
	writeln ('Nombre de la sonda');
	readln (s.nombre);

	writeln ('Duracion de la sonda en meses');
	readln (s.duracionMision);
	
	writeln ('Costo de construccion');
	readln (s.costoCostruccion);
	
	writeln ('Costo de mantenimiento');
	readln (s.costoMantenimiento);
	
	writeln ('Rango: 1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma');
	readln (s.rango);
	
	writeln ('*********************************************************');
end;

procedure agregarAdelante (var ls: listaSonda; s:sonda);
var
	nue: listaSonda;
begin
	new(nue);
	nue^.dato:= s;
	nue^.sig:= ls;
	ls:= nue;
end;

procedure cargarLista (var ls: listaSonda);
var
	s: sonda;
begin
	
	repeat
		leerSonda (s);
		agregarAdelante (ls, s);
	until (s.nombre = 'gaia');
end;

{a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).}
procedure masCostosa ( var masCosto: real; var nombreMasCostoso: string; costoMantenimiento: real; costoCostruccion: real; nombre: string );
var
	manXcos: real;
	
begin
	manXcos:= costoMantenimiento + costoCostruccion;
	if (manXcos > masCosto) then
	begin
		masCosto:= manXcos;
		nombreMasCostoso:= nombre;
	end; 
	
end;

{b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.}
procedure iniciarVector (var rV: rangoVector);
var
	i:integer;
begin
	begin
		for i:= 1 to 7 do
			rV[i]:= 0;
			writeln('//////////////////////////', rv[i]);
	end;
end;

procedure contarRango (var rV: rangoVector; rango: integer );
begin
	rV[rango]:= rV[rango] + 1;

end;

procedure imprimirRango (rV: rangoVector);
begin	
		writeln('///////////////////////////////');
		writeln('la cantidad de sondas Radio son ', rV[1]);
		writeln('la cantidad de sondas microondas son ', rV[2]);
		writeln('la cantidad de sondas infrarrojo son ', rV[3]);
		writeln('la cantidad de sondas luz visible son ', rV[4]);
		writeln('la cantidad de sondas ultravioleta son ', rV[5]);
		writeln('la cantidad de sondas rayos X son ', rV[6]);
		writeln('la cantidad de sondas rayos gamma son ', rV[7]);
		writeln('///////////////////////////////');
end;

{c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.}

procedure promedioDuracion (ls: listaSonda; promedio: real);
var
	aux: listaSonda;
	
	cantMayorProm: integer;
begin
	aux:= ls;
	cantMayorProm:= 0;
	
	while (aux <> nil) do
	begin
		if (aux^.dato.duracionMision > promedio) then
			cantMayorProm:= cantMayorProm + 1;
		aux:= aux^.sig;
	end;
	writeln('La cantidad de sondas de duracion mayor a la promedio son ', cantMayorProm);
end;

{d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.}
procedure costoMayorPromedio (ls: listaSonda; promedioCosto: real);
var
	aux: listaSonda;
	cantCostoPromedio: integer;
begin
	aux:= ls;
	cantCostoPromedio:= 0;
	while (aux <> nil) do
	begin
		if ((aux^.dato.costoMantenimiento + aux^.dato.costoCostruccion) > promedioCosto ) then
			cantCostoPromedio:=  cantCostoPromedio + 1;
		aux:= aux^.sig;
	end;
	writeln ('La cantidad de sondas con mayor costo al promedio ', cantCostoPromedio);
end;


{/////////////////////////////////////////////////////}


var
	ls: listaSonda;
	
	aux: listaSonda;
	masCosto, {c} promedio, {d} sumaCosto, promedioCosto: real;
	nombreMasCostoso: string;
	{c}cant, suma: integer;
	
	rV: rangoVector;
begin
	ls:= nil;
	cargarLista (ls);
	
	
	aux:= ls;
	{aaaaaaaaaaaaaa}
	masCosto:=0;
	nombreMasCostoso:= '';
	
	{bbbbbbbbbb}
	iniciarVector (rV);
	
	{cccccccccccccc}
	suma:= 0;
	promedio:= 0;
	cant:= 0;
	
	{dddddddddddddd}
	sumaCosto:= 0;
	promedioCosto:= 0;
	
	while (aux <> nil) do
	begin
		{aaaaaaaaaaaaaa}
		masCostosa (masCosto, nombreMasCostoso,  aux^.dato.costoMantenimiento, aux^.dato.costoCostruccion, aux^.dato.nombre );
		
		{bbbbbbbbbbbbbb}		
		contarRango (rV,  aux^.dato.rango);
				
		{ccccccccccccccc}
		suma:= suma + aux^.dato.duracionMision;
		cant:= cant + 1;		
		
		{dddddddddddddd}
		sumaCosto:= sumaCosto + aux^.dato.costoMantenimiento + aux^.dato.costoCostruccion;
		
		
		aux:= aux^.sig;
	end;
	writeln('El  mas costoso con ', masCosto:2:2, ' y nombre ', nombreMasCostoso);
	
	imprimirRango (rV);
	
	{ccccccccccccccc}
	promedio:= suma / cant;
	promedioDuracion (ls,  promedio);
	
	{dddddddddddddddddd}
	promedioCosto:= sumaCosto / cant;
	costoMayorPromedio (ls, promedioCosto);
	
	

end.
		
