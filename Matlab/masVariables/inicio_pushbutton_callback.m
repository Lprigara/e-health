function inicio_pushbutton_callback(hObject,~,eHealth)
    start(eHealth.escaneoTimer);
    start(eHealth.variablesTimer);
    
    posicionVector = [0.4, 0.35, 0.55, 0.6];    % posicion de los ejes
    a = axes('Position',posicionVector, 'xlimmode', 'manual')
    p = plot(0,NaN,'-r', 'parent', a, 'tag', 'grafica')
    grid on; 
    
    set(eHealth.mostrarEcgTimer, 'TimerFcn', @(o, e) pintaECG(eHealth,p));
    start(eHealth.mostrarEcgTimer);
    
end