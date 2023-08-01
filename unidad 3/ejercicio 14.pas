{a. Realizar un módulo que calcule el rendimiento económico de una plantación de soja. El módulo debe
recibir la cantidad de hectáreas (ha) sembradas, el tipo de zona de siembra (1: zona muy fértil, 2: zona estándar,
3: zona árida) y el precio en U$S de la tonelada de soja; y devolver el rendimiento económico esperado de dicha
plantación.
Para calcular el rendimiento económico esperado debe considerar el siguiente rendimiento por tipo de zona}

program catorceA;

procedure zonaSiembra ( tipoZona: integer; ha, precio: real; var rendimiento: real);
  
begin
  
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
end;    

var rendimiento, ha, precio: real; tipoZona: integer;

begin
  writeln ('escriba zona');
  readln (tipoZona);
  writeln ('escriba las hectares');
  readln (ha);
  writeln ('escriba precio');
  readln (precio);
  zonaSiembra (tipoZona, ha, precio, rendimiento);
  writeln ('su ganancias son ', rendimiento:2:2);
end.
