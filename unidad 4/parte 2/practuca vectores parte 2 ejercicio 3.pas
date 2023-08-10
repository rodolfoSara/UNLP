{3. Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello,
cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta
con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida
por el camión (medida en kilómetros).
a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza
cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.
c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
recorrida sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez.}

program ejercicio3;

const
	df=200;

type
	rangoDias= 1..31;
	
	recordViajes = record
	distancia: real;
	dia: rangoDias;
	dineroTransportado: real;
	end;
	
	vectorViajes = array [1..df] of recordViajes;
	diaMenosDinero = array [1..31] of recordViajes;
	
procedure leerViajes (var vi: recordViajes);
begin
	
	
	writeln('dia del viaje');
	readln(vi.dia);
		
	writeln ('monto de dinero transportado ');
	readln(vi.dineroTransportado);
	
	writeln('//////////////////////////////////////////////////');
end;

procedure leerVectorViajes (var vv: vectorViajes; var dl: integer);
var
	distancia: real;

begin
	writeln ('distancia recorrida por el camion - medida en km');
	readln(distancia);
	
	while (distancia <> 0) and (dl < df) do
	begin
		dl:= dl + 1;
		vv[dl].distancia:= distancia;
		leerViajes(vv[dl]);
		if (dl < df) then
		begin
			writeln ('distancia recorrida por el camion - medida en km');
			readln(distancia);
		end;
			
	end;
	
end;

{b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.}

procedure promedio (vv: vectorViajes; dl: integer);
var
	suma, promedio: real;
	i: integer;
begin
	suma:= 0;
	{- El monto promedio transportado de los viajes realizados}
	for i:= 1 to dl do
	begin
		suma:= suma + vv[i].dineroTransportado;
		
	end;
	promedio:= suma / dl;
	
	writeln('el monto del promedio transportado de los viajes ', promedio:2:2);
end;


{- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.}

procedure IniciarDiaMenosDineroVector (var dmd:diaMenosDinero);
var
	j: integer;
begin
	for j:= 1 to 31 do
	begin
		dmd[j].distancia:= 0;
		dmd[j].dineroTransportado:= 0;
	end;
end;

procedure contardiaMenosDineroVector (vv: vectorViajes; dl: integer; var dmd:diaMenosDinero);
var
	i, j: integer;
begin
	
	for	i:= 1 to dl do
	begin
		j:= vv[i].dia;
		dmd[j].distancia:= dmd[j].distancia + vv[i].distancia;
		dmd[j].dineroTransportado:= dmd[j].dineroTransportado +  vv[i].dineroTransportado;
	end;
	
	
end; 

procedure diaMenosDineroVector ( var dmd:diaMenosDinero); 
var
	j, dia: integer;
	distanciaMenosDinero, menosDinero: real;
begin
	distanciaMenosDinero:= 0;
	menosDinero:= 32000;
	
	for j:= 1 to 31 do
	begin
		if (dmd[j].dineroTransportado < menosDinero) then
		begin
			menosDinero:= dmd[j].dineroTransportado;
			distanciaMenosDinero:= dmd[j].distancia;
			dia:= j;
		end;
	end;
	writeln ('el dia con menos dinero transportado es ', dia ,' con un total de dinero de ', menosDinero, ' y una distancia de ', distanciaMenosDinero );
end;

{- La cantidad de viajes realizados cada día del mes.}

procedure viajesXdia ( vv: vectorViajes; var dmd:diaMenosDinero; dl: integer); 
var
	i, j: integer;
begin
	for i:= 1 to dl do
	begin
		j:= vv[i].dia;
		dmd[j].dia:= dmd[j].dia + 1;
	end;

end;

{c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
recorrida sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez.}

procedure borrar (var vv: vectorViajes; var dl: integer);
var
	i, j, pos: integer;
begin
	for i:= 1 to dl do
	begin
		if (vv[i].distancia = 100) then
		begin
			pos:= i;
			for j:= pos to (dl - 1) do
				vv[j]:= vv[j + 1];
			dl:= dl - 1;
		end;
	end;
end;



var
	dl, i: integer;
	vv: vectorViajes;
	dmd: diaMenosDinero;
begin
	dl:= 0;
	leerVectorViajes (vv, dl);
	
	 promedio (vv, dl);
	

		
	 IniciarDiaMenosDineroVector (dmd);
	 contardiaMenosDineroVector (vv, dl, dmd);
	 for i:= 1 to dl do
		writeln ('dia menos dinero ', dmd[i].dineroTransportado);
		
	 diaMenosDineroVector ( dmd); 
		
	viajesXdia (vv, dmd, dl); 
	for i:= 1 to dl do
		writeln ('En el dia ', i , ' se viajo ', dmd[i].dia);
	
	borrar (vv, dl);
	
	for i:= 1 to dl do
		writeln ('como queda vv borrando', vv[i].dia);
	
	
end.
	
