{10. Un centro de investigación de la UNLP está organizando la información de las 320 especies de plantas con las
que trabajan. Para cada especie se ingresa su nombre científico, tiempo promedio de vida (en meses), tipo de
planta (por ej. árbol, conífera, arbusto, helecho, musgo, etc.), clima (templado, continental, subtropical, desértico,
etc.) y países en el mundo donde se las encuentra. La información de las plantas se ingresa ordenada por tipo de
planta y, para cada planta, la lectura de países donde se las encuentra finaliza al ingresar el país 'zzz'. Al finalizar la
lectura, informar:
● El tipo de planta con menor cantidad de plantas.
● El tiempo promedio de vida de las plantas de cada tipo.
● El nombre científico de las dos plantas más longevas.
● Los nombres de las plantas nativas de Argentina que se encuentran en regiones con clima subtropical.
● El nombre de la planta que se encuentra en más países.}

program registroEjercicio10;
type
	especies=record
	tipoPlanta: string;
	nombreCientifico: string;
	promedioVida: real;
	clima: string;
	paises: string;
	cantPaises: integer;
end;


procedure leerEspecies (var e: especies; i:integer; var esArg, esSubtropical: boolean);

begin
	
	if (i< 10) then
	begin
		writeln('escriba el tipo de planta por ej. arbol, conifera, arbusto, helecho, musgo, etc.');
		readln(e.tipoPlanta);
		
		writeln ('Escriba el nombre cientifico');
		readln (e.nombreCientifico);
		
		writeln('Escriba el promedio de vida en meses');
		readln(e.promedioVida);
		
		writeln('escriba el tipo de pclima templado, continental, subtropical, desértico, etc.');
		readln(e.clima);
		if (e.clima = 'subtropical') then
				esSubtropical:= True;
				
		
		writeln('escriba los paises donde se encuentra');
		readln(e.paises);
		while (e.paises <> 'zzz') do
		begin
			e.cantPaises:= e.cantPaises + 1; 
			if (e.paises = 'argentina') then
				esArg:= True;
				
			writeln('escriba los paises donde se encuentra');
			readln(e.paises);
			
		
		end;
		
		writeln('////////////////////////////////////////////////////////////////////////////');
	end;

end;

{● El tipo de planta con menor cantidad de plantas.}
procedure tipoPlantaCantMenor (cantActualTipo:integer; var cantMenorTipo:integer; tipoPlantaActual:string; var tipoPlantaMenor:string );
begin
	if (cantActualTipo < cantMenorTipo) then
	begin
		cantMenorTipo:= cantActualTipo;
		TipoPlantaMenor:= tipoPlantaActual;
		
	end;
end;

{● El tiempo promedio de vida de las plantas de cada tipo.}


function tiempoPromedioVida (sumaTiempoVida, cantPlantaPorEspecie:real): real;
var
	resultadoPromedioVida: real;
begin
		resultadoPromedioVida:= sumaTiempoVida / cantPlantaPorEspecie;
		tiempoPromedioVida:= resultadoPromedioVida; 
end;


{● El nombre científico de las dos plantas más longevas.}
procedure plantasMasLongevas (e: especies; var nombreMasLongeva1, nombreMasLongeva2: string; var promedioVidaMasLongevo1, promedioVidaMasLongevo2: real);
begin
	 if (e.promedioVida > promedioVidaMasLongevo1 ) then
	 begin
		promedioVidaMasLongevo2:= promedioVidaMasLongevo1;
		nombreMasLongeva2:= nombreMasLongeva1; 
		promedioVidaMasLongevo1:= e.promedioVida;
		nombreMasLongeva1:= e.nombreCientifico; 
	 
	 end
	 else if (e.promedioVida > promedioVidaMasLongevo2 ) then
	 begin
		promedioVidaMasLongevo2:= e.promedioVida;
		nombreMasLongeva2:= e.nombreCientifico; 
	 end;
end;


{● El nombre de la planta que se encuentra en más países.}
procedure cantidadPaisesMayor (e: especies; var cantPaisesMayor: integer; var nombreCantPaisesMayor: string );
begin
	if (e.cantPaises > cantPaisesMayor ) then
	begin
		cantPaisesMayor:= e.cantPaises;
		nombreCantPaisesMayor:= e.nombreCientifico;
	end;
end;


