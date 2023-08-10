{7. Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada
centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de
investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por universidad y
la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar:
● Cantidad total de centros para cada universidad.
● Universidad con mayor cantidad de investigadores en sus centros.
● Los dos centros con menor cantidad de becarios.}


program registroEjercicio7;

type
	CentrosInvestigacion = record
	nombre: string;
	universidad: string;
	cantInvestigadores: integer;
	cantidadBecarios: integer;
end;


procedure leerCentros (var c:CentrosInvestigacion );
begin
	writeln ('Escribe nombre del centro abreviado  // ej. LIDI, LIFIA, LINTI// ');
	readln(c.nombre);
	
	writeln ('Escribe la universidad a la que pertenece en que pertenece al centro ');
	readln(c.universidad);
	
	writeln ('Escribe la cantidad de investigadores ');
	readln(c.cantInvestigadores);
	
	if (c.cantInvestigadores > 0) then
		begin
		writeln ('Escribe la cantidad de becarios ');
		readln(c.cantidadBecarios);
		end;
end;

procedure uniMasInvestigadores (c: CentrosInvestigacion; var uniMayor: string; var mayorCant: integer );
 begin
	if (c.cantInvestigadores > mayorCant) then 
	begin
		mayorCant:= c.cantInvestigadores;
		uniMayor:= c.universidad;
	
	end;
end;


procedure uniMenosBecarios (c: CentrosInvestigacion; var menosBecarios1, menosBecarios2: integer; var nombreMenosBecarios1, nombreMenosBecarios2: string); 
begin
	if (c.cantidadBecarios < menosBecarios1) then 
	begin
		menosBecarios2:= menosBecarios1;
		nombreMenosBecarios2:= nombreMenosBecarios1;
		menosBecarios1:= c.cantidadBecarios;
		nombreMenosBecarios1:= c.nombre;
	
	end
	else if (c.cantidadBecarios < menosBecarios2) then
	begin
	    menosBecarios2:= c.cantidadBecarios;
		nombreMenosBecarios2:= c.nombre;
	
	end;
end;


var
centros: CentrosInvestigacion;
uniActual, uniMayor, nombreMenosBecarios1, nombreMenosBecarios2: string;
cantCentros, mayorCant, menosBecarios1, menosBecarios2: integer;

begin
	uniActual:='';
	uniMayor:='';
	nombreMenosBecarios1:='';
	nombreMenosBecarios2:='';
	cantCentros:=0;
	mayorCant:=0;
	menosBecarios1:=29000;
	menosBecarios2:=32000;

	leerCentros(centros);
	while (centros.cantInvestigadores <> 0) do 
	begin
		uniActual:= centros.universidad;
		cantCentros:=0;
		while (centros.universidad = uniActual) do
		begin
			cantCentros:= cantCentros + 1;
			uniMenosBecarios (centros, menosBecarios1, menosBecarios2, nombreMenosBecarios1, nombreMenosBecarios2); 
			leerCentros(centros);
		end;
		writeln('/////////// cantidad de centros //////////////// ');
		writeln('La cantidad total de centros de la universidad ', uniActual, ' es de ' , cantCentros);
		writeln('/////////////////////////////////////////////// ');
		uniMasInvestigadores(centros, uniMayor, mayorCant );
		
	end;


writeln('la universidad con mayor cantidad de investigadores es ', uniMayor);
writeln('el centro con menor cantidad de becarios es ', nombreMenosBecarios1);
writeln('el SEGUNDO centro con menor cantidad de becarios es ', nombreMenosBecarios2);


end.
