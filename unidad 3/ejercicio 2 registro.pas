{El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año
2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido
en el inciso a).
c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al
ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos realizados durante los meses de verano
* (enero, febrero y marzo) y la cantidad de casamientos realizados en los primeros 10 días de
cada mes. Nota: utilizar el módulo realizado en b) para la lectura de fecha.}

program registroEjercicio2;

type
		fechaCasamiento = record
		dia: integer;
		mes:integer;
		ano: integer;
	end;

procedure leerFecha (var f:fechaCasamiento);
begin
	writeln('Ingresar el dia');
	readln(f.dia);

	writeln('Ingresar el mes');
	readln(f.mes);

	writeln('ingresar el año');
	readln(f.ano);
end;

function esVerano (f:fechaCasamiento; var cantVerano:integer):integer;
	

	begin
		if (f.mes= 1) or (f.mes= 2) or (f.mes= 3) and (f.ano= 2019) then
		begin
			cantVerano:= cantVerano + 1;
			esVerano:= cantVerano;
		end;
	end;

function primerosDiezdias (a:fechaCasamiento; var cantPrimero10:integer):integer;
	

	begin
		if (a.dia > 0) and (a.dia <= 10) then
		begin
			cantPrimero10:= cantPrimero10 + 1;
			primerosDiezdias:= cantPrimero10;
		end;
end;

var
	cantVerano, cantPrimero10: integer;
	casamiento:fechaCasamiento;
	
begin
	cantVerano:=0;
	cantPrimero10:=0;	
	leerFecha(casamiento);
	cantPrimero10:=0;
	
	while (casamiento.ano<> 2020) do
	begin
		
		cantVerano:= esVerano(casamiento, cantVerano);
		cantPrimero10:= primerosDiezdias(casamiento, cantPrimero10);
		leerFecha(casamiento);
	end;
	
	writeln ('la cantidad de casamientos de verano del 2019 son', cantVerano);
	writeln ('casamientos en los primeros 10 dias del mes ', cantPrimero10)
end.
		
		
