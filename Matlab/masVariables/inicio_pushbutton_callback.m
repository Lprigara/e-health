function inicio_pushbutton_callback(hObject, ~, variables, interfaz)
    start(interfaz.escaneoTimer);
    start(interfaz.variablesTimer);
    
    posicionVector = [0.4, 0.35, 0.55, 0.6];    % posicion de los ejes
    a = axes('Position',posicionVector, 'xlimmode', 'manual');
    interfaz.grafica = plot(0,NaN,'-r', 'parent', a, 'tag', 'grafica');
    grid on; 
    
    set(interfaz.mostrarEcgTimer, 'TimerFcn', @(o, e) pintaECG(variables, interfaz));
    start(interfaz.mostrarEcgTimer);
    
end