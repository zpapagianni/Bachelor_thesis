function [J] = sharpen(image)
sharp_I1=imsharpen(image,'Amount',1);
J =imadjust(sharp_I1,stretchlim(sharp_I1),[]);
end

