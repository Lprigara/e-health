function desconectar_pushbutton_callback(hObject, ~, serial, interfaz)
   fclose(serial.puerto);
   serial.conectado = 0;
   set (interfaz.estadoDispositivo, 'String', 'Dispositivo Desconectado');
   
   fclose(interfaz.fichero);
end