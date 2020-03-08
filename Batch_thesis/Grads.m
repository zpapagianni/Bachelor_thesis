function [Gmag,Gx,Gy] = Grads(I)
[Gmag, ~] = imgradient(I,'prewitt');
% figure, imshow(Gmag, [])
[Gx, Gy] = imgradientxy(I);
% figure,imshowpair(Gx, Gy, 'montage')
end

