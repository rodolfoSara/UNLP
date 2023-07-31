{Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un                                     
almacén. La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse.                               
Para cada producto leido, el programa deberá indicar si el nuevo precio del producto supera en un                                 
10% al precio anterior.  
Por ejemplo: 
○Si se ingresa el código 10382, con precio actual 40, y nuevo precio 44, deberá imprimir: “el                                 
aumento de precio del producto 10382 no supera el 10%” 
○Si se ingresa el código 32767, con precio actual 30 y nuevo precio 33,01, deberá imprimir: “el                                 
aumento de precio del producto 32767 es superior al 10%}

program practica1_ejercicio7;
	
var
  codigo, precioActual, precioNuevo, porcentaje10: real;
  
  

begin
  write ('escriba codigo  ');
  readln(codigo);
  write ('escriba precio anterior  ');
  readln(precioActual);
  write ('escriba nuevo precio  ');
  readln(precioNuevo);
  porcentaje10:=0;
  
  
  while (codigo <> 32767) do begin
    porcentaje10:= precioNuevo * 100 / precioActual;
    
    if (porcentaje10 > 10) then begin
      writeln('el aumento de precio del producto ' , codigo ,' es superior al 10%');
    end
    else begin
      writeln ('el aumento de precio del producto ' , codigo, ' NO es superior al 10%');   
      
      write ('escriba codigo  ');
      readln(codigo);
      write ('escriba precio anterior  ');
      readln(precioActual);
      write ('escriba nuevo precio  ');
    end;
  end;  
end.
