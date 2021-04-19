function T = CarSetups(data)


% struct CarSetupData
% {
%     uint8     m_frontWing;                // Front wing aero
%     uint8     m_rearWing;                 // Rear wing aero
%     uint8     m_onThrottle;               // Differential adjustment on throttle (percentage)
%     uint8     m_offThrottle;              // Differential adjustment off throttle (percentage)
%     float     m_frontCamber;              // Front camber angle (suspension geometry)
%     float     m_rearCamber;               // Rear camber angle (suspension geometry)
%     float     m_frontToe;                 // Front toe angle (suspension geometry)
%     float     m_rearToe;                  // Rear toe angle (suspension geometry)
%     uint8     m_frontSuspension;          // Front suspension
%     uint8     m_rearSuspension;           // Rear suspension
%     uint8     m_frontAntiRollBar;         // Front anti-roll bar
%     uint8     m_rearAntiRollBar;          // Front anti-roll bar
%     uint8     m_frontSuspensionHeight;    // Front ride height
%     uint8     m_rearSuspensionHeight;     // Rear ride height
%     uint8     m_brakePressure;            // Brake pressure (percentage)
%     uint8     m_brakeBias;                // Brake bias (percentage)
%     float     m_frontTyrePressure;        // Front tyre pressure (PSI)
%     float     m_rearTyrePressure;         // Rear tyre pressure (PSI)
%     uint8     m_ballast;                  // Ballast
%     float     m_fuelLoad;                 // Fuel load
% };
% 
% struct PacketCarSetupData
% {
%     PacketHeader    m_header;            // Header
% 
%     CarSetupData    m_carSetups[20];
% };


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


    m_frontWing = bi2de(data(22, :));
    
    m_rearWing = bi2de(data(23, :));
    
    m_onThrottle = bi2de(data(24, :));
    
    m_offThrottle = bi2de(data(25, :));
    
    m_frontCamber_c = data(26 : 29, :);
    m_frontCamber_c = (reshape(m_frontCamber_c', 1, []));
    m_frontCamber = (bin2float(m_frontCamber_c)); % bin2float need char vector
    clear m_frontCamber_c
    
    
    m_rearCamber_c = data(30 : 33, :);
    m_rearCamber_c = (reshape(m_rearCamber_c', 1, []));
    m_rearCamber = (bin2float(m_rearCamber_c)); % bin2float need char vector
    clear m_rearCamber_c
   
    m_frontToe_c = data(34 : 37, :);
    m_frontToe_c = (reshape(m_frontToe_c', 1, []));
    m_frontToe = (bin2float(m_frontToe_c)); % bin2float need char vector
    clear m_frontToe_c

    m_rearToe_c = data(38 : 41, :);
    m_rearToe_c = (reshape(m_rearToe_c', 1, []));
    m_rearToe = (bin2float(m_rearToe_c)); % bin2float need char vector
    clear m_rearToe_c

    m_frontSuspension = bi2de(data(42,: ));
    
    m_rearSuspension = bi2de(data(43,: ));
    
    m_frontAntiRollBar = bi2de(data(44, :));
    
    m_rearAntiRollBar = bi2de(data(45, :));
    
    m_frontSuspensionHeight = bi2de(data(46, :));
    
    m_rearSuspensionHeight = bi2de(data(47, :));
    
    m_brakePressure = bi2de(data(48, :));
    
    m_brakeBias = bi2de(data(49, :));
    
    
    m_frontTyrePressure_c = data(50 : 53, :);
    m_frontTyrePressure_c = (reshape(m_frontTyrePressure_c', 1, []));
    m_frontTyrePressure = (bin2float(m_frontTyrePressure_c)); % bin2float need char vector
    clear m_frontTyrePressure_c

        
    m_rearTyrePressure_c = data(54 : 57, :);
    m_rearTyrePressure_c = (reshape(m_rearTyrePressure_c', 1, []));
    m_rearTyrePressure = (bin2float(m_rearTyrePressure_c)); % bin2float need char vector
    clear m_rearTyrePressure_c
   
    m_ballast = bi2de(data(54, :));
    
    m_fuelLoad = bi2de(data(55, :));
    
    
        T = table(m_packetId, m_sessionUID, m_sessionTime_c, m_frameIdentifier, ... 
              m_frontWing, m_rearWing , m_onThrottle , m_offThrottle , ...
              m_frontCamber, m_rearCamber, m_frontToe, ...
              m_rearToe, m_frontSuspension, m_rearSuspension, m_frontAntiRollBar, m_rearAntiRollBar, m_frontSuspensionHeight, ...
              m_rearSuspensionHeight, m_brakePressure, m_brakeBias, m_frontTyrePressure, ...
              m_rearTyrePressure, m_ballast, m_fuelLoad);














end