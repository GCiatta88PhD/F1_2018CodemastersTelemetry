% Car Telemetry data

% struct PacketHeader
% {
%     uint16    m_packetFormat;         // 2018
%     uint8     m_packetVersion;        // Version of this packet type, all start from 1
%     uint8     m_packetId;             // Identifier for the packet type, see below
%     uint64    m_sessionUID;           // Unique identifier for the session
%     float     m_sessionTime;          // Session timestamp
%     uint      m_frameIdentifier;      // Identifier for the frame the data was retrieved on
%     uint8     m_playerCarIndex;       // Index of player's car in the array
% };
% 
% struct CarTelemetryData
% {
%     uint16    m_speed;                      // Speed of car in kilometres per hour
%     uint8     m_throttle;                   // Amount of throttle applied (0 to 100)
%     int8      m_steer;                      // Steering (-100 (full lock left) to 100 (full lock right))
%     uint8     m_brake;                      // Amount of brake applied (0 to 100)
%     uint8     m_clutch;                     // Amount of clutch applied (0 to 100)
%     int8      m_gear;                       // Gear selected (1-8, N=0, R=-1)
%     uint16    m_engineRPM;                  // Engine RPM
%     uint8     m_drs;                        // 0 = off, 1 = on
%     uint8     m_revLightsPercent;           // Rev lights indicator (percentage)
%     uint16    m_brakesTemperature[4];       // Brakes temperature (celsius)
%     uint16    m_tyresSurfaceTemperature[4]; // Tyres surface temperature (celsius)
%     uint16    m_tyresInnerTemperature[4];   // Tyres inner temperature (celsius)
%     uint16    m_engineTemperature;          // Engine temperature (celsius)
%     float     m_tyresPressure[4];           // Tyres pressure (PSI)
% };

% struct PacketCarTelemetryData
% {
%     PacketHeader        m_header;                // Header
% 
%     CarTelemetryData    m_carTelemetryData[20];
% 
%     uint32              m_buttonStatus;         // Bit flags specifying which buttons are being
%                                                 // pressed currently - see appendices
% };


function T = CarTelemetryData(data)

