{Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos                                     
uno de ellos no lo era. Por ejemplo, si se leen los caracteres “​a e o​” deberá informar “Los tres son                                         
vocales”, y si se leen los caracteres “​z a g​” deberá informar “al menos un carácter no era vocal”. }

program practica1_ejercicio8;
	
var
  caracter : char;
  cant: integer;
  
  

begin
  cant:=0;
  write ('escriba un caracter  ');
  readln(caracter);
  
  if (caracter = 'a') or (caracter = 'e') or (caracter = 'i') or (caracter = 'o') or (caracter = 'u') then begin
      cant:= cant + 1
  end;
  
  
  writeln ('escriba un caracter  ');
  readln(caracter);
  
  if (caracter = 'a') or (caracter = 'e') or (caracter = 'i') or (caracter = 'o') or (caracter = 'u') then begin
      cant:= cant + 1
  end;
  
  writeln ('escriba un caracter  ');
  readln(caracter); 
   
  if (caracter = 'a') or (caracter = 'e') or (caracter = 'i') or (caracter = 'o') or (caracter = 'u') then begin
      cant:= cant + 1
  end;
  writeln ('La cantidad de volcales son: ', cant);
end.
