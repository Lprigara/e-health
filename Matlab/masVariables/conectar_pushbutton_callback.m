function conectar_pushbutton_callback(hObject, ~, serial, interfaz)
    conectar(serial);    
    if(serial.conectado == 1)
        set (interfaz.estadoDispositivo, 'String', 'Dispositivo Conectado');
    end
end