{Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
*  La cantidad de productos de más de 16 pesos con código par.}

Program Ejercicio6;
 
var 
  
  producto, precio, min1, min2, i, cant:integer;
begin
producto:=0;
precio:= 0;
min1:=28000;
min2:=29000;
i:=0;
cant:= 0;
  
 for i:= 1 to 6 do begin
   writeln('escriba producto');
   readln(producto);
   writeln('escriba precio');
   readln(precio); 
   if (precio < min1) then  begin
     min2:=min1;
     min1:= precio;
   end
   else if (precio < min2) then 
     min2:= precio;
   end;
   
   if (precio = 16) then begin
     cant:= cant + 1 ;
   end;
   
    writeln ('el numero minimo es ',  min1);
	writeln ('el segundo minimo es ', min2);
	writeln ('cantidad de productos de 16 pesos ', cant)
 end.


end. 
