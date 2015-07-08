function mostrarVariables(interfaz, variables)
   set (interfaz.variablesLista(1), 'String', variables.oxigeno);
   set (interfaz.variablesLista(2), 'String', variables.pulso);
   set (interfaz.variablesLista(3), 'String', variables.temperatura);
   set (interfaz.variablesLista(4), 'String', variables.conductancia);
   
%    disp(eHealth.pulso);
%    save(eHealth.fichero,'Pulso  %s \t', eHealth.pulso);
end