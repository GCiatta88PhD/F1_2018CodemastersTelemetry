%% ATLAS Variables

close all
clear 
clc

load('Z:\Gianluca\Software\F1_2018_Tel\1103_China_FP2\log_proc.mat');


%% Session Time

m_sessionTime_c = CarTelemetry_Data.m_sessionTime_c;
t_Session = posixtime(m_sessionTime_c);
StartTime = (t_Session(1));
EndTime = t_Session(end);
TimeOfRecording = EndTime - StartTime;


%% Laps

% Laps.Number = [0 1 ]';
% % Laps.StartTime = StartTime;
% Laps.StartTime = [posixtime(LapData_data.m_sessionTime_c(6015)), posixtime(LapData_data.m_sessionTime_c(11422))]';
% Laps.Duration = [posixtime(LapData_data.m_sessionTime_c(11422)) - posixtime(LapData_data.m_sessionTime_c(6015)), posixtime(LapData_data.m_sessionTime_c(17422)) - posixtime(LapData_data.m_sessionTime_c(11422))]';
% 

%% Variables CarTelemetry

v_car(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
v_car(:, 2) = CarTelemetry_Data.m_speed;
% vCar.Name = 'v_car';
% vCar.DisplayMax = max(v_car(:, 2)) + 60;
% vCar.DisplayMin = min(v_car(:, 2)) - 30;
% vCar.Units = 'km/h';

p_brake(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
p_brake(:, 2) = CarTelemetry_Data.m_brake;

n_clutch(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
n_clutch(:, 2) = CarTelemetry_Data.m_clutch;

rpm_engine(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
rpm_engine(:, 2) = CarTelemetry_Data.m_engineRPM;

n_gear(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
n_gear(:, 2) = CarTelemetry_Data.m_gear;

n_steer(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
n_steer(:, 2) = CarTelemetry_Data.m_steer;

n_throttle(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
n_throttle(:, 2) = CarTelemetry_Data.m_throttle;

T_engine(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
T_engine(:, 2) = CarTelemetry_Data.m_engineTemperature;

B_drs(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
B_drs(:, 2) = CarTelemetry_Data.m_drs;

T_brakesTemperature_FL(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
T_brakesTemperature_FL(:, 2) = CarTelemetry_Data.m_brakesTemperature_FL;

T_brakesTemperature_FR(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
T_brakesTemperature_FR(:, 2) = CarTelemetry_Data.m_brakesTemperature_FR;

T_brakesTemperature_RL(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
T_brakesTemperature_RL(:, 2) = CarTelemetry_Data.m_brakesTemperature_RL;

T_brakesTemperature_RR(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
T_brakesTemperature_RR(:, 2) = CarTelemetry_Data.m_brakesTemperature_RR;

T_tyresInnerTemperature_FL(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
T_tyresInnerTemperature_FL(:, 2) = CarTelemetry_Data.m_tyresInnerTemperature_FL;

T_tyresInnerTemperature_RL(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
T_tyresInnerTemperature_RL(:, 2) = CarTelemetry_Data.m_tyresInnerTemperature_RL;

T_tyresInnerTemperature_FR(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
T_tyresInnerTemperature_FR(:, 2) = CarTelemetry_Data.m_tyresInnerTemperature_FR;

T_tyresInnerTemperature_RR(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
T_tyresInnerTemperature_RR(:, 2) = CarTelemetry_Data.m_tyresInnerTemperature_RR;

T_tyresSurfaceTemperature_FL(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
T_tyresSurfaceTemperature_FL(:, 2) = CarTelemetry_Data.m_tyresSurfaceTemperature_FL;

T_tyresSurfaceTemperature_RL(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
T_tyresSurfaceTemperature_RL(:, 2) = CarTelemetry_Data.m_tyresSurfaceTemperature_RL;

T_tyresSurfaceTemperature_FR(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
T_tyresSurfaceTemperature_FR(:, 2) = CarTelemetry_Data.m_tyresSurfaceTemperature_FR;

T_tyresSurfaceTemperature_RR(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
T_tyresSurfaceTemperature_RR(:, 2) = CarTelemetry_Data.m_tyresSurfaceTemperature_RR;

P_tyresPressureFL(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
P_tyresPressureFL(:, 2) = CarTelemetry_Data.m_tyresSurfaceTemperature_FL;

P_tyresPressureRL(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
P_tyresPressureRL(:, 2) = CarTelemetry_Data.m_tyresPressureRL_c;

P_tyresPressureFR(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
P_tyresPressureFR(:, 2) = CarTelemetry_Data.m_tyresPressureFR_c;

P_tyresPressureRR(:, 1) = posixtime(CarTelemetry_Data.m_sessionTime_c);
P_tyresPressureRR(:, 2) = CarTelemetry_Data.m_tyresPressureRR_c;

%% Variables CarStatus

J_ers(:, 1) = posixtime(carStatus.m_sessionTime_c);
J_ers(:, 2) = carStatus.m_ersStoreEnergy;

m_FuelTank(:, 1) = posixtime(carStatus.m_sessionTime_c);
m_FuelTank(:, 2) = carStatus.m_fuelInTank;

n_tractionControl(:, 1) =  posixtime(carStatus.m_sessionTime_c);
n_tractionControl(:, 2) = carStatus.m_tractionControl;

n_antiLockBrakes(:, 1) =  posixtime(carStatus.m_sessionTime_c);
n_antiLockBrakes(:, 2) = carStatus.m_antiLockBrakes;


%% Variables SessionData

T_track(:, 1) = posixtime(session_data.m_sessionTime_c);
T_track(:, 2) = session_data.m_trackTemperature;


%% Variables MotionData

a_pitch(:, 1) = posixtime(Motion_data.m_sessionTime_c);
a_pitch(:, 2) = Motion_data.m_pitch_c;

a_roll(:, 1) = posixtime(Motion_data.m_sessionTime_c);
a_roll(:, 2) = Motion_data.m_roll_c;

a_yaw(:, 1) = posixtime(Motion_data.m_sessionTime_c);
a_yaw(:, 2) = Motion_data.m_yaw_c;

m_worldPositionX(:, 1) = posixtime(Motion_data.m_sessionTime_c);
m_worldPositionX(:, 2) = Motion_data.m_worldPositionX_c;

m_worldPositionY(:, 1) = posixtime(Motion_data.m_sessionTime_c);
m_worldPositionY(:, 2) = Motion_data.m_worldPositionY_c;

m_worldPositionZ(:, 1) = posixtime(Motion_data.m_sessionTime_c);
m_worldPositionZ(:, 2) = Motion_data.m_worldPositionZ_c;

gForceLateral(:, 1) = posixtime(Motion_data.m_sessionTime_c);
gForceLateral(:, 2) = Motion_data.m_gForceLateral_c;

%% Delete all support variables and save only the telemetry data

clear a app c car_setupData carStatus event filename m_sessionTime_c udpr value read ...
    CarTelemetry_counter carStatus_counter carStatusData data dataR event_counter i LapData ...
    LapData_counter LapData_data motion_counter Motion_data session_counter session_data ...
    CarTelemetry_Data t_Session x y setup_counter

save('Z:\Gianluca\Software\F1_2018_Tel\1103_China_FP2\log_procATLAS.mat');