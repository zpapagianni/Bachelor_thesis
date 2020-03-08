function [stat_values,Gr_stat_values,st_d,roi] = Statitics_of_region_live(h,image,side,limit_edge,time)


[mask]=out_mask(h,image);
temp=image;
roi=mask.*temp;
% figure 
% imshow(roi)
I= roi;     
% figure 
% imshow(I)

temp=roi;
seg_mask = I > limit_edge;
seg_mask = imfill(seg_mask, 'holes'); % Optional.  Delete for speed
seg_mask = bwareafilt(seg_mask, 1); % Optional, if there is noise in the dark left half.
roi=temp.*uint8(seg_mask);
% figure; imshow(roi)
if strcmp(side,'FR')|strcmp(side,'FL')|strcmp(side,'FN')
    [Stat_results,st_d]=stand_stats(roi,140);
else
    [Stat_results,st_d]=stand_stats(roi,140);
end
stat_values(1:3)= Stat_results(:);
new_temp=roi;
BW = edge(new_temp,'Sobel');
[counts,~] = imhist(BW);
stat_values(4)=counts(2);
st_d=transpose(st_d);
if time==2;
    roi=BW;
end
    
%%
% fig
% subplot(1,2,1);
% imshow(before)
% subplot(1,2,2);
% imshow(roi)
%% Gradients
I=roi;
[Gmi,Gxi,Gyi] = Grads(I);
Gmag=Gmi;
Gx=Gxi;
Gy=Gyi;
G=Gmag;
[Gr_Stat_results,stand_deviation] = stand_stats(G,2);
Gr_stat_values(1)= Gr_Stat_results(1);
Gr_stat_values(2)=stand_deviation;
end

