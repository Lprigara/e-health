function conectar_pushbutton_callback(hObject,~,eHealth)
    conectar(eHealth);    
    if(eHealth.conectado == 1)
       set (eHealth.estadoDispositivo, 'String', 'Dispositivo Conectado');
    end
end