function decoded=ConvolutionalDecode( code )
trellis = poly2trellis((9),[557 663 711]);
decoded = vitdec(code,trellis,8,'cont','hard'); % function vitdec consume the most time,but I have not found the method to optimize it,maybe the method doesn't exist.
decoded =decoded(9:size(decoded,2));
end