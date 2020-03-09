function [rec_area,numFiles_feat] = Features(image,k)

%% Extract features

if strcmp(k,'FR')
    % Read the reference image containing the object of interest.
    srcFiles = dir('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Front-Right\Features\*.png');  % the folder in which ur images exists
    numFiles_feat = length(srcFiles);
    max=100;
    for i = 1 : numFiles_feat
        filename = strcat('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Front-Right\Features\',srcFiles(i).name);
        feat= rgb2gray(imread(filename));
        FI{:,:,i}= feat;    
    end

    newareaPolygon=cell(1,1,numFiles_feat);
  

    for i=1:numFiles_feat
        [rec_area(i,:),newareaPolygon{:,:,i}] = Extract_features(image, FI{:,:,i});
    end 
       
    
elseif strcmp(k,'FL')
    % Read the reference image containing the object of interest.
    srcFiles = dir('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Front-Left\Features\*.png');  % the folder in which ur images exists
    numFiles_feat = length(srcFiles);
    max=100;
    for i = 1 : numFiles_feat
        filename = strcat('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Front-Left\Features\',srcFiles(i).name);
        feat= rgb2gray(imread(filename));
        FI{:,:,i}= feat;    
    end

    newareaPolygon=cell(1,1,numFiles_feat);
    for i=1:numFiles_feat
        [rec_area(i,:),newareaPolygon{:,:,i}] = Extract_features(image, FI{:,:,i});
    end
elseif strcmp(k,'BR')
    % Read the reference image containing the object of interest.
    srcFiles = dir('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Back-Right\Features\*.png');  % the folder in which ur images exists
    numFiles_feat = length(srcFiles);
    max=100;
    for i = 1 : numFiles_feat
        filename = strcat('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Back-Right\Features\',srcFiles(i).name);
        feat= rgb2gray(imread(filename));
        FI{:,:,i}= feat;    
    end

    newareaPolygon=cell(1,1,numFiles_feat);
    for i=1:numFiles_feat
        [rec_area(i,:),newareaPolygon{:,:,i}] = Extract_features(image, FI{:,:,i});
    end
elseif strcmp(k,'BL')
    % Read the reference image containing the object of interest.
    srcFiles = dir('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Back-Left\Features\*.png');  % the folder in which ur images exists
    numFiles_feat = length(srcFiles);
    max=100;
    for i = 1 : numFiles_feat
        filename = strcat('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Back-Left\Features\',srcFiles(i).name);
        feat= rgb2gray(imread(filename));
        FI{:,:,i}= feat;
    end
    newareaPolygon=cell(1,1,numFiles_feat);
    for i=1:numFiles_feat
        [rec_area(i,:),newareaPolygon{:,:,i}] = Extract_features(image, FI{:,:,i});
    end
    
elseif strcmp(k,'BC')
    % Read the reference image containing the object of interest.
    srcFiles = dir('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Back\Features\*.png');  % the folder in which ur images exists
    numFiles_feat = length(srcFiles);
    max=100;
    for i = 1 : numFiles_feat
        filename = strcat('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Back\Features\',srcFiles(i).name);
        feat= rgb2gray(imread(filename));
        FI{:,:,i}= feat;
    end
    
    newareaPolygon=cell(1,1,numFiles_feat);
    for i=1:numFiles_feat
        [rec_area(i,:),newareaPolygon{:,:,i}] = Extract_features(image, FI{:,:,i});
    end
end
end
