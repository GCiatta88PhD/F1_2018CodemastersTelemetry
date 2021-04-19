%% out = bin2float(bin)
% 
% by Dogac Basaran - Bogazici University
%  
% bin: Input binary stream (as string)
% out: Output positive floating number
%
% Example usage:
% 
% bin2float('110.111')
%   ans = 6.875
% 

function out = bin2float(bin)
% bin = [num2str(bin(1)), '.', num2str(bin(2:9)), '.', num2str(bin(10:32))];
% ind = find(bin == '.');
% decpart = bin(1:ind-1);
% floatpart = bin(ind+1:end);
% 
% out = bin2dec(decpart);
% for n = 1:length(floatpart)
%     if floatpart(n) == '1'
%         out = out + 2^(-n);
%     end


S = num2str(bin);
S(S == ' ') = [];
S = flip(S);
%S = '00111110001000000000000000000000'; % Wikipedia example
V = S-'0'; % convert to numeric
frc = 1+sum(V(10:32).*2.^(-1:-1:-23));
pow = sum(V(2:9).*2.^(7:-1:0))-127;
sgn = (-1)^V(1);
out = sgn * frc * 2^pow;


end    