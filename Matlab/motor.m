%borrar previos
delete(instrfind({'Port'},{'COM4'}));

%crear objeto serie
serialPort = serial('COM4');
set(serialPort, 'Baudrate', 9600);
set(serialPort, 'StopBits', 1);
set(serialPort, 'DataBits', 8);
set(serialPort, 'Parity', 'none');
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');

%cerrar el puerto si por algo se qued� abierto
fclose(serialPort);

%abrir puerto serie
fopen(serialPort);

numMuestras = 400;

  bpm= zeros(1, numMuestras);
  so2 = zeros(1, numMuestras);
  temp = zeros(1, numMuestras);
  air = zeros(1, numMuestras);

 for i=1:numMuestras    
  	data =fscanf(serialPort,'%s');
    disp(data);
    data = regexp(data, '\-', 'split'); %separar datos en campos
    bpm(i)= str2double(data(1));
    so2(i)= str2double(data(2));
    temp(i)= str2double(data(3));
    air(i)= str2double(data(4));
 end
 
%Imprimir las gr�ficas
figure(1)
plot(bpm);
title('bpm'); xlabel('Time'); ylabel('bpm');

figure(2)
plot(so2);
title('so2'); xlabel('time'); ylabel('so2');

figure(3)
plot(temp);
title('Temp'); xlabel('time'); ylabel('temp');

figure(4)
plot(air);
title('AirFlow'); xlabel('Samples'); ylabel('air');
 
%cerrar puerto serie
fclose(serialPort);
 
 