function interfaz()
clc;
    eHealth = Ehealth;

    figure('Units','pixels','Position',[200 200 1000 690]);
         
        %
        %%TEXT EDIT
        eHealth.datosPacienteLista = [0;0;0;0];
        datosPacienteTexto = {'Nombre: ', 'Edad: ', 'Sexo: ', 'Altura: ', 'Peso: '};
        for i = 1:5
            eHealth.datosPacienteLista(i) = uicontrol('Style', 'text',... 
                                        'unit','pix',... 
                                        'position',[80 590-i*30 280 30],...
                                        'fontsize',12,...
                                        'horizontalAlignment', 'left',...
                                        'String', datosPacienteTexto{i});
        end
       
        prompt={'Nombre Completo', 'Edad', 'Sexo(M o F)', 'Altura(Cm)', 'Peso(Kg)' };
        fields = {'nombre','edad', 'sexo', 'altura', 'peso'};
        pacienteDialog = inputdlg(prompt, 'Datos del paciente', [1 40; 1 15; 1 15; 1 15; 1 15]);
        
        if ~isempty(pacienteDialog)              %see if user hit cancel
           pacienteDialog = cell2struct(pacienteDialog,fields);
           eHealth.nombrePaciente = pacienteDialog.nombre;
           eHealth.edadPaciente = str2num(pacienteDialog.edad);
           eHealth.sexoPaciente = pacienteDialog.sexo;
           eHealth.alturaPaciente = str2num(pacienteDialog.altura);
           eHealth.pesoPaciente = str2num(pacienteDialog.peso);
        end
             
        
        eHealth.titlesVariablesLista = [0;0;0;0];
        eHealth.variablesLista = [0;0;0;0];
        editTexto = {'BPM', 'SPO2', 'Temperatura', 'Conductancia'};
        for i = 1:2
            eHealth.titlesVariablesLista(i) = uicontrol('Style', 'text',... 
                                        'unit','pix',... 
                                        'position',[420+i*150 170 130 30],...
                                        'fontsize',14,...
                                        'String', editTexto{i});
        end
        for i = 1:2
            eHealth.variablesLista(i) = uicontrol('Style', 'text',... 
                                        'unit','pix',... 
                                        'position',[420+i*150 140 130 30],...
                                        'fontsize',14);
        end
        for i = 3:4
            eHealth.titlesVariablesLista(i) = uicontrol('Style', 'text',... 
                                        'unit','pix',... 
                                        'position',[420+(i-2)*150 90 130 30],...
                                        'fontsize',14,...
                                        'String', editTexto{i});
        end
        for i = 3:4
            eHealth.variablesLista(i) = uicontrol('Style', 'text',... 
                                        'unit','pix',... 
                                        'position',[420+(i-2)*150 60 130 30],...
                                        'fontsize',14);
        end
        
        eHealth.estadoDispositivo = uicontrol('Style', 'text',... 
                   'unit','pix',... 
                   'position',[100 110 190 20],...
                   'fontsize',11,...
                   'String', 'Dispositivo Desconectado');
       
               
               
       %
       %%TIMERS
        eHealth.escaneoTimer = timer ('Name', 'timerEscanear',...
                          'Period', 1,...
                          'ExecutionMode', 'fixedSpacing',...
                          'BusyMode', 'drop',...
                          'TimerFcn', @(o, e) escaneo(eHealth)); 
                      
        eHealth.mostrarEcgTimer = timer ('Name', 'timerMostrarECG',...
                   'Period', 1,...
                   'ExecutionMode', 'fixedSpacing',...
                   'BusyMode', 'drop');
    
        eHealth.variablesTimer = timer ('Name', 'timerPintarVariables',...
                   'Period', 3,...
                   'ExecutionMode', 'fixedSpacing',...
                   'BusyMode', 'drop',...
                   'TimerFcn', @(o, e) mostrarVariables(eHealth));
       
        
        %
        %%PUSH BUTTON
        eHealth.conectarButton = uicontrol('Style','pushbutton',...
                  'Position', [80 150 110 50],...
                  'String', 'Conectar',...
                  'fontsize',13,...
                  'Callback',{@conectar_pushbutton_callback,eHealth});
        
        eHealth.desconectarButton = uicontrol('Style','pushbutton',...
                  'Position', [200 150 110 50],...
                  'String', 'Desconectar',...
                  'fontsize',13,...
                  'Callback',{@desconectar_pushbutton_callback,eHealth});
        
        eHealth.inicioButton = uicontrol('Style','pushbutton',...
                  'Position', [80 270 110 50],...
                  'String', 'Inicio',...
                  'fontsize',13,...
                  'Callback',{@inicio_pushbutton_callback,eHealth});
           
        eHealth.pararButton = uicontrol('Style','pushbutton',...
                  'Position', [200 270 110 50],...
                  'String', 'Parar',...
                  'fontsize',13,...
                  'Callback',{@parar_pushbutton_callback,eHealth});
              
        
        %
        %%SET
        set(eHealth.datosPacienteLista(1),'String', strcat({'Nombre: '}, eHealth.nombrePaciente));
        set(eHealth.datosPacienteLista(2),'String', strcat({'Edad: '}, num2str(eHealth.edadPaciente)));
        set(eHealth.datosPacienteLista(3),'String', strcat({'Sexo: '}, eHealth.sexoPaciente));
        set(eHealth.datosPacienteLista(4),'String', strcat({'Altura: '}, num2str(eHealth.alturaPaciente)));
        set(eHealth.datosPacienteLista(5),'String', strcat({'Peso: '}, num2str(eHealth.pesoPaciente)));
        
        %
        %%FICHERO
        nombreFichero = strcat(eHealth.nombrePaciente, '.txt');
        eHealth.fichero=fopen(nombreFichero,'w');
        fprintf(eHealth.fichero,'Nombre:  %s \t', eHealth.nombrePaciente); 
        fprintf(eHealth.fichero,'Edad:  %d \t', eHealth.edadPaciente); 
        fprintf(eHealth.fichero,'Sexo:  %s \t', eHealth.sexoPaciente); 
        fprintf(eHealth.fichero,'Altura:  %d \t', eHealth.alturaPaciente); 
        fprintf(eHealth.fichero,'Peso:  %d \t', eHealth.pesoPaciente); 
 end

