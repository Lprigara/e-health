function conectar(eHealth)
    %borrar previos
    delete(instrfind({'Port'},{'COM9'}));

    %crear objeto serie    
    eHealth.puerto = serial('COM9');
    set(eHealth.puerto, 'Baudrate', 9600);
    set(eHealth.puerto, 'StopBits', 1);
    set(eHealth.puerto, 'DataBits', 8);
    set(eHealth.puerto, 'Parity', 'none');
    warning('off','MATLAB:serial:fscanf:unsuccessfulRead');

    %cerrar el puerto si por algo se quedó abierto
    fclose(eHealth.puerto);

    %abrir puerto serie
    try
        fopen(eHealth.puerto);
        eHealth.conectado = 1;
    catch
        fclose(eHealth.puerto);
        eHealth.conectado = 0;
        errordlg('Error en la conexión, inténtelo de nuevo','WARNING');
        return;
    end
end