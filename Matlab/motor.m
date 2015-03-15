%borrar previos
delete(instrfind({'Port'},{'COM4'}));

%crear objeto serie
serialPort = serial('COM4');
set(serialPort, 'Baudrate', 9600);
% set(serialPort, 'StopBits', 1);
% set(serialPort, 'DataBits', 8);
% set(serialPort, 'Parity', 'none');
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
fclose(serialPort);
%abrir puerto serie
fopen(serialPort);


 for i=1:10    
  	data =fscanf(serialPort,'%s');
    disp(data);
end

fclose(serialPort);
 
 