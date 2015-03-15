%borrar previos
delete(instrfind({'Port'},{'COM4'}));

%crear objeto serie
serialPort = serial('COM4');
set(serialPort, 'Baudrate', 9600);
set(serialPort, 'StopBits', 1);
set(serialPort, 'DataBits', 8);
set(serialPort, 'Parity', 'none');
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');

%cerrar el puerto si por algo se quedó abierto
fclose(serialPort);

%abrir puerto serie
fopen(serialPort);


 for i=1:400    
  	data =fscanf(serialPort,'%s');
    disp(data);
    data = regexp(data, '\-', 'split'); %separar datos en campos
    BPM(i,1)= data(1,1);
    SO2(i,1)= data(1,2);
    temp(i,1)= data(1,3);
    air(i,1)= data(1,4);
 end
 
%Imprimir las gráficas
BPM = str2double(BPM);
figure(1)
plot(BPM);
title('BPM'); xlabel('Time'); ylabel('bpm');

SO2 = str2double(SO2);
figure(2)
plot(SO2);
title('SO2'); xlabel('time'); ylabel('so2');

temp = str2double(temp);
figure(3)
plot(temp);
title('Temp'); xlabel('time'); ylabel('temp');

air = str2double(air);
figure(4)
plot(air);
title('AirFlow'); xlabel('Samples'); ylabel('air');
 
%cerrar puerto serie
fclose(serialPort);
 
 