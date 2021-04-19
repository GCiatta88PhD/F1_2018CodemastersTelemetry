function T = eventData(data)

% This packet gives details of events that happen during the course of the race.
% 
% Frequency: When the event occurs
% 
% Size: 25 bytes
% 
% struct PacketEventData
% {
%     PacketHeader    m_header;               // Header
%     
%     uint8           m_eventStringCode[4];   // Event string code, see above
% };

% decode Header
    data = de2bi(data);

%     m_packetFormat = (data(1 : 2, : ));
%     m_packetFormat = [m_packetFormat(1, :) , m_packetFormat(2, :)];
%     m_packetFormat = bi2de(m_packetFormat);

%     m_packetVersion = bi2de(data(3, : ));

    m_packetId = bi2de(data(4, : ));

    m_sessionUID = uint64(data(5 : 12, :));
    m_sessionUID = bi2de(reshape(m_sessionUID', 1, []));

    m_sessionTime = data(13 : 16, :);

    m_sessionTime_c = (reshape(m_sessionTime', 1, []));
    m_sessionTime_c = (bin2float(m_sessionTime_c)); % bin2float need char vector
    m_sessionTime_c = datetime(m_sessionTime_c,'convertfrom','posixtime', 'Format', 'yyyy-MM-dd HH:mm:ss.SSS');
    clear m_sessionTime

    m_frameIdentifier = bi2de(reshape(data(17 : 20, :)', 1, []));

%     m_playerCarIndex = bi2de(data(21, :));
    
% decode data

m_eventStringCode_1 = data(22, :);
m_eventStringCode_2 = data (23, :);
m_eventStringCode_3 = data(24, :);
m_eventStringCode_4 = data (25, :);


T = table(m_packetId, m_sessionUID, m_sessionTime_c, m_frameIdentifier, ... 
    m_eventStringCode_1, m_eventStringCode_2, m_eventStringCode_3, ...
    m_eventStringCode_4);
