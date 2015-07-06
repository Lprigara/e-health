function pintaECG(eHealth,p)
    
    %Recorrer eje x en función de cada una de las muestras en el tiempo
    %Cada vez que llegue una serie de valores, miramos si es la primera
    %representación para poner el ejex en 0 
    %Si no, empezar el ejex donde terminó la anterior representación
    if(numel(eHealth.x)==1)
        eHealth.x(1)=0;
    else
        eHealth.x(1)=eHealth.x(end)+(3/9);
    end
    
    %Representar en el ejey el ECG con respecto al ejex
    for i=2:numel(eHealth.ECG)
        eHealth.x(i)=eHealth.x(i-1)+(3/9);
    end
    
    x = get (p, 'xdata');
    y = get (p, 'ydata');
    
    p = findobj ('tag', 'grafica')
    %Guardamos los valores anteriores de ambos ejex para seguir 
    %representandolos en la siguiente representacion y no perderlos 
    set(p,'ydata',[y eHealth.ECG],'xdata',[x eHealth.x]);
    get(p,'xdata')
    
    %Establecer los limites anteriores de la grafica para no perderlos
    a = gca;
    lims = get (a, 'xlim')
    lims(1) = 0;
    lims(2) = eHealth.x(end);
    set (a, 'xlim', lims);
    get (a, 'xlim')
    get(p,'xdata')

       
end