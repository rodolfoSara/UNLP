{ARBA desea procesar información obtenida de imágenes satelitales de campos sembrados con soja en la
provincia de Buenos Aires. De cada campo se lee: localidad, cantidad de hectáreas sembradas y el tipo de zona
(1, 2 ó 3). La lectura finaliza al leer un campo de 900 ha en la localidad ‘Saladillo’, que debe procesarse. El precio
de la soja es de U$S320 por tn. Informar:
●La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000.
●La localidad del campo con mayor rendimiento económico esperado.
●La localidad del campo con menor rendimiento económico esperado.
●El rendimiento económico promedio.}

program catorceA;
type
  cadena30= string [30];

procedure maximo (var rendimiento: real; var localidad:cadena30);
  var
    rendimientoMax: real;
    localidadMax: cadena30;
    
begin
  
  rendimientoMax:= -1;
  localidadMax:= ' ';
  if (rendimiento > rendimientoMax ) then begin
    rendimientoMax:= rendimiento;
    localidad:=localidadMax;
  end;
end;


    

procedure zonaSiembra ( tipoZona: integer; ha, precio: real; var rendimiento: real; var localidad: cadena30);

  
begin
  
  repeat
	  if (tipoZona = 1) then begin
		rendimiento:= ha * precio * 6
	  end
	  else if (tipoZona = 2) then begin
		rendimiento:= ha * precio * 2.6
	  end
	  else if (tipoZona = 3) then begin
		rendimiento:= ha * precio * 1.4
	  end
	  else begin
		writeln ('no existe ese rendimiento por hectarea' )
	  end;
	  writeln ('la localidad y el rendimiento es: ', localidad, rendimiento );
	  maximo (rendimiento, localidad);
	  
	  writeln ('escriba zona');
	  readln (tipoZona);
	  writeln ('escriba las hectares');
	  readln (ha);
	  writeln ('escriba las localidad');
	  readln (localidad);
	  
	  
	  
  until (ha > 900) and (localidad <> 'Saladillo');
end;


  
  

var 
  rendimiento, ha, precio: real; tipoZona: integer;
  localidad: cadena30;

begin
  rendimiento:=0;
  precio:= 320;
  writeln ('escriba zona');
  readln (tipoZona);
  writeln ('escriba las hectares');
  readln (ha);
  writeln ('escriba las localidad');
  readln (localidad);
  zonaSiembra (tipoZona, ha, precio, rendimiento, localidad);
  writeln ('su ganancias son ', rendimiento:2:2);
end.
