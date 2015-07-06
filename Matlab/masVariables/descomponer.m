function descomponer(datos,eHealth)
     datos = regexp(datos, '\*', 'split'); %separar datos en campos
          
     if(strcmp(datos(1),'Cabecera'))
         eHealth.pulso = datos(2);
         eHealth.oxigeno = datos(3);
         eHealth.temperatura = datos(4);
         eHealth.conductancia = datos(5);
         i=6;j=1;         
         while (i < numel(datos))
             eHealth.ECG(j) = str2double(datos(i));
             j = j+1;
             i=i+1;    
         end
     end
end