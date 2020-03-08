function [sum_av,sum_std,sum_av_Gr] = Detection(indx,c,feat,angle)
nframes = 0;
e = 0; % error counter
while (nframes<50)
    
    srcFiles = dir('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Live_demo\*.png');  % the folder in which ur images exists
    images = length(srcFiles);
    for i = 1 : images
        filename = strcat('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Live_demo\',srcFiles(i).name);
        image= rgb2gray(imread(filename));
        picture_im(:,:,i)=image;
    end
    picture= picture_im(:,:,i);
   
    
%     picture = snapshot(c);
%     picture = rgb2gray(imrotate(picture,angle));
    figure;
    imshow(picture)
    try
        [rec_area,newareaPolygon] = Extract_features(picture,feat);
        f1=figure('position',[3870.60000000000,392.200000000000,568.800000000000,437.200000000000]);
        imshow(picture,'parent',gca)
        set(f1, 'Position',[3870.60000000000,392.200000000000,568.800000000000,437.200000000000]);
        line(newareaPolygon(:, 1), newareaPolygon(:, 2), 'Color', 'y');
        title('Detected Box');
        snap = choosestatus;
        if snap==2
            [rows,columns,~] = size(feat);
            image= imcrop(picture,rec_area);
            ref=feat;
            J=image;
            %J = imhistmatch(image,ref);
            im_str = registerImages_live(J,ref);
            PI_rot=im_str;
%             PI_rot= imresize(im_str, [rows columns]);
%             figure;imshow(PI_rot)
            f3=figure('position',[4486.6,417.4,547.6,391.6]);
            imshowpair(ref,PI_rot,'diff')
            title('Difference in position with the original image')
            set(f3, 'Position',[4482.20000000000,412.600000000000,507.600000000000,365.200000000000]);
            break
        elseif snap==0
            nframes=51;
        end
        e = 0; % reset error counter
    catch
        e = e+1; % add an error
        if e>20
            keyboard % if you are just getting excessive
            %                 errors, this will stop the loop
            %                 and put you in debugger mode to
            %                 try and take care of the problem
            fprintf('Feature recognition without success: %s\n', ME.message);
            continue;  % Jump to next iteration of: for i
        end
        fprintf("Feature recognition worked successfully\n");
    end
end
%%
close(f1)
dect=1;
f=0;
names='';
if indx==1
    %%
    side='FR';
    [I_PI_FR,~] =Basic_Processing(PI_rot,side,names,dect,f);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
    s='rec_area_FR.mat';
    uiopen(s,1);
    rec_area=rec_area_FR;
    numFiles_feat=size(rec_area_FR,1);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
    time=1;
    [sum_av,sum_std,sum_av_Gr] =Regions_of_interest_live(rec_area,numFiles_feat,I_PI_FR,side,time);
    time=2;
    [sum_av,sum_std,sum_av_Gr] =Regions_of_interest_live(rec_area,numFiles_feat,I_PI_FR,side,time);
elseif indx==2
     side='BR';
    [I_PI_BR,~] =Basic_Processing(PI_rot,side,names,dect,f);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
    s='rec_area_BR.mat';
    uiopen(s,1);
    rec_area=rec_area_BR;
    numFiles_feat=size(rec_area_BR,1);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
    time=1;
    [sum_av,sum_std,sum_av_Gr] =Regions_of_interest_live(rec_area,numFiles_feat,I_PI_BR,side,time);
    time=2;
    [sum_av,sum_std,sum_av_Gr] =Regions_of_interest_live(rec_area,numFiles_feat,I_PI_BR,side,time);
elseif indx==3
    side='FL';
    [I_PI_FL,~] =Basic_Processing(PI_rot,side,names,dect,f);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
    s='rec_area_FL.mat';
    uiopen(s,1);
    rec_area=rec_area_FL;
    numFiles_feat=size(rec_area_FL,1);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
    time=1;
    [sum_av,sum_std,sum_av_Gr] =Regions_of_interest_live(rec_area,numFiles_feat,I_PI_FL,side,time);
    time=2;
    [sum_av,sum_std,sum_av_Gr] =Regions_of_interest_live(rec_area,numFiles_feat,I_PI_FL,side,time);
elseif indx==4
    side='BL';
    [I_PI_BL,~] =Basic_Processing(PI_rot,side,names,dect,f);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
    s='rec_area_BL.mat';
    uiopen(s,1);
    rec_area=rec_area_BL;
    numFiles_feat=size(rec_area_BL,1);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
    time=1;
   [sum_av,sum_std,sum_av_Gr] =Regions_of_interest_live(rec_area,numFiles_feat,I_PI_BL,side,time);
   time=2;
   [sum_av,sum_std,sum_av_Gr] =Regions_of_interest_live(rec_area,numFiles_feat,I_PI_BL,side,time);
elseif indx==5   
    side='FN';
    [I_PI_FN,~] =Basic_Processing(PI_rot,side,names,dect,f);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
    s='rec_area_FN.mat';
    uiopen(s,1);
    rec_area=rec_area_FN;
    numFiles_feat=size(rec_area_FN,1);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
    time=1;
    [sum_av,sum_std,sum_av_Gr] =Regions_of_interest_live(rec_area,numFiles_feat,I_PI_FN,side,time);
    time=2;
    [sum_av,sum_std,sum_av_Gr] =Regions_of_interest_live(rec_area,numFiles_feat,I_PI_FN,side,time);
elseif indx==6
    side='BC';
    [I_PI_BC,~] =Basic_Processing(PI_rot,side,names,dect,f);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
    s='rec_area_BC.mat';
    uiopen(s,1);
    rec_area=rec_area_BC;
    numFiles_feat=size(rec_area_BC,1);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
    time=1;
    [sum_av,sum_std,sum_av_Gr] =Regions_of_interest_live(rec_area,numFiles_feat,I_PI_BC,side,time);
    time=2;
    [sum_av,sum_std,sum_av_Gr] =Regions_of_interest_live(rec_area,numFiles_feat,I_PI_BC,side,time);
end

end

