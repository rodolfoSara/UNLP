{11. El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para
ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada la
lectura, el programa debe procesar los datos e informar:
a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}


program ejercicio11;

const
	df= 5; {200}
	
type
	fb= record
	titulo: string;
	autor: string;
	cantGusta: integer;
	cantClick: integer; 
	cantComentarios: integer;
	end;
	
	
	fbVector= array [1..df] of fb;
	
procedure leerRecord (var f: fb);
begin
	writeln('Titulo');
	readln(f.titulo);
	
	writeln('Autor');
	readln(f.autor);
	
	writeln('Cantidad de Me gusta');
	readln(f.cantGusta);
	
	writeln('Cantidad de Clicks');
	readln(f.cantClick);
	
	writeln('Cantidad de comentarios');
	readln(f.cantComentarios);
	
	writeln('/////////////////////////////')

end;
	
procedure cargarVector (var fv: fbVector );
var
	i: integer;
begin
	for i:= 1 to df do
		leerRecord (fv[i]);

end;


{a) Título de la foto más vista (la que posee mayor cantidad de clics).}
procedure fotoVista (fv: fbVector; var cantClickMayor: integer; var tituloMayor: string);
var 
	i:integer;
begin
	for i:= 1 to df do
	begin
		if (fv[i].cantClick > cantClickMayor) then
		begin
			cantClickMayor:= fv[i].cantClick;
			tituloMayor:= fv[i].titulo;
		end;
	end;
end;

{b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.}
function masMeGusta (fv: fbVector):integer;
var
	cant, i:integer;
begin
	cant:=0;
	
	for i:= 1 to df do
	begin
		if(fv[i].autor = 'Art Vandelay') then
			cant:= cant + fv[i].cantGusta;	
	end;
	masMeGusta:= cant;
end;

{c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}

var
	facebook: fbVector;
	cantClickMayor, i: integer;
	tituloMayor: string;
	
begin
	cantClickMayor:=0;
	tituloMayor:='';
	
	
	cargarVector (facebook );
	fotoVista (facebook, cantClickMayor, tituloMayor);
	
	writeln('El titulo de la foto con mas clicks es ', tituloMayor);
	
	writeln('Cantidad total de me gusta en fotos de Art Vandelay ', masMeGusta(facebook));
	
	for i:= 1 to df do
		writeln('De la foto ', facebook[i].titulo, ' tiene la cantidad de comentarios ', facebook[i].cantComentarios);
	

end.
