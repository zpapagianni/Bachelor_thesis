function [rec_object,newobjectPolygon ] = Extract_features(sceneImage,object)

% % Detect feature points in both images.
objectPoints = detectSURFFeatures(object);
scenePoints = detectSURFFeatures(sceneImage);
% objectPoints =detectHarrisFeatures(object);
% scenePoints = detectHarrisFeatures(sceneImage);

% % %Visualize the strongest feature points found in the reference image.
% figure;
% imshow(object);
% title('100 Strongest Feature Points from object Image');
% hold on;
% plot(selectStrongest(objectPoints, 100));
% 
% %Visualize the strongest feature points found in the target image.
% figure;
% imshow(sceneImage);
% title('300 Strongest Feature Points from Scene Image');
% hold on;
% plot(selectStrongest(scenePoints, 300));

% Extract feature descriptors at the interest points in both images.
[objectFeatures, objectPoints] = extractFeatures(object, objectPoints);
[sceneFeatures, scenePoints] = extractFeatures(sceneImage, scenePoints);

% Match the features using their descriptors.
objectPairs = matchFeatures(objectFeatures, sceneFeatures);

% Display putatively matched features.
matchedobjectPoints = objectPoints(objectPairs(:, 1), :);
matchedScenePoints = scenePoints(objectPairs(:, 2), :);

% figure;
% showMatchedFeatures(object, sceneImage, matchedobjectPoints, ...
%     matchedScenePoints, 'montage');
% title('Putatively Matched Points (Including Outliers)');

[tform, inlierobjectPoints, inlierScenePoints] = ...
    estimateGeometricTransform(matchedobjectPoints, matchedScenePoints, 'similarity','MaxDistance',50);

% Display the matching point pairs with the outliers removed
% figure;
% showMatchedFeatures(object, sceneImage, inlierobjectPoints, ...
%     inlierScenePoints, 'montage');
% title('Matched Points (Inliers Only)');

objectPolygon = [1, 1;...                           % top-left
        size(object, 2), 1;...                 % top-right
        size(object, 2), size(object, 1);... % bottom-right
        1, size(object, 1);...                 % bottom-left
        1, 1];                   % top-left again to close the polygon
newobjectPolygon = transformPointsForward(tform, objectPolygon);
rec_object=[newobjectPolygon(1,:) newobjectPolygon(3,1)-newobjectPolygon(1,1) newobjectPolygon(4,2)-newobjectPolygon(1,2)];

% figure;
% imshow(sceneImage);
% hold on;
% line(newobjectPolygon(:, 1), newobjectPolygon(:, 2), 'Color', 'y');
% title('Detected Box');
end

