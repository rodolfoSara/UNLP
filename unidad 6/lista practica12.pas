{
12. Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de
todos los dispositivos que poseen sus juegos instalados. De cada dispositivo se conoce la versión de Android
instalada, el tamaño de la pantalla (en pulgadas) y la cantidad de memoria RAM que posee (medida en GB).
La información disponible se encuentra ordenada por versión de Android. Realizar un programa que procese
la información disponible de todos los dispositivos e informe:
a. La cantidad de dispositivos para cada versión de Android.
b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
c. El tamaño promedio de las pantallas de todos los dispositivos.
}

program listaPractica12;

type
	celulares = record
		versionAndroid: real;
		tamalloPantalla: real;
		cantRAM: integer;
	end;
	
	listaCel= ^datosCel;
	
	datosCel = record
		elem: celulares;
		sig: listaCel;
	end;
	
procedure leerCelular (var c:celulares );
begin
	writeln ('Con 0 termina el programa');
	writeln ('Version de Android');
	readln (c.versionAndroid);
	if (c.versionAndroid <> 0) then
	begin
		writeln ('Tamano de pantalla');
		readln (c.tamalloPantalla);
		
		writeln ('Casntidad de RAM');
		readln (c.cantRAM);
	end;
	writeln ('/////////////////////////');
end;

procedure agregarAtras (var lc, ult: listaCel; c: celulares );
var
	nue: listaCel;
begin
	new (nue);
	nue^.elem:= c;
	nue^.sig:= nil;
	
	if (lc = nil) then 
		lc:= nue
	else
		ult^.sig:= nue;
	ult:= nue;
end;


procedure cargarLista (var lc: listaCel);
var
	c: celulares;
	ult: listaCel;
begin
	leerCelular (c);
	while (c.versionAndroid <> 0) do
	begin
		agregarAtras (lc, ult, c);
		leerCelular (c);
	end;
end;

{a. La cantidad de dispositivos para cada versión de Android.
b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
c. El tamaño promedio de las pantallas de todos los dispositivos.}

procedure recorrer (lc: listaCel);
var
	aux: listaCel;
	cantDisp, cantLeidos: integer;
	sumaPantalla, promedio: real; 
	
begin
	aux:= lc;
	cantDisp:= 0;
	cantLeidos:= 0;	
	sumaPantalla:= 0;
	while (aux <> nil) do
	begin
		if  (aux^.elem.cantRAM > 3) and (aux^.elem.tamalloPantalla >= 5) then
			cantDisp:= cantDisp +1;
	
		cantLeidos:= cantLeidos + 1;
		sumaPantalla:= sumaPantalla + aux^.elem.tamalloPantalla;		
		
		aux:= aux^.sig;
	end;
	promedio:= sumaPantalla / cantLeidos; 
	writeln('El tamano promedio de pantalla es ', promedio:2:2);
	writeln('La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas ', cantDisp);

end;

procedure imprimir (lc: listaCel);
var
	aux: listaCel;
begin
	aux:= lc;
	while (aux <> nil) do
	begin
		writeln (aux^.elem.versionAndroid:2:2);
		writeln (aux^.elem.tamalloPantalla:2:2);
		writeln (aux^.elem.cantRAM);
		aux:= aux^.sig;
	end;
end;

var
	c:celulares;
	lc, ult: listaCel;
begin
	lc:= nil;
	cargarLista (lc);
	recorrer (lc);
	imprimir (lc);
end.
