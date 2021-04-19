function T = carStatusData(data)

% struct CarStatusData
% {
%     uint8       m_tractionControl;          // 0 (off) - 2 (high)
%     uint8       m_antiLockBrakes;           // 0 (off) - 1 (on)
%     uint8       m_fuelMix;                  // Fuel mix - 0 = lean, 1 = standard, 2 = rich, 3 = max
%     uint8       m_frontBrakeBias;           // Front brake bias (percentage)
%     uint8       m_pitLimiterStatus;         // Pit limiter status - 0 = off, 1 = on
%     float       m_fuelInTank;               // Current fuel mass
%     float       m_fuelCapacity;             // Fuel capacity
%     uint16      m_maxRPM;                   // Cars max RPM, point of rev limiter
%     uint16      m_idleRPM;                  // Cars idle RPM
%     uint8       m_maxGears;                 // Maximum number of gears
%     uint8       m_drsAllowed;               // 0 = not allowed, 1 = allowed, -1 = unknown
%     uint8       m_tyresWear[4];             // Tyre wear percentage
%     uint8       m_tyreCompound;             // Modern - 0 = hyper soft, 1 = ultra soft
%                                             // 2 = super soft, 3 = soft, 4 = medium, 5 = hard
%                                             // 6 = super hard, 7 = inter, 8 = wet
%                                             // Classic - 0-6 = dry, 7-8 = wet
%     uint8       m_tyresDamage[4];           // Tyre damage (percentage)
%     uint8       m_frontLeftWingDamage;      // Front left wing damage (percentage)
%     uint8       m_frontRightWingDamage;     // Front right wing damage (percentage)
%     uint8       m_rearWingDamage;           // Rear wing damage (percentage)
%     uint8       m_engineDamage;             // Engine damage (percentage)
%     uint8       m_gearBoxDamage;            // Gear box damage (percentage)
%     uint8       m_exhaustDamage;            // Exhaust damage (percentage)
%     int8        m_vehicleFiaFlags;          // -1 = invalid/unknown, 0 = none, 1 = green
%                                             // 2 = blue, 3 = yellow, 4 = red
%     float       m_ersStoreEnergy;           // ERS energy store in Joules
%     uint8       m_ersDeployMode;            // ERS deployment mode, 0 = none, 1 = low, 2 = medium
%                                             // 3 = high, 4 = overtake, 5 = hotlap
%     float       m_ersHarvestedThisLapMGUK;  // ERS energy harvested this lap by MGU-K
%     float       m_ersHarvestedThisLapMGUH;  // ERS energy harvested this lap by MGU-H
%     float       m_ersDeployedThisLap;       // ERS energy deployed this lap
% };
% struct PacketCarStatusData
% {
%     PacketHeader        m_header;            // Header
% 
%     CarStatusData       m_carStatusData[20];
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


    m_tractionControl = bi2de(data(22, :));

    m_antiLockBrakes = bi2de(data(23, :));

    m_fuelMix = bi2de(data(24, :));

    m_frontBrakeBias = bi2de(data(25, :));

    m_pitLimiterStatus = bi2de(data(26, :));
     
    m_fuelInTank_c = data(27 : 30, :);
    m_fuelInTank = (reshape(m_fuelInTank_c', 1, []));
    m_fuelInTank = (bin2float(m_fuelInTank)); % bin2float need char vector
    clear m_fuelInTank_c

    m_fuelCapacity_c = data(31 : 34, :);
    m_fuelCapacity = (reshape(m_fuelCapacity_c', 1, []));
    m_fuelCapacity = (bin2float(m_fuelCapacity)); % bin2float need char vector
    clear m_fuelInTank_c
    
    m_maxRPM = (data(35 : 36, :));
    m_maxRPM = bi2de(reshape(m_maxRPM', 1, []));
    
    m_idleRPM = (data(37 : 38, :));
    m_idleRPM = bi2de(reshape(m_idleRPM', 1, []));
    
    m_maxGears = bi2de(data(39, : ));
    
    m_drsAllowed = bi2de(data(40, :));
    
    m_tyresWearRL = bi2de(data(41, :));
    m_tyresWearRR = bi2de(data(42, :));
    m_tyresWearFL = bi2de(data(43, :));
    m_tyresWearFR = bi2de(data(44, :));
    
    m_tyreCompound = bi2de(data(45, :));
    
    m_tyresDamageRL = bi2de(data(46, :));
    m_tyresDamageRR = bi2de(data(47, :));
    m_tyresDamageFL = bi2de(data(48, :));
    m_tyresDamageFR = bi2de(data(49, :));
    
    m_frontLeftWingDamage = bi2de(data(50, :));
    m_frontRightWingDamage = bi2de(data(51, :));
    m_rearWingDamage = bi2de(data(52, :));
    m_engineDamage = bi2de(data(53, :));
    m_gearBoxDamage = bi2de(data(54, :));
    m_exhaustDamage = bi2de(data(55, :));
    
    m_vehicleFiaFlags = bi2de(data(56, :));
    
    m_ersStoreEnergy_c = data(57 : 60, :);
    m_ersStoreEnergy = (reshape(m_ersStoreEnergy_c', 1, []));
    m_ersStoreEnergy = (bin2float(m_ersStoreEnergy)); % bin2float need char vector
    clear m_ersStoreEnergy_c
    
    m_ersDeployMode = bi2de(data(61, :));
    
    m_ersHarvestedThisLapMGUK_c = data(62 : 65, :);
    m_ersHarvestedThisLapMGUK = (reshape(m_ersHarvestedThisLapMGUK_c', 1, []));
    m_ersHarvestedThisLapMGUK = (bin2float(m_ersHarvestedThisLapMGUK)); % bin2float need char vector
    clear m_ersHarvestedThisLapMGUK_c
    
    m_ersHarvestedThisLapMGUH_c = data(66 : 69, :);
    m_ersHarvestedThisLapMGUH = (reshape(m_ersHarvestedThisLapMGUH_c', 1, []));
    m_ersHarvestedThisLapMGUH = (bin2float(m_ersHarvestedThisLapMGUH)); % bin2float need char vector
    clear m_ersHarvestedThisLapMGUH_c
    
    m_ersDeployedThisLap_c = data(70 : 73, :);
    m_ersDeployedThisLap = (reshape(m_ersDeployedThisLap_c', 1, []));
    m_ersDeployedThisLap = (bin2float(m_ersDeployedThisLap)); % bin2float need char vector
    clear m_ersDeployedThisLap_c
    
    
    m_BatteryPercent = (m_ersStoreEnergy./4000000).*100;  
    
    
    
   
    T = table(m_packetId, m_sessionUID, m_sessionTime_c, m_frameIdentifier, ... 
                   m_tractionControl, m_antiLockBrakes, m_fuelMix, ...
                   m_frontBrakeBias, m_pitLimiterStatus, m_fuelInTank, ...
                   m_fuelCapacity, m_maxRPM, m_idleRPM, ...
                   m_maxGears, m_drsAllowed, m_tyresWearRL, ...
                   m_tyresWearRR, m_tyresWearFL, m_tyresWearFR, ...
                   m_tyreCompound, m_tyresDamageRL, m_tyresDamageRR, ...
                   m_tyresDamageFR, m_tyresDamageFL, m_frontLeftWingDamage, ...
                   m_frontRightWingDamage, m_rearWingDamage, m_engineDamage, ...
                   m_gearBoxDamage, m_exhaustDamage, m_vehicleFiaFlags, ...
                   m_ersStoreEnergy, m_ersDeployMode, m_ersHarvestedThisLapMGUK, ...
                   m_ersHarvestedThisLapMGUH, m_ersDeployedThisLap, m_BatteryPercent);



end





