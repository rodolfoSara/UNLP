{b. ARBA desea procesar información obtenida de imágenes satelitales de campos sembrados con soja en la
provincia de Buenos Aires. De cada campo se lee: localidad, cantidad de hectáreas sembradas y el tipo de zona
(1, 2 ó 3). La lectura finaliza al leer un campo de 900 ha en la localidad ‘Saladillo’, que debe procesarse. El precio
de la soja es de U$S320 por tn. Informar:
● La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000.
● La localidad del campo con mayor rendimiento económico esperado.
● La localidad del campo con menor rendimiento económico esperado.
● El rendimiento económico promedio.
* 
Tipo de zona Rendimiento por ha
1 6 toneladas por ha
2 2,6 toneladas por ha
3 1,4 toneladas por ha}

program modularizacionParte2ejericicio14B;


function calcularRendimiento (precio, ha: real; zona: integer; var rendimiento: real): real;
begin
	if (zona = 1) then
		rendimiento:= precio * ha * 6
	else if (zona = 2) then
		rendimiento:= precio * ha * 2.6
	else if (zona = 3) then
		rendimiento:= precio * ha * 1.4;
	
	calcularRendimiento:= rendimiento;

end;


function mayorRendimiento ( localidad: string; rendimiento, mayor: real; var localidadMayor: string): string;
	
	begin
	if (rendimiento > mayor) then begin
		mayor:= rendimiento;
		localidadMayor:= localidad;
	end;
	mayorRendimiento:= localidadMayor;
end;



function menorRendimiento ( localidad: string; rendimiento, menor: real; var localidadMenor: string): string;
	
	begin
	if (rendimiento < menor) then begin
		menor:= rendimiento;
		localidadMenor:= localidad;
	end;
	menorRendimiento:= localidadMenor;
end;


function promedioRendimiento (sumarRendimiento, cantidadCampos: real; var promedio: real ): real;
begin
	promedio:= sumarRendimiento / cantidadCampos;
	promedioRendimiento:= promedio;
end;




var
	localidad, localidadMayor, localidadMenor, LocalidadMayorRendimiento, LocalidadMenorRendimiento: string;
	ha, rendimiento, precio, mayor, menor, cantidadCampos, promedio, sumarRendimiento, promediodecampos: real;
	zona, cant3Febrero: integer;



begin
	precio:= 320;
	cant3Febrero:=0;
	mayor:= 0;
	menor:= 32000;
	localidadMayor:=' ';
	localidadMenor:= ' ';
	cantidadCampos:=0;
	sumarRendimiento:= 0;
	repeat
		writeln('ingrese la localidad');
		readln(localidad);
		writeln('ingrese la cantidad de hectareas');
		readln(ha);
		writeln ('ingrese la zona 1, 2 o 3');
		readln(zona);
		while (zona < 1) or (zona > 3) do begin
		  writeln('las opciones son 1, 2 o 3');
		  readln(zona);
		end;
		cantidadCampos:= cantidadCampos + 1;
		
		rendimiento:= calcularRendimiento (precio, ha, zona, rendimiento);
		
		sumarRendimiento:= sumarRendimiento + rendimiento;
		if ( localidad = 'Tres de Febrero') and (rendimiento >= 100) then
			cant3Febrero:= cant3Febrero + 1;
			
		LocalidadMayorRendimiento:= mayorRendimiento ( localidad, rendimiento, mayor, localidadMayor);
		
		LocalidadMenorRendimiento := menorRendimiento ( localidad, rendimiento, menor, localidadMenor);
		
	until (ha =900) and (localidad= 'Saladillo');

		
	promediodecampos:= promedioRendimiento(sumarRendimiento, cantidadCampos, promedio);
	
	writeln ('la cantidad de campos en Tres de febrero con mayor rendimiento a 10.000 dls son ', cant3Febrero);
	writeln('la localidad con el campo de mayor rendimiento esta en ', LocalidadMayorRendimiento );
	writeln('la localidad con el campo de menor rendimiento esta en ', LocalidadMenorRendimiento );
    writeln('el promedio es ', promediodecampos );
end.