% decode Header
    data = de2bi(data);

    m_packetFormat = (data(1 : 2, : ));
    m_packetFormat = [m_packetFormat(1, :) , m_packetFormat(2, :)];
    m_packetFormat = bi2de(m_packetFormat);

    m_packetVersion = bi2de(data(3, : ));

    m_packetId = bi2de(data(4, : ));

    m_sessionUID = uint64(data(5 : 12, :));
    m_sessionUID = bi2de(reshape(m_sessionUID', 1, []));

    m_sessionTime = data(13 : 16, :);
    m_sessionTime_c = (reshape(m_sessionTime', 1, []));
    m_sessionTime_c = (bin2float(m_sessionTime_c)); % bin2float need char vector
    m_sessionTime_c = datetime(m_sessionTime_c,'convertfrom','posixtime', 'Format', 'yyyy-MM-dd HH:mm:ss.SSS');
    clear m_sessionTime

    m_frameIdentifier = bi2de(reshape(data(17 : 20, :)', 1, []));

    m_playerCarIndex = bi2de(data(21, :));
    
% decode data


    m_speed = (data(22 : 23, :));
    m_speed = bi2de(reshape(m_speed', 1, []));

    m_throttle = bi2de(data(24, :));
    
    m_steer = bi2de(data(25,:));
    
    m_brake = bi2de(data(26, :));
    
    m_clutch = bi2de(data(27, :));
    
    m_gear = bi2de(data(28, :));
    
    m_engineRPM = data(29 : 30 , :);
    m_engineRPM = bi2de(reshape(m_engineRPM', 1, []));
    
    m_drs = bi2de(data(31, :));
    
    m_revLightsPercent = bi2de(data(32, :));
    
    m_brakesTemperature_RL = (data(33 : 34, :));
    m_brakesTemperature_RL = bi2de(reshape(m_brakesTemperature_RL', 1, []));
    
    m_brakesTemperature_RR = (data(35 : 36, :));
    m_brakesTemperature_RR = bi2de(reshape(m_brakesTemperature_RR', 1, []));
    
    m_brakesTemperature_FL = (data(37 : 38, :));
    m_brakesTemperature_FL = bi2de(reshape(m_brakesTemperature_FL', 1, []));
    
    m_brakesTemperature_FR = (data(39: 40, :));
    m_brakesTemperature_FR = bi2de(reshape(m_brakesTemperature_FR', 1, []));
    
    m_tyresSurfaceTemperature_RL = (data(41 : 42, :));
    m_tyresSurfaceTemperature_RL = bi2de(reshape(m_tyresSurfaceTemperature_RL', 1, []));
    
    m_tyresSurfaceTemperature_RR = (data(43 : 44, :));
    m_tyresSurfaceTemperature_RR = bi2de(reshape(m_tyresSurfaceTemperature_RR', 1, []));
    
    m_tyresSurfaceTemperature_FL = (data(45 : 46, :));
    m_tyresSurfaceTemperature_FL = bi2de(reshape(m_tyresSurfaceTemperature_FL', 1, []));
    
    m_tyresSurfaceTemperature_FR = (data(47 : 48, :));
    m_tyresSurfaceTemperature_FR = bi2de(reshape(m_tyresSurfaceTemperature_FR', 1, []));

    m_tyresInnerTemperature_RL = (data(49 : 50, :));
    m_tyresInnerTemperature_RL = bi2de(reshape(m_tyresInnerTemperature_RL', 1, []));
    
    m_tyresInnerTemperature_RR = (data(51 : 52, :));
    m_tyresInnerTemperature_RR = bi2de(reshape(m_tyresInnerTemperature_RR', 1, []));
    
    m_tyresInnerTemperature_FL = (data(53 : 54, :));
    m_tyresInnerTemperature_FL = bi2de(reshape(m_tyresInnerTemperature_FL', 1, []));
    
    m_tyresInnerTemperature_FR = (data(55 : 56, :));
    m_tyresInnerTemperature_FR = bi2de(reshape(m_tyresInnerTemperature_FR', 1, []));
    
    m_engineTemperature = (data(57 : 58, :));
    m_engineTemperature = bi2de(reshape(m_engineTemperature', 1, []));

    
    m_tyresPressure_RL = data(59 : 62, :);
    m_tyresPressureRL_c = (reshape(m_tyresPressure_RL', 1, []));
    m_tyresPressureRL_c = (bin2float(m_tyresPressureRL_c)); % bin2float need char vector
    clear m_tyresPressure_RL
    
    m_tyresPressure_RR = data(63 : 66, :);
    m_tyresPressureRR_c = (reshape(m_tyresPressure_RR', 1, []));
    m_tyresPressureRR_c = (bin2float(m_tyresPressureRR_c)); % bin2float need char vector
    clear m_tyresPressure_RR
    
    m_tyresPressure_FL = data(67 : 70, :);
    m_tyresPressureFL_c = (reshape(m_tyresPressure_FL', 1, []));
    m_tyresPressureFL_c = (bin2float(m_tyresPressureFL_c)); % bin2float need char vector
    clear m_tyresPressure_FL
    
    m_tyresPressure_FR = data(71 : 74, :);
    m_tyresPressureFR_c = (reshape(m_tyresPressure_FR', 1, []));
    m_tyresPressureFR_c = (bin2float(m_tyresPressureFR_c)); % bin2float need char vector
    clear m_tyresPressure_FR
    
    m_buttonStatus = (data(1082 : end, :));
    m_buttonStatus = reshape(m_buttonStatus, 1 , []);
    
%     m_speed2 = (data(75 : 76, :));
%     m_speed2 = bi2de(reshape(m_speed2', 1, []));
    
    T = table(m_packetId, m_sessionUID, m_sessionTime_c, m_frameIdentifier, ... 
              m_speed, m_throttle , m_steer , m_brake , ...
              m_clutch, m_gear, m_engineRPM, ...
              m_drs, m_revLightsPercent, m_brakesTemperature_RR, m_brakesTemperature_RL, m_brakesTemperature_FR, m_brakesTemperature_FL, ...
              m_tyresSurfaceTemperature_RR, m_tyresSurfaceTemperature_RL, m_tyresSurfaceTemperature_FR, m_tyresSurfaceTemperature_FL, ...
              m_tyresInnerTemperature_FR, m_tyresInnerTemperature_FL, m_tyresInnerTemperature_RR, m_tyresInnerTemperature_RL, ...
              m_engineTemperature, ...
              m_tyresPressureRR_c, m_tyresPressureRL_c, m_tyresPressureFR_c, m_tyresPressureFL_c, ...
              m_buttonStatus);

    
    
end
