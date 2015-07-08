classdef Variables < handle
   
    properties
        pulso;
        oxigeno;
        temperatura;
        conductancia;
        ECG;
    end
    
    methods
        function obj = Variables
           obj.pulso = 0;
           obj.oxigeno = 0;
           obj.temperatura = 0;
           obj.conductancia = 0;
           obj.ECG = 0;
       end 
    end
    
end

