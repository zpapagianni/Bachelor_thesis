function [stat_values,Gr_stat_values,st_d] = Statitics_of_region(h,image,numFiles,j,side,limit_edge)

before_1=image{:,:,1};

[mask]=out_mask(h,image{:,:,1});

roi=cell(1,1,numFiles);
for k=1:numFiles
    temp=image{:,:,k};
    roi{:,:,k}=mask.*temp;
end
% figure
% imshowpair(before_1,roi{:,:,1},'montage') 

% figure 
% imshow(roi{:,:,1})

before=roi{:,:,1};

%   [~]=output_subplot(roi,0)
I= roi{:,:,4};     
% figure 
% imshow(I)

% [seg_mask,outline] = detect_edges(I);

for k=1:numFiles
    temp=roi{:,:,k};
    seg_mask = I > limit_edge;
%     bef=temp.*uint8(seg_mask);
    seg_mask = imfill(seg_mask, 'holes'); % Optional.  Delete for speed
    seg_mask = bwareafilt(seg_mask, 1); % Optional, if there is noise in the dark left half.   
    roi{:,:,k}=temp.*uint8(seg_mask);
%     figure
%     imshowpair(bef,roi{:,:,k},'montage') 
    if strcmp(side,'FR')|strcmp(side,'FL')|strcmp(side,'FN')
        [Stat_results,st_d(k)]=stand_stats(roi{:,:,k},140);
    else
        [Stat_results,st_d(k)]=stand_stats(roi{:,:,k},140);
    end
    stat_values(k,1:3)= Stat_results(:);
    new_temp=roi{:,:,k};
%     BW = edge(new_temp,'log');
    BW = edge(new_temp,'Sobel');
    [counts,~] = imhist(BW);
    stat_values(k,4)=counts(2);
end
% figure 
% imshow(roi{:,:,1})
% [~]=output_subplot(roi,0);

st_d=transpose(st_d);
% figure
% imshowpair(before,roi{:,:,1},'montage') 
% figure
% imshowpair(filt_im{:,:,9},filt_im{:,:,10},'montage') 


% Bl_wh=cell(1,1,numFiles);
% for i=1:numFiles
%     Bl_wh{:,:,i} = Filters(roi{:,:,i},170);
%     Bl_wh{:,:,i}=mat2gray(Bl_wh{:,:,i});
% end
%  Bl_wh_1 = Filters(roi{:,:,9},170);
%  Bl_wh_1=mat2gray(Bl_wh_1);
% Bl_wh_2 = Filters(roi{:,:,10},170);
%     Bl_wh_2=mat2gray(Bl_wh_2);
% figure
% imshowpair(Bl_wh_1,Bl_wh_2,'montage') 

%% Gradients

Gmag=cell(1,1,numFiles);
Gx=cell(1,1,numFiles);
Gy=cell(1,1,numFiles);
for k=1:numFiles
    I=roi{:,:,k};
    [Gmi,Gxi,Gyi] = Grads(I);
    Gmag{:,:,k}=Gmi;
    Gx{:,:,k}=Gxi;
    Gy{:,:,k}=Gyi;    
end
% figure;imshow(Gmag{:,:,10},[])
% [~]=output_subplot(Gmag,1);
for k=1:numFiles
   G{:,:,k}=Gmag{:,:,k};
   [Gr_Stat_results,stand_deviation] = stand_stats(G{:,:,k},2);
   Gr_stat_values(k,1)= Gr_Stat_results(1); 
   Gr_stat_values(k,2)=stand_deviation;
end

x=[1:size(roi,3)];
% plot(x,stat_values(:,1))

% figure
% subplot(2,3,1)
% plot(x,stat_values(:,1))
% title('Subplot 1: Mean values')
% grid on
% grid minor
% 
% subplot(2,3,2)
% plot(x,stat_values(:,2))
% title('Subplot 2: Deviation')
% grid on
% grid minor
% 
% subplot(2,3,3)
% plot(x,stat_values(:,4))
% title('Subplot 3: Count of dark pixels')
% grid on
% grid minor
% 
% subplot(2,3,4)
% plot(x,Gr_stat_values(:,1))
% title('Subplot 4: Gradient Mean values')
% grid on
% grid minor
% 
% subplot(2,3,5)
% plot(x,Gr_stat_values(:,2))
% title('Subplot 5: Gradient Deviation')
% grid on
% grid minor
% 
% subplot(2,3,6)
% plot(x,stat_values(:,5))
% title('Subplot 6: Mean values of dark pixels')
% grid on
% grid minor

end

