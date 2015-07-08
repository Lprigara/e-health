function conectar(serialComunication)
    serialComunication.COM = 'COM9';
    serialComunication.baudRate = 9600;
    serialComunication.stopBits = 1;
    serialComunication.dataBits = 8;
    serialComunication.paridad = 'none';
    
    %borrar previos
    delete(instrfind({'Port'},{'COM9'}));
     
    %crear objeto serie    
    serialComunication.puerto = serial('COM9');
    set(serialComunication.puerto, 'Baudrate', serialComunication.baudRate);
    set(serialComunication.puerto, 'StopBits', serialComunication.stopBits);
    set(serialComunication.puerto, 'DataBits', serialComunication.dataBits);
    set(serialComunication.puerto, 'Parity', serialComunication.paridad);
    warning('off','MATLAB:serial:fscanf:unsuccessfulRead');

    %cerrar el puerto si por algo se quedó abierto
    fclose(serialComunication.puerto);

    %abrir puerto serie
    try
        fopen(serialComunication.puerto);
        serialComunication.conectado = 1;
    catch
        fclose(serialComunication.puerto);
        serialComunication.conectado = 0;
        errordlg('Error en la conexión, inténtelo de nuevo','WARNING');
        return;
    end
end