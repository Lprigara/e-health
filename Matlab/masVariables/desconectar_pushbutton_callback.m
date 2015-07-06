function desconectar_pushbutton_callback(hObject,~,eHealth)
   fclose(eHealth.puerto);
   eHealth.conectado = 0;
   set (eHealth.estadoDispositivo, 'String', 'Dispositivo Desconectado');
   
   fclose(eHealth.fichero);
end