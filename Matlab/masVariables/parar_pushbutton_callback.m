function parar_pushbutton_callback(hObject,~,eHealth)
    stop(eHealth.escaneoTimer);
    stop(eHealth.variablesTimer);
    stop(eHealth.mostrarEcgTimer);
end