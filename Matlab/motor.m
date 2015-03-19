
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

    count1=0; 
    count2=0; 
    count3=0; 
    time=0;
    time2=0;
    time3=0;
    
    tic
    while ~KEY_IS_PRESSED
        try 
           data =fscanf(serialPort,'%s'); %lectura del puerto serial
           disp(data);
           data = regexp(data, '\-', 'split'); %separar datos en campos
           set(gcf, 'KeyPressFcn', @myKeyPressFcn); %para la ejecución al pulsar una tecla
           
           if(strcmp(data(1),'Cab1'))
               count1 = count1 +1;
               time(count1) = toc;
               
               bpm(count1)= str2double(data(2));
               so2(count1)= str2double(data(3));
 
               figure(1);
               plot(time, bpm);
               title('BPM'); xlabel('Time(s)'); ylabel('bpm');

               figure(2);
               plot(time, so2);
               title('SO2'); xlabel('Time(s)'); ylabel('so2');
            
           elseif(strcmp(data(1),'Cab2'))
               count2 = count2 +1;
               time2(count2) = toc;
               temp(count2)= str2double(data(2));
         
               figure(3);
               plot(time2, temp);
               title('Temp'); xlabel('Time(s)'); ylabel('temp');
          
           elseif(strcmp(data(1),'Cab3'))
               count3 = count3 +1;
               time3(count3) = toc;
               air(count3)= str2double(data(2));
             
               figure(4)
               plot(time3, air);
               title('AirFlow'); xlabel('Time(s)'); ylabel('air');
           end
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

 
 