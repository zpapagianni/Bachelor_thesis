clc
clear all


srcFiles = dir('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Back-Left\*.png');  % the folder in which ur images exists
numFiles = length(srcFiles);
for i = 1 : numFiles
    filename = strcat('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Back-Left\',srcFiles(i).name);
    image= rgb2gray(imread(filename));
    BL{:,:,i}= image;
    BL_name{:,:,i}=srcFiles(i).name;
end

srcFiles = dir('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Back-Right\*.png');  % the folder in which ur images exists
numFiles = length(srcFiles);
for i = 1 : numFiles
    filename = strcat('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Back-Right\',srcFiles(i).name);
    image= rgb2gray(imread(filename));
    BR{:,:,i}= image;
    BR_name{:,:,i}=srcFiles(i).name;
end

srcFiles = dir('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Front-Left\*.png');  % the folder in which ur images exists
numFiles = length(srcFiles);
for i = 1 : numFiles
    filename = strcat('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Front-Left\',srcFiles(i).name);
    image= rgb2gray(imread(filename));
    FL{:,:,i}= image;   
    FL_name{:,:,i}=srcFiles(i).name;
end


srcFiles = dir('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Front-Right\*.png');  % the folder in which ur images exists
numFiles = length(srcFiles);
for i = 1 : numFiles
    filename = strcat('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Front-Right\',srcFiles(i).name);
    image= rgb2gray(imread(filename));
    FR{:,:,i}= image;
    FR_name{:,:,i}=srcFiles(i).name;
end


srcFiles = dir('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Back\*.png');  % the folder in which ur images exists
numFiles = length(srcFiles);
for i = 1 : numFiles
    filename = strcat('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Back\',srcFiles(i).name);
    image= rgb2gray(imread(filename));
    BC{:,:,i}= image; 
    BC_name{:,:,i}=srcFiles(i).name;
end


srcFiles = dir('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Front\*.png');  % the folder in which ur images exists
numFiles = length(srcFiles);
for i = 1 : numFiles
    filename = strcat('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Front\',srcFiles(i).name);
    image= rgb2gray(imread(filename));
    FN{:,:,i}= image;  
    FN_name{:,:,i}=srcFiles(i).name;
end

cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
save('BL.mat','BL')
save('BL_name.mat','BL_name')
save('BR.mat','BR')
save('BR_name.mat','BR_name')
save('FL.mat','FL')
save('FL_name.mat','FL_name')
save('FR.mat','FR')
save('FR_name.mat','FR_name')
save('BC.mat','BC')
save('BC_name.mat','BC_name')
save('FN.mat','FN')
save('FN_name.mat','FN_name')
cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
