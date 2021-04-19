function T = Session(data)


% The session packet includes details about the current session in progress.
% 
% Frequency: 2 per second
% 
% Size: 147 bytes
% 
% struct MarshalZone
% {
%     float  m_zoneStart;   // Fraction (0..1) of way through the lap the marshal zone starts
%     int8   m_zoneFlag;    // -1 = invalid/unknown, 0 = none, 1 = green, 2 = blue, 3 = yellow, 4 = red
% };
% struct PacketSessionData
% {
%     PacketHeader    m_header;               	// Header
% 
%     uint8           m_weather;              	// Weather - 0 = clear, 1 = light cloud, 2 = overcast
%                                             	// 3 = light rain, 4 = heavy rain, 5 = storm
%     int8	    m_trackTemperature;    	// Track temp. in degrees celsius
%     int8	    m_airTemperature;      	// Air temp. in degrees celsius
%     uint8           m_totalLaps;           	// Total number of laps in this race
%     uint16          m_trackLength;           	// Track length in metres
%     uint8           m_sessionType;         	// 0 = unknown, 1 = P1, 2 = P2, 3 = P3, 4 = Short P
%                                             	// 5 = Q1, 6 = Q2, 7 = Q3, 8 = Short Q, 9 = OSQ
%                                             	// 10 = R, 11 = R2, 12 = Time Trial
%     int8            m_trackId;         		// -1 for unknown, 0-21 for tracks, see appendix
%     uint8           m_era;                  	// Era, 0 = modern, 1 = classic
%     uint16          m_sessionTimeLeft;    	// Time left in session in seconds
%     uint16          m_sessionDuration;     	// Session duration in seconds
%     uint8           m_pitSpeedLimit;      	// Pit speed limit in kilometres per hour
%     uint8           m_gamePaused;               // Whether the game is paused
%     uint8           m_isSpectating;        	// Whether the player is spectating
%     uint8           m_spectatorCarIndex;  	// Index of the car being spectated
%     uint8           m_sliProNativeSupport;	// SLI Pro support, 0 = inactive, 1 = active
%     uint8           m_numMarshalZones;         	// Number of marshal zones to follow
%     MarshalZone     m_marshalZones[21];         // List of marshal zones – max 21
%     uint8           m_safetyCarStatus;          // 0 = no safety car, 1 = full safety car
%                                                 // 2 = virtual safety car
%     uint8          m_networkGame;              // 0 = offline, 1 = online
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
    
    m_weather = bi2de(data(22, :));
    
    m_trackTemperature = bi2de(data(23, :));
    
    m_airTemperature = bi2de(data(24, :));
    
    m_totalLaps = bi2de(data(25, :));
    
    m_trackLength = (data(26 : 27, : ));
    m_trackLength = [m_trackLength(1, :) , m_trackLength(2, :)];
    m_trackLength = bi2de(m_trackLength);
    
    m_sessionType = bi2de(data(28, :));
    
    m_trackId = bi2de(data(29, :));
    
    m_era = bi2de(data(30, :));
    
    m_sessionTimeLeft = (data(31 : 32, : ));
    m_sessionTimeLeft = [m_sessionTimeLeft(1, :) , m_sessionTimeLeft(2, :)];
    m_sessionTimeLeft = bi2de(m_sessionTimeLeft);
    m_sessionTimeLeft = datetime(m_sessionTimeLeft,'convertfrom','posixtime', 'Format', 'yyyy-MM-dd HH:mm:ss.SSS');
    
   
    
    
    
    
    
    
    
    
    
    
        T = table(m_packetId, m_sessionUID, m_sessionTime_c, m_frameIdentifier, ... 
              m_weather, m_trackTemperature, m_airTemperature, ...
              m_totalLaps, m_trackLength, m_sessionType, ...
              m_trackId, m_era, m_sessionTimeLeft);
