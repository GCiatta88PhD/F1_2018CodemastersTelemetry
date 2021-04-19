%% To Do


% Troppi pacchetti persi


%% Leggo i dati nel file di Log
clear 
clc

motion_counter = 1;
CarTelemetry_counter = 1;
LapData_counter = 1;
carStatus_counter = 1;
event_counter = 1;
session_counter = 1;
setup_counter = 1;

load('Z:\Gianluca\Software\F1_2018_Tel\1103_China_FP2\log.mat');

clc
data(:, 1) = [];


[x, y] = size(data);

for i = 1 : x
            
    if data(i, :) == 0
        
    else
        

            switch data(i, 4) 
        
                case 0
            
                    Motion_data(motion_counter, :) = Motion(data(i, :)); % 60 Hz
                    motion_counter = motion_counter + 1;

                case 1
            
                    session_data(session_counter, :) = Session(data(i, :)); % 0.5 Hz
                    session_counter = session_counter + 1;
                    
                case 2 
                    
                    LapData_data(LapData_counter, :) = LapData(data(i, :)); % 60 Hz
                    LapData_counter = LapData_counter + 1;
                    
                case 3 
                    
                    event_data(event_counter, :) = eventData(data(i, :)); % When the event occur
                    event_counter = event_counter + 1;
                    
                case 5 
                    
                    car_setupData(setup_counter, :) = CarSetups(data(i, :));
                    setup_counter = setup_counter + 1;
                    
                case 6
                    
                    CarTelemetry_Data(CarTelemetry_counter, :) = CarTelemetryData(data(i, :));   % 60 Hz
                    CarTelemetry_counter = CarTelemetry_counter + 1;
                    
                case 7
                    
                    carStatus(carStatus_counter, :) = carStatusData(data(i, :)); %0.5 Hz
                    carStatus_counter = carStatus_counter + 1;
                    
            end
    end
end


save('Z:\Gianluca\Software\F1_2018_Tel\1103_China_FP2\log_proc.mat');


%%


ATLAS_Variables;
