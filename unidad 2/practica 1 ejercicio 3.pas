program ifelse_ifelseChecking;
	
var
  num1, num2, num3: integer;
  
  

begin
  write ('escriba numero 1 ');
  readln(num1);
  write ('escriba numero 2 ');
  readln(num2);
  write ('escriba numero  ');
  readln(num3);
  if(num1 > num2) and (num2 > num3) then 
    writeln ('numero 1 es mayor a 2')

  else if( num2 > num3) then 
     writeln ('numero 2 es mayor a 1')

	
  else 
    writeln('los numeros son iguales')
	
	
end.


