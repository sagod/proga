// uique_ga.pas			12.02.2012 	Гудулин А.О.
// Модуль, реализующий представление очереди ОБЪЕКТОМ TIQueue
// с соответствующими операциями работы с очередью

unit uique_ga;

interface
	type
		TIQueue = Object
			len: integer;
			val: array[1..10] of integer;
			procedure init;
			function push(n:integer): boolean;
			function pop(var n:integer): boolean;
			function top(var n:integer): boolean;
			function error_handler(count:integer): boolean;
		end;

implementation
	procedure TIQueue.init;
		var
			i: integer;
		begin
			for i:=1 to 10 do
				val[i] := 0;
			len := 0;
		end;

	function TIQueue.push(n:integer): boolean;
		begin
			
			if error_handler(len+1) then begin
				inc(len);
				val[len] := n;
				push := true;
			end
			else
				push := false;
		end;
	
	function TIQueue.pop(var n:integer): boolean;
		var
			i: integer;
		begin
			if error_handler(len) then begin
				n := val[1];
				dec(len);
				for i:=1 to len do
					val[i] := val[i+1];
				pop := true;
			end
			else
				pop := false;
		end;

	function TIQueue.top(var n:integer): boolean;
		begin
			if error_handler(len) then begin
				n := val[1];
				top := true;
			end
			else
				top := false;
		end;
	
	function TIQueue.error_handler(count:integer): boolean;
		var
			error: byte;
		begin
			if (count > 10) then
				error := 1
			else if (count < 1) then
				error := 2
			else
				error := 0;

			case (error) of
				0: error_handler := true;
				1: begin
						writeln('Ошибка! Переполнение очереди.');
						error_handler := false;
					end;
				2: begin
						writeln('Ошибка! В очереди нет элементов.');
						error_handler := false;
					end;
			end;
		end;
end.