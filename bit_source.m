function bit_in=bit_source(len)
% source generation
% this program generate the information source
% input:len ->the length of binary source which will be generate
% output:bit_in ->the binary source(01010....)
%% begin
bit_in=randi([0 1],1,len);
end
