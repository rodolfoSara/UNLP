{5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa
el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos.}

program listaPractica5;

type
	producto = record
		codigo: integer;
		descripcion: string;
		stockActual: integer;
		stockMinimo: integer;
		precio: real;
	end;
	
	prodLista = ^nodo;
	
	nodo = record
		dato: producto;
		sig: prodLista;
	end;
	
procedure leerProducto (var p:producto);
begin
	writeln ('Codigo:');
	readln(p.codigo);
	
	if (p.codigo <> -1) then
	begin
		writeln ('Descripcion:');
		readln(p.descripcion);
		
		writeln ('Stock Actual:');
		readln(p.stockActual);
		
		writeln ('Stock Minimo:');
		readln(p.stockMinimo);
		
		writeln ('Precio:');
		readln(p.precio);
		
		writeln ('///////////////////////////');
	end;
end;

procedure cargarAtras (var pL, ult: prodLista; p: producto);
var
	nueP: prodLista;
begin
	new (nueP);
	nueP^.dato:=p;
	nueP^.sig:= nil;
	
	if (pL = nil) then pL:= nueP
	else
		ult^.sig:= nueP;
	ult:= nueP;
end;
	
procedure cargarListaProducto (var pL:prodLista);
var
	p:producto;
	ult: prodLista;
begin
	leerProducto (p);
	while (p.codigo <> -1) do
	begin
		cargarAtras (pL, ult, p);
		leerProducto (p);
	end;
end;

{a. Porcentaje de productos con stock actual por debajo de su stock mínimo.}	
function stockMinimo (pL:prodLista): real;
var
	cantProd, sotckDebajo: integer;
	porcentage: real;
	aux: prodLista;
begin
	cantProd:= 0;
	sotckDebajo:=0;
	porcentage:= 0;
	aux:= pL;
	while (aux <> nil) do
	begin
		cantProd:= cantProd + 1;
		if (aux^.dato.stockActual < aux^.dato.stockMinimo) then
			sotckDebajo:= sotckDebajo + 1;	
		aux:= aux^.sig;
	end;
	porcentage:= sotckDebajo * 100 / cantProd;
	
	stockMinimo:= porcentage;
end;

{b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.}
function esPar (cod: integer): boolean;
var
	cant, dig: integer;
	ok: boolean;
begin
	cant:= 0;
	while (cod <> 0) do
	begin
		dig:= cod mod 10;
		
		if (dig mod 2 = 0) then
			cant:= cant + 1;
		cod:= cod div 10;
	end; 
	if (cant >= 3) then
		ok:= True
	else
		ok:= false;
	esPar:= ok;
end;

procedure tresDigitos (pL: prodLista);
var
	aux: prodLista;
	cod: integer;
begin
	aux:= pL;
	while (aux <> nil) do
	begin
		cod:= aux^.dato.codigo;
		if (esPar(cod)) then
			writeln ('La descripcion del prodructo con 3 digito pares es ', aux^.dato.descripcion);
		aux:=aux^.sig;
	end; 
end; 

{c. Código de los dos productos más económicos.}
procedure codBarato (pL:prodLista);
var
	codMasBarato1, codMasBarato2: integer;
	precioMasBarato1, precioMasBarato2: real;
	aux: prodLista;
begin
	codMasBarato1:=0;
	codMasBarato1:=0;
	precioMasBarato1:= 32000;
	precioMasBarato2:= 33000;
	aux:= pL;
	while (aux <> nil) do
	begin
		if (aux^.dato.precio < precioMasBarato1) then
		begin
			codMasBarato2:= codMasBarato1;
			precioMasBarato2:= precioMasBarato1;
			codMasBarato1:= aux^.dato.codigo;
			precioMasBarato1:= aux^.dato.precio;
		end
		else
		begin
			codMasBarato2:= aux^.dato.codigo;
			precioMasBarato2:= aux^.dato.precio;
		end;
			
		aux:= aux^.sig;
	end;
	writeln ('El codigo del producto mas barato ', codMasBarato1, ' con un precio de ', precioMasBarato1:2:2 );
	writeln ('El codigo del SEGUNDO producto mas barato ', codMasBarato2, ' con un precio de ', precioMasBarato2:2:2);
end;
	
var
	pL: prodLista;
begin
	cargarListaProducto (pL);
	
	writeln ('El porcentage de productos debajo del stock minimo es ', stockMinimo (pL):2:2);
	
	tresDigitos (pL);
	
	codBarato (pL);

end.
