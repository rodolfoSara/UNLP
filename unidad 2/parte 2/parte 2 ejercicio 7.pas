{Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los
autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera
participaron 100 autos. Informar en pantalla:
- Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
- Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.}

Program Ejercicio7;
type
  nombre20= string[20];
var 
  piloto, nombrePrimero, nombreSegundo, nombreUltimo, nombreAnteUlt: nombre20;
  
  i, primero, segundo, ultimo, tiempo, anteultimo :integer;
  
begin
  tiempo:= 0;
  primero:=1000;
  segundo:=998;
  ultimo:= -10;
  anteultimo:= -8;
  nombrePrimero :=',';
  nombreSegundo:=',';
  nombreUltimo:=',';
  nombreAnteUlt:=',';
  
  for i:= 1 to 4 do
  begin
    writeln ('nombre del piloto');
    readln (piloto);
    writeln ('tiempo total');
    readln (tiempo);
    if (tiempo< primero) then
    begin
      segundo:= primero;
      nombreSegundo:= nombrePrimero;
      nombrePrimero:= piloto;
      primero:=tiempo;
    end
    else if (tiempo < segundo) then begin
        segundo:=tiempo;
        nombreSegundo:= piloto;
    end
    else if (tiempo > ultimo) then begin
        anteultimo:= ultimo;
        nombreAnteUlt:= nombreUltimo;
        ultimo:= tiempo;
        nombreUltimo:= piloto;
     end
     else if (tiempo > anteultimo) then begin
          anteultimo:= tiempo;
          nombreAnteUlt:= piloto;
          
    end;
    
  
  end;
  writeln('el ma rapido ', primero , 'el segundo ', segundo, 'el anteultimo ', anteUltimo, 'el ultimo ', ultimo );

end. 
