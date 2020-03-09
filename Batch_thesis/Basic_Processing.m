
function [I_PI,numFiles] =Basic_Processing(PI_start,side,names,dect,f)

% PI=FR;
if dect==0
    numFiles = size(PI_start,3);
    target_names=[1:1:numFiles];
    
    for i=1:numFiles
        s=num2str(target_names(i));
        for k=1:numFiles
            name= strtok(names(k,:),'.');
            if strcmp(s,name)
                PI(:,:,i)=PI_start(:,k);
                clear -var s name
                break
            end
        end
    end
    
    %s==name
    % %% Find maximum number of rows
    % numFiles = size(PI,3);
    % for i = 1 : numFiles
    %      [rows,columns,~] = size(PI{:,:,i});
    %      if i==1
    %         max=rows;
    %         max_c=columns;
    %      elseif rows>max;
    %         max=rows;
    %      end
    %      if columns>max_c;
    %          max_c=columns;
    %      end
    % end
    % % [~] =output_subplot(PI,0)
    % %  figure; imshow(PI{:,:,8})
    % %% Correct rotation and positioning
    % optimizer = registration.optimizer.OnePlusOneEvolutionary;
    % metric = registration.metric.MattesMutualInformation;
    %
    % if strcmp(side,'BR')
    %     flag=1;
    %     PI{:,:,10}=imregister(PI{:,:,10},PI{:,:,9},'affine',optimizer,metric);
    % elseif strcmp(side,'BL')
    %     flag=1;
    % else
    %     l=2;
    %     for i = 1 : numFiles
    %         if i~=l;
    %            PI{:,:,i}=imregister(PI{:,:,i},PI{:,:,l},'affine',optimizer,metric);
    %         end
    %         PI{:,:,i} = imresize(PI{:,:,i}, [max max_c],'bilinear');
    %     end
    % end
    %
    % % [~] =output_subplot(PI,0)
    % %  figure; imshow(PI{:,:,2})
    %% Crop and remove backround
    I_PI=cell(1,1,numFiles);
    if side=='FL';
        %     flag=0;
        %     image_pr=PI{:,:,1};
        %     for row=710:-1:680;
        %         if  image_pr(row,30)>100 && flag==0;
        %             y_crop=row;
        %             flag=1;
        %         end
        %     end
        rect=[249.5 8.5 641 662];
    elseif side=='FR'
        %     rect=[8 8 814 755]; %old
        rect=[47 4 720 719];
    elseif side=='FN'
        %     rect=[13 7 973 740];
        rect=[110 50 885 691];
    elseif side=='BR'
        rect=[81 1 620 726];
        %     rect=[163 1 575 758];
    elseif side=='BL'
        rect=[243 6 641 668];
        %     rect=[122 6 686 745];
    elseif side=='BC'
        %     rect=[1 1 971 756];
        rect=[7 48 1009 499];
        %     rect=[1 1 971 777];
    end
    
    % figure
    % imshow(PI{:,:,1});
    % rect = imrect(gca,rect);
    % position = wait(rect);
    
    for i = 1 : numFiles
        I_PI{:,:,i} =imcrop(PI{:,:,i},rect);
    end
    % [~]=output_subplot(I_PI,0)
    %  figure; imshow(I_PI{:,:,2})
    
    %% Contour image
%     
    if f==1;
        if strcmp(side,'BL')
            k=10;
            BL_BW = Contour(I_PI{:,:,k},side);
            cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
            save('BL_BW.mat','BL_BW')
            cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
        elseif strcmp(side,'FR')
            k=6;
            FR_BW = Contour(I_PI{:,:,k},side);
            cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
            save('FR_BW.mat','FR_BW')
            cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
        elseif strcmp(side,'FL')
            k=1;
            FL_BW = Contour(I_PI{:,:,k},side);
            cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
            save('FL_BW.mat','FL_BW')
            cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
        elseif strcmp(side,'FN')
            k=1;
            FN_BW = Contour(I_PI{:,:,k},side);
            cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
            save('FN_BW.mat','FN_BW')
            cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
        elseif strcmp(side,'BR')
            k=2;
            BR_BW = Contour(I_PI{:,:,k},side);
            cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
            save('BR_BW.mat','BR_BW')
            cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
        elseif strcmp(side,'BC')
            k=1;
            BC_BW = Contour(I_PI{:,:,k},side);
            cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
            save('BC_BW.mat','BC_BW')
            cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
        end
    else
        if strcmp(side,'BL')
            cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
            s1='_BW.mat';
            s=strcat(side,s1);
            uiopen(s,1);
            cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
            BW=BL_BW;
        elseif strcmp(side,'FR')
            cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
            s1='_BW.mat';
            s=strcat(side,s1);
            uiopen(s,1);
            cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
            BW=FR_BW;
        elseif strcmp(side,'FL')
            cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
            s1='_BW.mat';
            s=strcat(side,s1);
            uiopen(s,1);
            cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
            BW=FL_BW;
        elseif strcmp(side,'FN')
            cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
            s1='_BW.mat';
            s=strcat(side,s1);
            uiopen(s,1);
            cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
            BW=FN_BW;
        elseif strcmp(side,'BR')
            cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
            s1='_BW.mat';
            s=strcat(side,s1);
            uiopen(s,1);
            cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
            BW=BR_BW;
        elseif strcmp(side,'BC')
            cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
            s1='_BW.mat';
            s=strcat(side,s1);
            uiopen(s,1);
            cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
            BW=BC_BW;
        end
    end
