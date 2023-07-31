{Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro                                     
carácter, debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse                                   
una secuencia de números enteros que finaliza con 0. El programa deberá aplicar la operación leída                               
con la secuencia de números, e imprimir el resultado final.  
Por ejemplo: 
○Si se lee el carácter “-” y la secuencia 4   3   5  -6  0 , deberá imprimir: 2 (4 – 3 – 5 - (-6) ) 
○Si se lee el carácter “+” y la secuencia -10  5  6  -1  0, deberá imprimir 0 ( -10 + 5 + 6 + (-1) ) }

program practica1_ejercicio9;
	
var
  signo, numero, suma : Char;
  
  

begin
  suma:='';
  numero:='';
  write ('escriba signo de suma o resta  ');
  readln(signo);
  
    if (signo <> '-') or (signo = '+')  then begin
        writeln ('escriba signo resta (-) o suma (+)');
        write ('escriba un caracter  ');
        readln(signo);
    end;
    
    write ('escriba numeros  ');
    readln(signo);
    while (numero <> '0') do begin
      suma := suma + numero + signo; 
    end,
    writeln(suma)   
  
  
 
end.
