% LAP DATA PACKET

% struct LapData
% {
%     float       m_lastLapTime;           // Last lap time in seconds
%     float       m_currentLapTime;        // Current time around the lap in seconds
%     float       m_bestLapTime;           // Best lap time of the session in seconds
%     float       m_sector1Time;           // Sector 1 time in seconds
%     float       m_sector2Time;           // Sector 2 time in seconds
%     float       m_lapDistance;           // Distance vehicle is around current lap in metres – could
%                                          // be negative if line hasn’t been crossed yet
%     float       m_totalDistance;         // Total distance travelled in session in metres – could
%                                          // be negative if line hasn’t been crossed yet
%     float       m_safetyCarDelta;        // Delta in seconds for safety car
%     uint8       m_carPosition;           // Car race position
%     uint8       m_currentLapNum;         // Current lap number
%     uint8       m_pitStatus;             // 0 = none, 1 = pitting, 2 = in pit area
%     uint8       m_sector;                // 0 = sector1, 1 = sector2, 2 = sector3
%     uint8       m_currentLapInvalid;     // Current lap invalid - 0 = valid, 1 = invalid
%     uint8       m_penalties;             // Accumulated time penalties in seconds to be added
%     uint8       m_gridPosition;          // Grid position the vehicle started the race in
%     uint8       m_driverStatus;          // Status of driver - 0 = in garage, 1 = flying lap
%                                          // 2 = in lap, 3 = out lap, 4 = on track
%     uint8       m_resultStatus;          // Result status - 0 = invalid, 1 = inactive, 2 = active
%                                          // 3 = finished, 4 = disqualified, 5 = not classified
%                                          // 6 = retired
% };

% struct PacketLapData
% {
%     PacketHeader    m_header;              // Header
% 
%     LapData         m_lapData[20];         // Lap data for all cars on track
% };


function T = LapData(data) % n is the couter for the table row


% data(1) = []; % elimina il primo elemento che indica la dimensione del frame in byte
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

% Lap data

m_lastLapTime = data(22 : 25, :);
m_lastLapTime_c = (reshape(m_lastLapTime', 1, []));
m_lastLapTime_c = (bin2float(m_lastLapTime_c)); % bin2float need char vector
m_lastLapTime_c = datetime(m_lastLapTime_c,'convertfrom','posixtime', 'Format', 'yyyy-MM-dd HH:mm:ss.SSS');
clear m_lastLapTime

m_currentLapTime = data(26 : 29, :);
m_currentLapTime_c = (reshape(m_currentLapTime', 1, []));
m_currentLapTime_c = (bin2float(m_currentLapTime_c)); % bin2float need char vector
m_currentLapTime_c = datetime(m_currentLapTime_c,'convertfrom','posixtime', 'Format', 'yyyy-MM-dd HH:mm:ss.SSS');
clear m_currentLapTime

m_bestLapTime = data(30 : 33, :);
m_bestLapTime_c = (reshape(m_bestLapTime', 1, []));
m_bestLapTime_c = (bin2float(m_bestLapTime_c)); % bin2float need char vector
m_bestLapTime_c = datetime(m_bestLapTime_c,'convertfrom','posixtime', 'Format', 'yyyy-MM-dd HH:mm:ss.SSS');
clear m_bestLapTime

m_sector1Time = data(34 : 37, :);
m_sector1Time_c = (reshape(m_sector1Time', 1, []));
m_sector1Time_c = (bin2float(m_sector1Time_c)); % bin2float need char vector
m_sector1Time_c = datetime(m_sector1Time_c,'convertfrom','posixtime', 'Format', 'yyyy-MM-dd HH:mm:ss.SSS');
clear m_sector1Time

m_sector2Time = data(38 : 41, :);
m_sector2Time_c = (reshape(m_sector2Time', 1, []));
m_sector2Time_c = (bin2float(m_sector2Time_c)); % bin2float need char vector
m_sector2Time_c = datetime(m_sector2Time_c,'convertfrom','posixtime', 'Format', 'yyyy-MM-dd HH:mm:ss.SSS');
clear m_sector2Time

m_lapDistance = data(42 : 45, :);
m_lapDistance_c = (reshape(m_lapDistance', 1, []));
m_lapDistance_c = (bin2float(m_lapDistance_c)); % bin2float need char vector
clear m_lapDistance

m_totalDistance = data(46 : 49, :);
m_totalDistance_c = (reshape(m_totalDistance', 1, []));
m_totalDistance_c = (bin2float(m_totalDistance_c)); % bin2float need char vector
clear m_totalDistance

m_safetyCarDelta = data(50 : 53, :);
m_safetyCarDelta_c = (reshape(m_safetyCarDelta', 1, []));
m_safetyCarDelta_c = (bin2float(m_safetyCarDelta_c)); % bin2float need char vector
clear m_totalDistance

m_carPosition = bi2de(data(54, :));

m_currentLapNum = bi2de(data(55, :));

m_pitStatus = bi2de(data(56, :));

m_sector = bi2de(data(57, :));

m_currentLapInvalid = bi2de(data(58, :));

m_penalties = bi2de(data(58, :));

m_gridPosition = bi2de(data(59, :));

m_driverStatus = bi2de(data(60, :));

m_resultStatus = bi2de(data(61, :));

 T = table(m_packetId, m_sessionUID, m_sessionTime_c, m_frameIdentifier, ...
     m_lastLapTime_c, m_currentLapTime_c, m_bestLapTime_c, ...
     m_sector1Time_c, m_sector2Time_c, m_lapDistance_c, ...
     m_totalDistance_c, m_safetyCarDelta_c, m_carPosition, ...
     m_currentLapNum, m_pitStatus, m_sector, ...
     m_currentLapInvalid, m_penalties, m_gridPosition, ...
     m_driverStatus, m_resultStatus); 
     