% %     
%     % BW = Contour(I_PI{:,:,k},side);
% %     
    for i = 1 : numFiles
        temp=I_PI{:,:,i};
        I_PI{:,:,i}=uint8(BW).*temp;
    end
%     figure;imshowpair(PI{:,:,1},I_PI{:,:,1},'montage')
%     
%     figure;imshowpair(PI{:,:,18},I_PI{:,:,18},'montage')
    
%      before=I_PI{:,:,1};
%      before_2=I_PI{:,:,18};
    %
    %% Sharpen image
    %
    for i = 1 : numFiles
        I_PI{:,:,i} = sharpen(I_PI{:,:,i});
        I_PI_2{:,:,i}=sharpen(I_PI{:,:,i});
        I_PI{:,:,i}=I_PI_2{:,:,i};;
    end
%    figure;imshowpair(before,I_PI{:,:,1},'montage')
%    figure;imshowpair(before_2,I_PI{:,:,18},'montage')
else
    numFiles =1;
    PI=PI_start;
    if side=='FL';
        rect=[249.5 8.5 641 662];
    elseif side=='FR'
        rect=[47 4 720 719];
    elseif side=='FN'
        rect=[110 50 885 691];
    elseif side=='BR'
        rect=[81 1 620 726];
    elseif side=='BL'
        rect=[243 6 641 668];
    elseif side=='BC'
        rect=[7 48 1009 499];
    end
%     figure
%     imshow(PI);
%     rect = imrect(gca,rect);
    I_PI =imcrop(PI,rect);
    if strcmp(side,'BL')
        cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
        s1='_BW.mat';
        s=strcat(side,s1);
        uiopen(s,1);
        cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
        BW=BL_BW;
    elseif strcmp(side,'FR')
        cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
        s1='_BW.mat';
        s=strcat(side,s1);
        uiopen(s,1);
        cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
        BW=FR_BW;
    elseif strcmp(side,'FL')
        cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
        s1='_BW.mat';
        s=strcat(side,s1);
        uiopen(s,1);
        cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
        BW=FL_BW;
    elseif strcmp(side,'FN')
        cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
        s1='_BW.mat';
        s=strcat(side,s1);
        uiopen(s,1);
        cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
        BW=FN_BW;
    elseif strcmp(side,'BR')
        cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
        s1='_BW.mat';
        s=strcat(side,s1);
        uiopen(s,1);
        cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
        BW=BR_BW;
    elseif strcmp(side,'BC')
        cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
        s1='_BW.mat';
        s=strcat(side,s1);
        uiopen(s,1);
        cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
        BW=BC_BW;
    end
    temp=I_PI;
    I_PI=uint8(BW).*temp;
    I_PI = sharpen(I_PI);
    I_PI_2=sharpen(I_PI);
    I_PI=I_PI_2;
%     f4=figure('pos',[70 60 550 320]);
    f4=figure('pos',[3847,-124.200000000000,642,440.800000000000])
    imshow(I_PI)
    title('Backround removal')
    set(f4, 'Position',[4482.20000000000,-148.2,507.600000000000,365.200000000000]);
    h=1;
end

% [~] =output_subplot(I_PI,0)
% %  figure; imshow(I_PI{:,:,1})
% % figure
% % imshowpair(before,I_PI{:,:,1},'montage')
% % figure
% % imshowpair(before,I_PI_2{:,:,1},'montage')
% % figure
% % imshowpair(I_PI{:,:,1},I_PI_2{:,:,1},'montage')

end


