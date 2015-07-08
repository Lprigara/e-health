function mostrarVariables(interfaz, variables)
   set (interfaz.variablesLista(1), 'String', variables.oxigeno);
   set (interfaz.variablesLista(2), 'String', variables.pulso);
   set (interfaz.variablesLista(3), 'String', variables.temperatura);
   set (interfaz.variablesLista(4), 'String', variables.conductancia);
   
     %Recorrer eje x en función de cada una de las muestras en el tiempo
    %Cada vez que llegue una serie de valores, miramos si es la primera
    %representación para poner el ejex en 0 
    %Si no, empezar el ejex donde terminó la anterior representación
    if(numel(interfaz.ejexGrafica)==1)
        interfaz.ejexGrafica(1)=0;
    else
        interfaz.ejexGrafica(1)=interfaz.ejexGrafica(end)+(3/9);
    end
    
    %Representar en el ejey el ECG con respecto al ejex
    for i=2:numel(variables.ECG)
        interfaz.ejexGrafica(i)=interfaz.ejexGrafica(i-1)+(3/9);
    end
    
    x = get (interfaz.grafica, 'xdata');
    y = get (interfaz.grafica, 'ydata');
    
    interfaz.grafica = findobj ('tag', 'grafica');
    %Guardamos los valores anteriores de ambos ejex para seguir 
    %representandolos en la siguiente representacion y no perderlos 
    set(interfaz.grafica,'ydata',[y variables.ECG],'xdata',[x interfaz.ejexGrafica]);
    
    %Establecer los limites anteriores de la grafica para no perderlos
    a = gca;
    lims = get (a, 'xlim');
    lims(1) = 0;
    lims(2) = interfaz.ejexGrafica(end);
    set (a, 'xlim', lims);

    
%    disp(eHealth.pulso);
%    save(eHealth.fichero,'Pulso  %s \t', eHealth.pulso);
end