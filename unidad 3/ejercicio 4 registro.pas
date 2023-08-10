{Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y
cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos
y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
módulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar
del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.}

program registroEjercicio4;

type
	clientes= record
	codigo: integer;
	cantLineas: integer;
	telefono: integer;
	cantMin: real;
	cantMB: real;
end;

procedure leerClientes (var c: clientes);
begin
	writeln ('el codigo del cliente es ');
	readln(c.codigo);
	
	writeln ('cantidad de Lineas es ');
	readln(c.cantLineas);
	
	writeln ('telefono  es ');
	readln(c.telefono);
	
	writeln ('Cantidad de minutos consumidos ');
	readln(c.cantMin);
	
	writeln ('Cantidad de megas consumidos ');
	readln(c.cantMB);
end;

function cantidadMinutos (c: clientes): real;
var 
	valorPagarMin: real;
	
begin	
	
	valorPagarMin:= 3.40 * c.cantMin;
	cantidadMinutos:= valorPagarMin;
end;

function cantidadMB (c: clientes): real;
var 
	valorPagarMB: real;
	
begin	
	
	valorPagarMB:= 1.35 * c.cantMin;
	cantidadMB:=  valorPagarMB;
end;

var 
	usuario: clientes;
	pagarMin, PagarMB: real;

begin
pagarMin:= 0;
PagarMB:= 0;

	leerClientes(usuario);
	
	
	pagarMin:= cantidadMinutos(usuario);
	PagarMB:= cantidadMB(usuario);
		
	;
	writeln ('La cantidad a pagar de MINUTOS SON ', pagarMin:2:1);
	writeln('--------------------------------------------------');
	writeln ('La cantidad a pagar de Internet SON ', PagarMB:2:1);
end.

