{Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La                                     
lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.  
Por ejemplo, se lee la siguiente secuencia: 
33423 
8.40 
19003 
6.43 
-1 
En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo                                   
19003, cuyo promedio fue 6.43, y finalmente el legajo -1 (para el cual no es necesario leer un                                   
promedio). 
Al finalizar la lectura, informar: 
○La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2) 
○La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar                             
1) 
○El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean                           
menor al valor 2500 (en el ejemplo anterior se debería informar 0%)}

program practica1_ejercicio6;
	
var
  legajo, promedio, cantAlumnos, cantPromediosAltos, porcentajePromedio: real;
  
  

begin
  write ('escriba legajo  ');
  readln(legajo);
  write ('escriba promedio  ');
  readln(promedio);
  cantAlumnos:=0;
  cantPromediosAltos:=0;
  porcentajePromedio:=0;
  
  while (legajo <> -1) do begin
    cantAlumnos:= cantAlumnos +1;
    if (promedio > 6.5) then begin
      cantPromediosAltos:= cantPromediosAltos + 1;
    end;
    if (promedio > 8.5) and (legajo < 2500) then begin
      porcentajePromedio:= porcentajePromedio +1;
    end;
    write ('escriba legajo  ');
    readln(legajo);
    write ('escriba promedio  ');
    readln(promedio);
    
  end;
  
    writeln('la cantidad total de alumnos ingresados: ' ,cantAlumnos);
    writeln('la cantidad total de alumnos con promedio mayor a 6.5: ' ,cantPromediosAltos);
    writeln('la cantidad total de alumnos con promedio mayor a 8.5 y legajo menor a 2500: ' ,porcentajePromedio * 100 / cantAlumnos)
  
end.
