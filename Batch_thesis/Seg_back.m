function [BW] =Seg_back(h1,h2,J,L)
foresub = getPosition(h1);
foregroundInd = sub2ind(size(J),foresub(:,2),foresub(:,1));
% figure; imshow(J)
backsub = getPosition(h2);
backgroundInd = sub2ind(size(J),backsub(:,2),backsub(:,1));
BW = lazysnapping(J,L,foregroundInd,backgroundInd);
% maskedImage = J;
% maskedImage(repmat(~BW,[1 1])) = 0;
% figure; 
% imshow(maskedImage)
end

