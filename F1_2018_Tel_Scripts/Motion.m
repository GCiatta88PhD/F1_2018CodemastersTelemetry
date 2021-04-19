% Read Motion Data Packet type 1341 Byte



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

% struct CarMotionData
% {
%     float         m_worldPositionX;           // World space X position
%     float         m_worldPositionY;           // World space Y position
%     float         m_worldPositionZ;           // World space Z position
%     float         m_worldVelocityX;           // Velocity in world space X
%     float         m_worldVelocityY;           // Velocity in world space Y
%     float         m_worldVelocityZ;           // Velocity in world space Z
%     int16         m_worldForwardDirX;         // World space forward X direction (normalised)
%     int16         m_worldForwardDirY;         // World space forward Y direction (normalised)
%     int16         m_worldForwardDirZ;         // World space forward Z direction (normalised)
%     int16         m_worldRightDirX;           // World space right X direction (normalised)
%     int16         m_worldRightDirY;           // World space right Y direction (normalised)
%     int16         m_worldRightDirZ;           // World space right Z direction (normalised)
%     float         m_gForceLateral;            // Lateral G-Force component
%     float         m_gForceLongitudinal;       // Longitudinal G-Force component
%     float         m_gForceVertical;           // Vertical G-Force component
%     float         m_yaw;                      // Yaw angle in radians
%     float         m_pitch;                    // Pitch angle in radians
%     float         m_roll;                     // Roll angle in radians
% };



%% Take array vector of data containing the packet to decode

function T = Motion(data) % n is the couter for the table row


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

%% Decode only my car data


