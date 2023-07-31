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
    writeln ('mayor ', num1,'medio ', num2, 'menor ', num3 )
    
  else if( num1 > num2) and (num3 > num2) then 
     writeln ('mayor ', num1,'medio ', num3, 'menor ', num2 )

  else if( num2 > num3) and (num3 > num1) then 
     writeln ('mayor ', num2,'medio ', num3, 'menor ', num1 )
     
  else if( num2 > num3) and (num1 > num3) then 
     writeln ('mayor ', num2,'medio ', num1, 'menor ', num3 )
    
  else if( num3 > num2) and (num2 > num1) then 
     writeln ('mayor ', num3,'medio ', num2, 'menor ', num1 )

	
  else 
    writeln ('mayor ', num3,'medio ', num1, 'menor ', num2 )
	
	
end.