var
	 planta: especies;
	 i, cantActualTipo, cantMenorTipo, cantPaisesMayor: integer;
	 tipoPlantaActual, TipoPlantaMenor, nombreMasLongeva1, nombreMasLongeva2, nombreCantPaisesMayor:string;
	 sumaTiempoVida, cantPlantaPorEspecie, promedioVidaMasLongevo1, promedioVidaMasLongevo2: real;
	 esArg, esSubtropical: boolean; 
begin
	i:=1;
	
	{● El tipo de planta con menor cantidad de plantas.}
	cantMenorTipo:=10000;
	tipoPlantaMenor:='';
	{● El nombre científico de las dos plantas más longevas.}
	nombreMasLongeva1:= '';
	nombreMasLongeva2:= ''; 
	promedioVidaMasLongevo1:= 0;
	promedioVidaMasLongevo2:=0;
	
	{planta en mas paises}
	cantPaisesMayor:= 0;
	nombreCantPaisesMayor:='';
	
	{plantas de argentina y clima subtropical}
	esArg:= False;
	
	
	leerEspecies(planta, i, esArg, esSubtropical);
	while (i<=10) do
	begin
		tipoPlantaActual:= planta.tipoPlanta;
		cantActualTipo:=0; 	{● El tipo de planta con menor cantidad de plantas.}
		
		{● El tiempo promedio de vida de las plantas de cada tipo.}
		sumaTiempoVida:= 0;
		cantPlantaPorEspecie:=0;
	
		{● El tipo de planta con menor cantidad de plantas.}
		while (planta.tipoPlanta = tipoPlantaActual) and (i<=10) do
		begin
			cantActualTipo:= cantActualTipo + 1; 
			
			{● El tiempo promedio de vida de las plantas de cada tipo.}
			cantPlantaPorEspecie:= cantPlantaPorEspecie + 1;
			sumaTiempoVida:= sumaTiempoVida + planta.promedioVida;
			
			{● El nombre científico de las dos plantas más longevas.}
			plantasMasLongevas (planta, nombreMasLongeva1, nombreMasLongeva2, promedioVidaMasLongevo1, promedioVidaMasLongevo2);
			
			{● El nombre de la planta que se encuentra en más países.}
			cantidadPaisesMayor (planta, cantPaisesMayor, nombreCantPaisesMayor);
			
			{plantas de argentina y clima subtropical}
			if (esArg) and (esSubtropical) then
				writeln ('El nombre de la planta que se encuentra en Argentina con clima subtropical ', planta.nombreCientifico);
			
				
			planta.cantPaises:=0;
			{plantas de argentina y clima subtropical}
			esArg:= False;
			esSubtropical:= False;
			
			leerEspecies(planta, i, esArg, esSubtropical);
			i:=i+1;  
			
		end; {planta.tipoPlanta:= tipoPlantaActual}
		writeln('terminamos de procesar el tipo de planta ', tipoPlantaActual);
		writeln('-------------------------------------------------------------');
		
		tipoPlantaCantMenor (cantActualTipo, cantMenorTipo, tipoPlantaActual, tipoPlantaMenor);
		writeln('el tiempo promedio de vida del tipo de planta: ', tipoPlantaActual, ' es de ',(tiempoPromedioVida (sumaTiempoVida, cantPlantaPorEspecie)):2:2);
		writeln('-------------------------------------------------------------');
	
	end;
	
	{● El tipo de planta con menor cantidad de plantas.}
	writeln('-------------------------------------------------------------');
	writeln ('El tipo de planta con menor cantidad de especies es ', tipoPlantaMenor);
	writeln(' el total de especies es ', cantMenorTipo);
	writeln('-------------------------------------------------------------');
	{● El nombre científico de las dos plantas más longevas.}
	writeln('');
	writeln('-------------------------------------------------------------');
	writeln('El nombre cientifico de la planta mas longeva es ', nombreMasLongeva1, 'con una vida de ', promedioVidaMasLongevo1:2:2, ' meses ');
	writeln ('El nombre cientifico de la SEGUNDA planta mas longeva es ', nombreMasLongeva2, ' con una vida de ', promedioVidaMasLongevo2:2:2, ' meses ');
	writeln('-------------------------------------------------------------');
	{● El nombre de la planta que se encuentra en más países.}
	writeln('');
	writeln('-------------------------------------------------------------');
	writeln ('el nombre de la planta que se encuentra en mas paises es ', nombreCantPaisesMayor, ' con un total de paises ', cantPaisesMayor);
	writeln('-------------------------------------------------------------');
	
end.

