{Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente información de
los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom, Centrino, etc.),
cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y tamaño en
nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores se lee de
forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores (que no
debe procesarse). Se pide implementar un programa que lea información de los microprocesadores de la empresa
importadora e informe:

● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de
al menos 2 Ghz.

}

program registroEjercicio6;
type
	pc=record
	nucleos: integer;
	
	marca: string;
	linea:string;
	velocidad: integer;
	tamanoTransitores:integer;
end;

procedure leerPc (var p:pc);
begin
	writeln('Escriba la cantidad de cores o núcleos de procesamiento 1, 2, 4, 8');
	readln(p.nucleos);
	
	if (p.nucleos <> 0) then
	begin
		writeln('Escriba la marca del pc  Intel, AMD, NVidia, etc');
		readln(p.marca);
		
		writeln('Escriba la línea Xeon, Core i7, Opteron, Atom, Centrino, etc.');
		readln(p.linea);
		
		writeln('Escriba la velocidad del reloj medida en Ghz');
		readln(p.velocidad);
		
		writeln('Escriba la tamaño en nanómetros (nm) de los transistores 14, 22, 32, 45, etc.');
		readln(p.tamanoTransitores);
		
		writeln ('/////////////////////////////////////')
	end;
end;

{ Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm. }

procedure dosNucleos ( p: pc);
begin
	if (p.nucleos > 2) and (p.tamanoTransitores >= 22) then
	begin
		writeln('-*********************************************************************************-');
		writeln('El procesador ', p.marca, ' de la linea ', p.linea, ' tiene mas de dos nucleos y tamano de transitores de 22 nm ');
		
		writeln('El tamano de transitor es ', p.tamanoTransitores, ' la cantidad de nucleos que tiene son ' , p.nucleos );
		writeln('-*********************************************************************************-');
	end;

end;

{ Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm. }

procedure maxPc (p: pc; nucleoMayor, nucleoMayor2:integer; var marcaMayor, marcaMayor2: string);
begin
	if (p.tamanoTransitores = 14) then
	begin
		if (p.nucleos > nucleoMayor) then 
		begin
			nucleoMayor2:= nucleoMayor;
			marcaMayor2:=  marcaMayor;
			nucleoMayor:= p.nucleos;
			marcaMayor:= p.marca;
					
		end
		else if (p.nucleos > nucleoMayor2) then
		begin
			nucleoMayor2:= p.nucleos;
			marcaMayor2:= p.marca;
		
		end;
	
	end;

end;


{● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de
al menos 2 Ghz.}

procedure procesadorMulticore (p: pc; var cantMulticore: integer);
begin
	if (p.nucleos > 1) and (p.marca = 'intel') or (p.marca = 'amd') and (p.velocidad >= 2) then
			cantMulticore:= cantMulticore + 1;

end;

var
 compu: pc;
nucleoMayor, nucleoMayor2, cantMulticore:integer;
marcaMayor, marcaMayor2: string;


begin

	nucleoMayor:= 0;
	nucleoMayor2:= 0; 
	cantMulticore:= 0;
	marcaMayor:= ' ';
	marcaMayor2:= ' ';
	
	leerPc(compu);
	while (compu.nucleos <> 0) do 
	begin
		
		maxPc (compu, nucleoMayor, nucleoMayor2, marcaMayor, marcaMayor2);
		dosNucleos (compu);
		procesadorMulticore (compu, cantMulticore );
		
		leerPc(compu);
	end;
if (marcaMayor <> ' ') then
	writeln ('la marca del nucleo mayor con transistores de 14 nm. es ', marcaMayor);
	
if (marcaMayor2 <> ' ') then
	writeln ('y la marca con segundo nucleo mayor es ',  marcaMayor2);


writeln ('la cantidad procesadores multicore (de mas de un core) de Intel o AMD, cuyos relojes alcancen velocidades de al menos 2 Ghz  es ',  cantMulticore);


end.
	
	
