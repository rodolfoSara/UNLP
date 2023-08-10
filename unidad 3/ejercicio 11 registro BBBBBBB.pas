{11. Una compañía de vuelos internacionales está analizando la información de todos los vuelos realizados por sus
aviones durante todo el año 2019. De cada vuelo se conoce el código de avión, país de salida, país de llegada,
cantidad de kilómetros recorridos y porcentaje de ocupación del avión. La información se ingresa ordenada por
código de avión y, para cada avión, por país de salida. La lectura finaliza al ingresar el código 44. Informar:
● Los dos aviones que más kilómetros recorrieron y los dos aviones que menos kilómetros recorrieron.
● El avión que salió desde más países diferentes.
● La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión.
● La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda.}


program registroEjercicio11;
type
	vuelosAvion = record
	codigoAvion: integer;
	paisSalida: string;
	paisLLegada: string;
	cantKm: real;
	porcentajeOcupacion: real;
end; 

procedure leerVuelos (var v:vuelosAvion);
begin
	writeln('Escriba el codigo del avion ');
	readln(v.codigoAvion);
	
	if(v.codigoAvion <> 44) then
	begin
		writeln('Escriba el pais de salida del avion ');
		readln(v.paisSalida);
			
		writeln('Escriba el pais de llegada del avion ');
		readln(v.paisLLegada);
		
		writeln('Escriba cantidad de KM del avion');
		readln(v.cantKm);
			
			
		writeln('Escriba el porcentage de ocupacion');
		readln(v.porcentajeOcupacion);
		writeln('///////////////////////////////////////////');
	end;
		
end;

procedure cantKmMayor (codigoActual: integer; sumaCantKm:real; var cantKmMayor1, cantKmMayor2: real; var codigoCantKmMayor1, codigoCantKmMayor2: integer );
begin
	if (sumaCantKm > cantKmMayor1) then
	begin
		cantKmMayor2:= cantKmMayor1;
		codigoCantKmMayor2:= codigoCantKmMayor1;
		cantKmMayor1:= sumaCantKm;
		codigoCantKmMayor1:= codigoActual;
	end
	else if (sumaCantKm > cantKmMayor2) then
	begin
		cantKmMayor2:= sumaCantKm;
		codigoCantKmMayor2:= codigoActual;
	
	end;
		

end;

procedure cantKmMenor (codigoActual: integer; sumaCantKm:real; var cantKmMenor1, cantKmMenor2: real; var codigoCantKmMenor1, codigoCantKmMenor2: integer );
begin
	if (sumaCantKm < cantKmMenor1) then
	begin
		cantKmMenor2:= cantKmMenor1;
		codigoCantKmMenor2:= codigoCantKmMenor1;
		cantKmMenor1:=sumaCantKm;
		codigoCantKmMenor1:= codigoActual;	
	end
	else if (sumaCantKm < cantKmMenor2) then
	begin
		cantKmMenor2:=sumaCantKm;
		codigoCantKmMenor2:= codigoActual;	
	
	
	end;
end;

procedure masPiasSalida (codigoActual, cantPaisSalida: integer; var codigoActualMayor, cantPaisSalidaMayor: integer);
begin
	if (cantPaisSalida > cantPaisSalidaMayor) then
	begin
		cantPaisSalidaMayor:= cantPaisSalida; 
		codigoActualMayor:= codigoActual;
	
	end;
		

end; 

var
	vuelo: vuelosAvion;
	sumaCantKm, cantKmMayor1, cantKmMayor2, cantKmMenor1, cantKmMenor2: real;
	codigoCantKmMayor1, codigoCantKmMayor2, codigoCantKmMenor1, codigoCantKmMenor2, codigoActual: integer;
	paisSalidaActual:string;
	cantPaisSalida, cantPaisSalidaMayor, codigoActualMayor, cantVuelos5000km, cantVuelos10000AusNz:integer;
	
begin
	{cantKmMayor}
	cantKmMayor1:=0;
	cantKmMayor2:= 0;
	codigoCantKmMayor1:=0;
	codigoCantKmMayor2:=0;
	
	{cantKmMenor}
	codigoCantKmMenor1:=0;
	codigoCantKmMenor2:=0;
	cantKmMenor1:= 25000;
	cantKmMenor2:=30000;
	
	{conteo de pais de salida}
	paisSalidaActual:= '';
	codigoActualMayor:=0;
	cantPaisSalidaMayor:=0;
	
	{● La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión.}
	cantVuelos5000km:=0;
	
	{● La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda.}
	cantVuelos10000AusNz:=0;

	leerVuelos(vuelo);
	while (vuelo.codigoAvion <> 44) do
	begin
		sumaCantKm:=0;
		codigoActual:= vuelo.codigoAvion;
		
		cantPaisSalida:=1;
		paisSalidaActual:= vuelo.paisSalida;
		while (codigoActual = vuelo.codigoAvion) do
		begin
			sumaCantKm:= sumaCantKm + vuelo.cantKm; 
			if (paisSalidaActual <> vuelo.paisSalida) then
				cantPaisSalida:= cantPaisSalida + 1;
				
			{● La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión.}
			if (vuelo.cantKm > 5000) and (vuelo.porcentajeOcupacion < 60) then
				cantVuelos5000km:= cantVuelos5000km + 1;
				
			{● La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda.}
			if  (vuelo.cantKm < 10000) and (vuelo.paisLLegada = 'australia') or (vuelo.paisLLegada = 'nueva zelanda') then
				cantVuelos10000AusNz:= cantVuelos10000AusNz + 1;
			
			leerVuelos(vuelo);
		end; {codigoActual = vuelo.codigoAvion}
		cantKmMayor (codigoActual, sumaCantKm, cantKmMayor1, cantKmMayor2, codigoCantKmMayor1, codigoCantKmMayor2);
		cantKmMenor (codigoActual, sumaCantKm, cantKmMenor1, cantKmMenor2, codigoCantKmMenor1, codigoCantKmMenor2 );
		
		{conteo de pais de salida}
		masPiasSalida (codigoActual, cantPaisSalida, codigoActualMayor, cantPaisSalidaMayor);

		
		
	end; {while (v.codigoAvion <> 44)}
	
{cantKmMayor}
writeln ('el codigo con mayor cantidad de KM es ', codigoCantKmMayor1, ' con un total de KM: ',cantKmMayor1:2:2);
writeln ('el codigo del segundo con mayor cantidad de KM es ', codigoCantKmMayor2, ' con un total de KM: ',cantKmMayor2:2:2);
{cantKmMenor}
writeln ('el codigo con menor cantidad de KM es ', codigoCantKmMenor1, ' con un total de KM: ',cantKmMenor1:2:2);
writeln ('el codigo del segundo con mrnor cantidad de KM es ', codigoCantKmMenor2, ' con un total de KM: ',cantKmMenor2:2:2);

{conteo de pais de salida}
writeln('el codigo del avion que tiene mas salida de diferentes paises es ', codigoActualMayor, ' con un total de ', cantPaisSalidaMayor, ' paises ');


{● La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión.}
writeln ('La cantidad de vuelos de mas de 5.000 km que no alcanzaron el 60% de ocupacion del avion. ', cantVuelos5000km);		

{● La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda.}
writeln ('La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda ',cantVuelos10000AusNz);
				
end.{final de todo}
