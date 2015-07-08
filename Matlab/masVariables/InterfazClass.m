classdef InterfazClass < handle

    properties
        estadoDispositivo;
        escaneoTimer;
        mostrarEcgTimer;
        variablesTimer;
        conectarButton;
        desconectarButton;
        inicioButton;
        pararButton;
        variablesLista;
        titlesVariablesLista;
        datosPacienteLista;
        fichero;
        ejexGrafica;
        grafica;
    end
    
    methods
        function obj = InterfazClass
        obj.estadoDispositivo = 0;
        obj.escaneoTimer = 0;
        obj.mostrarEcgTimer = 0;
        obj.variablesTimer = 0;
        obj.conectarButton = 0;
        obj.desconectarButton = 0;
        obj.inicioButton = 0;
        obj.pararButton = 0;
        obj.variablesLista = 0;
        obj.titlesVariablesLista = 0;
        obj.datosPacienteLista = 0;
        obj.fichero = 0;
        obj.ejexGrafica = 0;
       end
    end
    
end

