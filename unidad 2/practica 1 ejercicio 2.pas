{Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un                                   
número X, se escribe |X| y se define como: 
|X| = X cuando X es mayor o igual a cero 
|X| = -X cuando X es menor a cero }
program ifelse_ifelseChecking;
	
var
  num: real;
  
  

begin
  write ('escriba un numero  ');
  readln(num);
  
  if(num < 0)then 
    num:= num * -1;
  
  writeln ('el numero entero es ', num:2:2);

  
	
	
end.

