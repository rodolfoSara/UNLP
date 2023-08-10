{14. a. Realizar un módulo que calcule el rendimiento económico de una plantación de soja. El módulo debe
recibir la cantidad de hectáreas (ha) sembradas, el tipo de zona de siembra (1: zona muy fértil, 2: zona estándar,
3: zona árida) y el precio en U$S de la tonelada de soja; y devolver el rendimiento económico esperado de dicha
plantación.
Para calcular el rendimiento económico esperado debe considerar el siguiente rendimiento por tipo de zona:
Tipo de zona Rendimiento por ha
1 6 toneladas por ha
2 2,6 toneladas por ha
3 1,4 toneladas por ha}

program modularizacionParte2ejericicio14;

procedure calcularRendimiento (ha, precio: real; zona:integer; var rendimiento: real);

begin
  if (zona = 1) then
     rendimiento:= 6 * ha * precio
  else if (zona = 2) then
     rendimiento:= 2.6 * ha * precio
  else if (zona = 3) then
     rendimiento:= 1.4 * ha * precio;
  writeln('el rendimiento del terreno es ', rendimiento);
end;


var
  ha, rendimiento, precio: real;
  zona: integer;
  
  
begin
    rendimiento:= 0;
	writeln ('ingresar la cantidad de hectareas');
	readln (ha);

	writeln ('ingresar el precio de la tonelada de soja');
	readln(precio);

	writeln('ingrese la zona 1, 2 o 3');
	readln(zona);

	while (zona < 1) or (zona > 3) do begin
		writeln('ingrese las opciones 1, 2 o 3');
		readln(zona);
			
	end;
    
    calcularRendimiento (ha, precio, zona, rendimiento);
    

end.
  
   
