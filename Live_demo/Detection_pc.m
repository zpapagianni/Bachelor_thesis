function [sum_av,sum_std,sum_av_Gr] = Detection(indx,c,feat,angle)
nframes = 0;
e = 0; % error counter
while (nframes<50)    
    picture = snapshot(c);
    picture = rgb2gray(imrotate(picture,angle));
    figure;
    imshow(picture)
    try
        [rec_area,newareaPolygon] = Extract_features(picture,feat);
        f1=figure('position',[550 440 600 350]);
        imshow(picture)
        line(newareaPolygon(:, 1), newareaPolygon(:, 2), 'Color', 'y');
        title('Detected Box');
        snap = choosestatus;
        close(f1)
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
            f3=figure('pos',[70 460 550 320]);
            imshowpair(ref,PI_rot,'diff')
            title('Difference in position with the original image')
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
    [sum_av,sum_std,sum_av_Gr] =Regions_of_interest_live(rec_area,numFiles_feat,I_PI_FR,side);
elseif indx==2
     side='BR';
    [I_PI_BR,~] =Basic_Processing(PI_rot,side,names,dect,f);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
    s='rec_area_BR.mat';
    uiopen(s,1);
    rec_area=rec_area_BR;
    numFiles_feat=size(rec_area_BR,1);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
    [sum_av,sum_std,sum_av_Gr] =Regions_of_interest_live(rec_area,numFiles_feat,I_PI_BR,side);
elseif indx==3
    side='FL';
    [I_PI_FL,~] =Basic_Processing(PI_rot,side,names,dect,f);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
    s='rec_area_FL.mat';
    uiopen(s,1);
    rec_area=rec_area_FL;
    numFiles_feat=size(rec_area_FL,1);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
    [sum_av,sum_std,sum_av_Gr] =Regions_of_interest_live(rec_area,numFiles_feat,I_PI_FL,side);
elseif indx==4
    side='BL';
    [I_PI_BL,~] =Basic_Processing(PI_rot,side,names,dect,f);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
    s='rec_area_BL.mat';
    uiopen(s,1);
    rec_area=rec_area_BL;
    numFiles_feat=size(rec_area_BL,1);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
   [sum_av,sum_std,sum_av_Gr] =Regions_of_interest_live(rec_area,numFiles_feat,I_PI_BL,side);
elseif indx==5   
    side='FN';
    [I_PI_FN,~] =Basic_Processing(PI_rot,side,names,dect,f);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
    s='rec_area_FN.mat';
    uiopen(s,1);
    rec_area=rec_area_FN;
    numFiles_feat=size(rec_area_FN,1);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
    [sum_av,sum_std,sum_av_Gr] =Regions_of_interest_live(rec_area,numFiles_feat,I_PI_FN,side);
elseif indx==6
    side='BC';
    [I_PI_BC,~] =Basic_Processing(PI_rot,side,names,dect,f);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
    s='rec_area_BC.mat';
    uiopen(s,1);
    rec_area=rec_area_BC;
    numFiles_feat=size(rec_area_BC,1);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
    [sum_av,sum_std,sum_av_Gr] =Regions_of_interest_live(rec_area,numFiles_feat,I_PI_BC,side);
end

end

