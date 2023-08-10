{8. La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el programa
Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un código único, un título, el docente
coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan del proyecto, el nombre de la
escuela y la localidad a la que pertenecen. Cada escuela puede presentar más de un proyecto. La información se
ingresa ordenada consecutivamente por localidad y, para cada localidad, por escuela. Realizar un programa que
lea la información de los proyectos hasta que se ingrese el proyecto con código -1 (que no debe procesarse), e
informe:
● Cantidad total de escuelas que participan en la convocatoria 2020 y cantidad de escuelas por cada localidad.
● Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
● Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares.}


program registroEjercicio8;

type

	docente = record
	dniDoc: integer;
	nombreDoc: string;
	apellidoDoc: string;
	emailDoc: string;
	end;
	
	
	proyectoMemoria = record
	codigo: integer;
	titulo: string;
	docenteCoordinador: docente;
	cantAlumnos: integer;
	nombreEscuela: string;
	localidad:string;
	end;
	
procedure leedProyecto (var p:proyectoMemoria );
begin
	writeln ('Codigo del proyecto');
	readln (p.codigo);
	if (p.codigo <> -1) then 
	begin
		writeln ('Titulo del proyecto');
		readln (p.titulo);
		
		writeln ('DNI docente Coordinador del proyecto');
		readln (p.docenteCoordinador.dniDoc);
		
		writeln ('NOMBRE del docente Coordinador del proyecto');
		readln (p.docenteCoordinador.nombreDoc);
		
		writeln ('APELLIDO del docente Coordinador del proyecto');
		readln (p.docenteCoordinador.apellidoDoc);
		
		
		writeln ('EMAIL del docente Coordinador del proyecto');
		readln (p.docenteCoordinador.emailDoc);
		
		writeln ('Cantidad de alumnos en el proyecto');
		readln (p.cantAlumnos);
		
		writeln ('Nombre de la escuela que participa');
		readln (p.nombreEscuela);
		
		
		writeln ('Localidad de la escuela');
		readln (p.localidad);
	end;
end;

procedure mayorCantAlumnos (p:proyectoMemoria; var MasAlumnos1, MasAlumnos2: integer; var nombreEscMasAlumnos1, nombreEscMasAlumnos2: string );
begin
	if (p.cantAlumnos > MasAlumnos1) then
	begin
		MasAlumnos2:= MasAlumnos1;
		nombreEscMasAlumnos2:= nombreEscMasAlumnos1;
		
		MasAlumnos1:= p.cantAlumnos;
		nombreEscMasAlumnos1:= p.nombreEscuela;
	end
	else if (p.cantAlumnos > MasAlumnos2) then
	begin
		MasAlumnos2:= p.cantAlumnos;
		nombreEscMasAlumnos2:= p.nombreEscuela;
	end;
end;

{Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares.}

function digitosIguales (p:proyectoMemoria):boolean;
var 
cantPar, cantImpar, digito: integer;
begin
	cantPar:=0;
	cantImpar:=0;
	digito:= p.codigo mod 2; 

	while (digito <> 0) do
	begin
		if (digito mod 2 = 0) then
			cantPar:= cantPar + 1
		else
			cantImpar:= cantImpar + 1;
	
		digito:= digito div 10;
	end;
digitosIguales := (cantPar = cantImpar );
	
end;
 

var
proyecto: proyectoMemoria;
localidadActual, nombreEscMasAlumnos1, nombreEscMasAlumnos2:string;
cantEscuelas, cantLocalidad, MasAlumnos1, MasAlumnos2: integer;

begin
	cantLocalidad:=0;
	cantEscuelas:=0;
	nombreEscMasAlumnos1:='';
	nombreEscMasAlumnos2:='';
	
	leedProyecto (proyecto);
	while (proyecto.codigo <> -1) do
		begin
		cantLocalidad:=0;
		localidadActual:= proyecto.localidad;
		
		
		
		while ( proyecto.localidad = localidadActual ) and  (proyecto.codigo <> -1) do
			begin
			
				cantEscuelas:= cantEscuelas + 1;
				cantLocalidad:= cantLocalidad +1;
				if (proyecto.localidad = 'Daireaux') then
					begin
						if (digitosIguales(proyecto)) then
							writeln ('el titulo del proyectoto con cantidad de pares e impares de la localidad Daireaux es ', proyecto.titulo);
					end;
				mayorCantAlumnos ( proyecto, MasAlumnos1, MasAlumnos2, nombreEscMasAlumnos1, nombreEscMasAlumnos2);
				leedProyecto (proyecto);
				
			end;
		   writeln('La cantidad de escuelas en la localidad ', localidadActual, ' es de ', cantLocalidad );
		end;
		
writeln ('La escuela con mayor participantes de alumnos es ', nombreEscMasAlumnos1);
writeln ('La segunda escuela con mayor participantes es ', nombreEscMasAlumnos2);	
end.