m_worldPositionX = data(22 : 25, :);
m_worldPositionX_c = (reshape(m_worldPositionX', 1, []));
m_worldPositionX_c = (bin2float(m_worldPositionX_c)); % bin2float need char vector
clear m_worldPositionX

m_worldPositionY = data(26 : 29, :);
m_worldPositionY_c = (reshape(m_worldPositionY', 1, []));
m_worldPositionY_c = (bin2float(m_worldPositionY_c)); % bin2float need char vector
clear m_worldPositionY

m_worldPositionZ = data(30 : 33, :);
m_worldPositionZ_c = (reshape(m_worldPositionZ', 1, []));
m_worldPositionZ_c = (bin2float(m_worldPositionZ_c)); % bin2float need char vector
clear m_worldPositionZ

m_worldVelocityX = data(34 : 37, :);
% m_worldVelocityX_c(1, :) = [num2str(m_worldVelocityX(1, :)), '.'];
% m_worldVelocityX_c(2, :) = [num2str(m_worldVelocityX(2, :)), '.'];
% m_worldVelocityX_c(3, :) = [num2str(m_worldVelocityX(3, :)), '.'];
% m_worldVelocityX_c(4, :) = [num2str(m_worldVelocityX(4, :)), '.'];
m_worldVelocityX_c = (reshape(m_worldVelocityX', 1, []));
m_worldVelocityX_c = (bin2float(m_worldVelocityX_c)); % bin2float need char vector

m_worldVelocityY = data(38 : 41, :);
% m_worldVelocityY_c(1, :) = [num2str(m_worldVelocityY(1, :)), '.'];
% m_worldVelocityY_c(2, :) = [num2str(m_worldVelocityY(2, :)), '.'];
% m_worldVelocityY_c(3, :) = [num2str(m_worldVelocityY(3, :)), '.'];
% m_worldVelocityY_c(4, :) = [num2str(m_worldVelocityY(4, :)), '.'];
m_worldVelocityY_c = (reshape(m_worldVelocityY', 1, []));
m_worldVelocityY_c = (bin2float(m_worldVelocityY_c)); % bin2float need char vector

m_worldVelocityZ = data(42 : 45, :);
% m_worldVelocityZ_c(1, :) = [num2str(m_worldVelocityZ(1, :)), '.'];
% m_worldVelocityZ_c(2, :) = [num2str(m_worldVelocityZ(2, :)), '.'];
% m_worldVelocityZ_c(3, :) = [num2str(m_worldVelocityZ(3, :)), '.'];
% m_worldVelocityZ_c(4, :) = [num2str(m_worldVelocityZ(4, :)), '.'];
m_worldVelocityZ_c = (reshape(m_worldVelocityZ', 1, []));
m_worldVelocityZ_c = (bin2float(m_worldVelocityZ_c)); % bin2float need char vector

m_worldForwardDirX = bi2de(reshape(int16(data(46 : 47, :)'), 1, []));         % World space forward X direction (normalised)

m_worldForwardDirY = bi2de(reshape(data(48 : 49, :)', 1, []));         % World space forward Y direction (normalised)

m_worldForwardDirZ = bi2de(reshape(data(50 : 51, :)', 1, []));         % World space forward Z direction (normalised)

m_worldRightDirX = bi2de(reshape(data(52 : 53, :)', 1, []));           % World space right X direction (normalised)

m_worldRightDirY = bi2de(reshape(data(54 : 55, :)', 1, []));           % World space right Y direction (normalised)

m_worldRightDirZ = bi2de(reshape(data(56 : 57, :)', 1, []));           % World space right Z direction (normalised)
    
m_gForceLateral = data(58 : 61, :);
% m_gForceLateral_c(1, :) = [num2str(m_gForceLateral(1, :)), '.'];
% m_gForceLateral_c(2, :) = [num2str(m_gForceLateral(2, :)), '.'];
% m_gForceLateral_c(3, :) = [num2str(m_gForceLateral(3, :)), '.'];
% m_gForceLateral_c(4, :) = [num2str(m_gForceLateral(4, :)), '.'];
m_gForceLateral_c = (reshape(m_gForceLateral', 1, []));
m_gForceLateral_c = (bin2float(m_gForceLateral_c)); % bin2float need char vector

m_gForceLongitudinal = data(62 : 65, :);
% m_gForceLongitudinal_c(1, :) = [num2str(m_gForceLongitudinal(1, :)), '.'];
% m_gForceLongitudinal_c(2, :) = [num2str(m_gForceLongitudinal(2, :)), '.'];
% m_gForceLongitudinal_c(3, :) = [num2str(m_gForceLongitudinal(3, :)), '.'];
% m_gForceLongitudinal_c(4, :) = [num2str(m_gForceLongitudinal(4, :)), '.'];
m_gForceLongitudinal_c = (reshape(m_gForceLongitudinal', 1, []));
m_gForceLongitudinal_c = (bin2float(m_gForceLongitudinal_c)); % bin2float need char vector

m_gForceVertical = data(66 : 69, :);
% m_gForceVertical_c(1, :) = [num2str(m_gForceVertical(1, :)), '.'];
% m_gForceVertical_c(2, :) = [num2str(m_gForceVertical(2, :)), '.'];
% m_gForceVertical_c(3, :) = [num2str(m_gForceVertical(3, :)), '.'];
% m_gForceVertical_c(4, :) = [num2str(m_gForceVertical(4, :)), '.'];
m_gForceVertical_c = (reshape(m_gForceVertical', 1, []));
m_gForceVertical_c = (bin2float(m_gForceVertical_c)); % bin2float need char vector   

m_yaw = data(70 : 73, :);
% m_yaw_c(1, :) = [nu2str(m_yaw(1, :)), '.'];
% m_yaw_c(2, :) = [num2str(m_yaw(2, :)), '.'];
% m_yaw_c(3, :) = [num2str(m_yaw(3, :)), '.'];
% m_yaw_c(4, :) = [num2str(m_yaw(4, :)), '.'];
m_yaw_c = ((reshape(m_yaw', 1, [])));
m_yaw_c = (bin2float(m_yaw_c)); % bin2float need char vector

m_pitch = data(74 : 77, :);
% m_yaw_c(1, :) = [num2str(m_yaw(1, :)), '.'];
% m_yaw_c(2, :) = [num2str(m_yaw(2, :)), '.'];
% m_yaw_c(3, :) = [num2str(m_yaw(3, :)), '.'];
% m_yaw_c(4, :) = [num2str(m_yaw(4, :)), '.'];
m_pitch_c = ((reshape(m_pitch', 1, [])));
m_pitch_c = (bin2float(m_pitch_c)); % bin2float need char vector

m_roll = data(78 : 81, :);
% m_yaw_c(1, :) = [num2str(m_yaw(1, :)), '.'];
% m_yaw_c(2, :) = [num2str(m_yaw(2, :)), '.'];
% m_yaw_c(3, :) = [num2str(m_yaw(3, :)), '.'];
% m_yaw_c(4, :) = [num2str(m_yaw(4, :)), '.'];
m_roll_c = ((reshape(m_roll', 1, [])));
m_roll_c = (bin2float(m_roll_c)); % bin2float need char vector 


T = table(m_packetId, m_sessionUID, m_sessionTime_c, m_frameIdentifier, ... 
              m_playerCarIndex, m_worldPositionX_c , m_worldPositionY_c , m_worldPositionZ_c , ...
              m_worldVelocityX_c, m_worldVelocityY_c, m_worldVelocityZ_c, ...
              m_worldForwardDirX, m_worldForwardDirY, m_worldForwardDirZ, ...
              m_worldRightDirX, m_worldRightDirY, m_worldRightDirZ, ...
              m_gForceLateral_c, m_gForceLongitudinal_c, m_gForceVertical_c, ...
              m_roll_c, m_pitch_c, m_yaw_c, m_packetFormat,  m_packetVersion);


end








