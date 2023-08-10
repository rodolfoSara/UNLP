{5. Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.}


program registroEjercicio5;

type
	autos=record
	marca: string;
	modelo:string;
	precio:real;
end;

procedure leerAutos (var a:autos);
begin
	writeln ('Marca del auto ');
	readln(a.marca);
	if (a.marca <> 'ZZZ') then
	begin
		writeln ('Modelo del auto ');
		readln(a.modelo);
		
		writeln ('Precio del auto ');
		readln(a.precio);
	end;
end;


procedure masCaro (a: autos; var precioCaro: real; var modeloCaro: string);
begin
	if (a.precio > precioCaro ) then
	begin
		precioCaro:= a.precio;
		modeloCaro:= a.modelo;
	end;

end;


procedure promedio (sumaPrecio: real; var promedioPrecio: real; cant: real);
begin
  promedioPrecio:= (sumaPrecio / cant);


end;




var
	precioCaro, sumaPrecio, cant, promedioPrecio: real;
	modeloCaro, mismaMarca: string;
	auto: autos;
	
	
begin
	precioCaro:=0;
	sumaPrecio:=0;
	modeloCaro:='';
	mismaMarca:='';
	




	leerAutos (auto);
	while (auto.marca <> 'ZZZ') do
	begin
		cant:= 0;
		promedioPrecio:= 0;
		while (auto.marca = mismaMarca) do
		begin
			cant:= cant + 1;
			mismaMarca:= auto.marca;
			sumaPrecio:= sumaPrecio + auto.precio;
			masCaro (auto, precioCaro, modeloCaro);
			leerAutos (auto);
		end;
		promedio (sumaPrecio, promedioPrecio, cant);
		writeln ('el promedio de precios de la marca es ', promedioPrecio );
	end;
	write ('el modelo mas caro es ', modeloCaro, ' con el precio de ', precioCaro:2:1 );
end.

