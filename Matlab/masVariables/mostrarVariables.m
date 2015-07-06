function mostrarVariables(eHealth)
   set (eHealth.variablesLista(1), 'String', eHealth.oxigeno);
   set (eHealth.variablesLista(2), 'String', eHealth.pulso);
   set (eHealth.variablesLista(3), 'String', eHealth.temperatura);
   set (eHealth.variablesLista(4), 'String', eHealth.conductancia);
   
%    disp(eHealth.pulso);
%    save(eHealth.fichero,'Pulso  %s \t', eHealth.pulso);
end