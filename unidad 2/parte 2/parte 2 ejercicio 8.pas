{Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día
del mes, los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se
lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto
total acumulado en ventas de todo el mes.
a) Modifique el ejercicio anterior para que además informe el día en el que se realizó la
mayor cantidad de ventas.}

Program Ejercicio8;
type
  dias= 1..31;
var 
  dia, diaMonto: dias;
  monto, total, montoMayor: real;
  
begin
 total:=0;
 montoMayor:=0;
 writeln ('dia');
 readln (dia);
 writeln ('monto');
 readln (monto);
 while (monto <> 0) do begin
   writeln ('el dia ', dia, 'tiene un monto de ', monto:1:2);
   total:= total + monto;
   if (monto > montoMayor) then begin
     montoMayor:= monto;
     diaMonto:= dia;
   end;
   writeln ('dia');
   readln (dia);
   writeln ('monto');
   readln (monto);
 end;
 writeln ('el total del monto es ', total:1:2, ' el dia con mayor venta es ', diaMonto, ' con un monto de ', montoMayor:1:2);
end. 
