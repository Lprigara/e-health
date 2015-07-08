function parar_pushbutton_callback(hObject,~,interfaz)
    stop(interfaz.escaneoTimer);
    stop(interfaz.variablesTimer);
end