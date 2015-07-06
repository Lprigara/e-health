classdef Ehealth < handle
    %Ehealth Summary of this class goes here
    %   Detailed explanation goes here
    
%     properties (SetAccess = 'private')
    properties %Puerto
        puerto;
        conectado;
    end
   
    properties %Variables
        pulso;
        oxigeno;
        temperatura;
        conductancia;
        ECG;
        x;
    end   
    
    properties %Interfaz
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
        nombrePaciente;
        edadPaciente;
        sexoPaciente;
        alturaPaciente;
        pesoPaciente;
        fichero;
    end    
    
    methods
        function obj = Ehealth
           obj.puerto = 0;
           obj.conectado = 0;
           obj.x = 0;
       end 
    end
end