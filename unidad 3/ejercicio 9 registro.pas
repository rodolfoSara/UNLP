{9. Realizar un programa que lea información de los candidatos ganadores de las últimas elecciones a intendente de
la provincia de Buenos Aires. Para cada candidato se lee: localidad, apellido del candidato, cantidad de votos
obtenidos y cantidad de votantes de la localidad. La lectura finaliza al leer la localidad ‘Zárate’, que debe procesarse.
Informar:
● El intendente que obtuvo la mayor cantidad de votos en la elección.
● El intendente que obtuvo el mayor porcentaje de votos de la elección.}

program registroEjercicio9;
type
 candidato= record
 localidad: string;
 apellidoCandidato: string;
 cantVotos: real;
 cantVotantes: real;
end;


procedure leerVotos (var c: candidato);
begin
	writeln('escriba la localidad');
	readln(c.localidad);
	
	writeln('escriba el apellidoCandidato');
	readln(c.apellidoCandidato);
	
	writeln('escriba el cantidad de Votos');
	readln(c.cantVotos);
	
	writeln('escriba el cantidad de Votantes');
	readln(c.cantVotantes);
	
	writeln('////////////////////////////////////')

end;

procedure mayorCantVotos (c: candidato; var mayorVotos: real; var candidatoMasVotos: string );
begin
	if (c.cantVotos > mayorVotos ) then
	begin
		mayorVotos:= c.cantVotos;
		candidatoMasVotos:= c.apellidoCandidato;
	
	end; 
end;
	
procedure porcentajeCantVotos (c: candidato; var mayorPorcentage:real; var candidatoMayorPorcentage: string );
var
	porcentage: real;
begin
	porcentage:= c.cantVotos * 100  / c.cantVotantes ;
	if (porcentage > mayorPorcentage) then
	begin
		mayorPorcentage:= porcentage;
		candidatoMayorPorcentage:= c.apellidoCandidato;
	
	end;
end;

var
	mayorVotos, mayorPorcentage:real;
	candidatoMayorPorcentage, candidatoMasVotos: string;
	candidatosVotos: candidato; 
	
begin
mayorVotos:= 0;
candidatoMasVotos:=' ';
mayorPorcentage:= 0;
candidatoMayorPorcentage:= ' ';
	repeat
		leerVotos (candidatosVotos);
		mayorCantVotos (candidatosVotos, mayorVotos, candidatoMasVotos);
		porcentajeCantVotos (candidatosVotos, mayorPorcentage, candidatoMayorPorcentage);
	
	until (candidatosVotos.localidad = 'zarate');

writeln('el intendente con mas votos es ', candidatoMasVotos);
writeln('el intendente con mayor porcentage es ', candidatoMayorPorcentage                )

end.
