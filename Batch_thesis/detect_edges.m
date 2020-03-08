function [BWfinal,BWoutline] = detect_edges(I)



[BWs] = edge(I,'sobel');
% figure;
% imshow(BWs)
% title('Sobel Filter');

% fudgeFactor = .5;
% BWs = edge(I,'sobel', threshold * fudgeFactor);
% figure, imshow(BWs), title('binary gradient mask');

se90 = strel('line', 3, 90);
se0 = strel('line', 3, 0);
BWsdil = imdilate(BWs, [se90 se0]);
    figure, imshow(BWsdil), title('dilated gradient mask');
BWdfill = imfill(BWsdil, 'holes');
%  figure, imshow(BWdfill);
%  title('binary image with filled holes');

seD = strel('diamond',1);
BWfinal = imerode(BWdfill,seD);
BWfinal = imerode(BWfinal,seD);
%      figure, imshow(BWfinal), title('segmented image');

BWoutline = bwperim(BWfinal);
Segout = I; 
Segout(BWoutline) = 255; 
     figure, imshow(Segout), title('outlined original image');
end

