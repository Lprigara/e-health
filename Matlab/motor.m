
function motor()
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
    try
        fopen(serialPort);
    catch
        warning('Problema abriendo el puerto serial.');
        fclose(serialPort);
        return;
    end

    global KEY_IS_PRESSED
    KEY_IS_PRESSED = 0;

    i =1; 
    while ~KEY_IS_PRESSED
       try 
           data =fscanf(serialPort,'%s');
           disp(data);
           data = regexp(data, '\-', 'split'); %separar datos en campos
           bpm(i)= str2double(data(1));
           so2(i)= str2double(data(2));
           temp(i)= str2double(data(3));
           air(i)= str2double(data(4));
    %         position = str2double(data(5));
    %         skinConductance = str2double(data(6));
    %         skinResistence = str2double(data(7));

            %Imprimir las gráficas

           figure(1);
           set(gcf, 'KeyPressFcn', @myKeyPressFcn);

           subplot(2,2,1);
           plot(bpm);
           title('bpm'); xlabel('Time'); ylabel('bpm');

           subplot(2,2,2);
           plot(so2);
           title('so2'); xlabel('time'); ylabel('so2');

           subplot(2,2,3);
           plot(temp);
           title('Temp'); xlabel('time'); ylabel('temp');

           subplot(2,2,4);
           plot(air);
           title('AirFlow'); xlabel('Samples'); ylabel('air');

           i=i+1;
       catch 
           warning('Error procesando datos.');
           fclose(serialPort);
           return;
       end
    end

    %cerrar puerto serie
    fclose(serialPort);
end

 function myKeyPressFcn(hObject, event)
 global KEY_IS_PRESSED
    KEY_IS_PRESSED  = 1;
    disp('Se pulsó una tecla') 
 end

 
 