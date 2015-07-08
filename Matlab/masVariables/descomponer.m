function descomponer(datos,variables)
     datos = regexp(datos, '\*', 'split'); %separar datos en campos
          
     if(strcmp(datos(1),'Cabecera'))
         variables.pulso = datos(2);
         variables.oxigeno = datos(3);
         variables.temperatura = datos(4);
         variables.conductancia = datos(5);
         i=6;j=1;         
         while (i < numel(datos))
             variables.ECG(j) = str2double(datos(i));
             j = j+1;
             i=i+1;    
         end
     end
end