function [total_sum,total_sum_Gr,total_BL,total_BR,total_BC,total_Gr_BL,total_Gr_BR,total_Gr_BC] = Back_part(sum_target,numFiles)
f=0;
dect=0;

%% Back Right

cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
side='BR';
file='BR.mat';
uiopen(file,1);

s2='_name.mat';
s=strcat('BR',s2);
uiopen(s,1);

s3='_reg.mat';
s=strcat('BR',s3);
uiopen(s,1);

PI_start=eval(side);
s3='_name';
s = strcat(side,s3);
names=char(eval(s));

cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
% f=0;
[I_PI_BR,numFiles] =Basic_Processing(BR_reg,side,names,dect,f);
if f==1
    [rec_area_BR,numFiles_feat_BR]=Features(I_PI_BR{:,:,1},side);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
    save('rec_area_BR.mat','rec_area_BR')
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
else
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
    s='rec_area_BR.mat'
    uiopen(s,1);
    rec_area=rec_area_BR;
    numFiles_feat=size(rec_area_BR,1);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
end

clc
% close all
[sum_av_BR,sum_std_BR,sum_av_Gr_BR] =Regions_of_interest(rec_area,(numFiles_feat-1),I_PI_BR,numFiles,side);
% total_BR=[sum_av_BR sum_std_BR];
% [good_parts,good_parts_names,good_parts_Gr,bad_parts,bad_parts_names,bad_parts_Gr] =Results_Processing(total_BR,sum_av_Gr_BR,numFiles,target_BR,target_names);

%% Back left
cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'

side='BL';
file='BL.mat';
uiopen(file,1);

s2='_name.mat';
s=strcat('BL',s2);
uiopen(s,1);

s3='_reg.mat';
s=strcat('BL',s3);
uiopen(s,1);

PI_start=eval(side);
s3='_name';
s = strcat(side,s3);
names=char(eval(s));

cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'

[I_PI_BL,numFiles] =Basic_Processing(BL_reg,side,names,dect,f);
if f==1
    [rec_area_BL,numFiles_feat_BL]=Features(I_PI_BL{:,:,1},side);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
    save('rec_area_BL.mat','rec_area_BL')
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
else
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
    s='rec_area_BL.mat'
    uiopen(s,1);
    rec_area=rec_area_BL;
    numFiles_feat=size(rec_area_BL,1);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
end

% close all
[sum_av_BL,sum_std_BL,sum_av_Gr_BL] =Regions_of_interest(rec_area,numFiles_feat,I_PI_BL,numFiles,side);
% total_BL=[sum_av_BL sum_std_BL];
% [good_parts,good_parts_names,good_parts_Gr,bad_parts,bad_parts_names,bad_parts_Gr] =Results_Processing(total_BL,sum_av_Gr_BL,numFiles,target_BL,target_names);

%% Back
cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'

side='BC';
file='BC.mat';
uiopen(file,1);

s2='_name.mat';
s=strcat('BC',s2);
uiopen(s,1);

s3='_reg.mat';
s=strcat('BC',s3);
uiopen(s,1);

PI_start=eval(side);
s3='_name';
s = strcat(side,s3);
names=char(eval(s));

cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
% figure,imshowpair(BC_reg{:,:,1},BC_reg{:,:,3})
[I_PI_BC,numFiles] =Basic_Processing(BC_reg,side,names,dect,f);
% % rec_area(1,:)=[338 690 355 64];

if f==1
    [rec_area_BC,numFiles_feat_BC]=Features(I_PI_BC{:,:,1},side);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
    save('rec_area_BC.mat','rec_area_BC')
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
else
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
    s='rec_area_BC.mat'
    uiopen(s,1);
    rec_area=rec_area_BC;
    numFiles_feat=size(rec_area_BC,1);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
end

% rec_area(1,:)=[342 707 355 64];
% rec_area(2,:)=[11 5 370 345];
% numFiles_feat=2;
% close all
[sum_av_BC,sum_std_BC,sum_av_Gr_BC] =Regions_of_interest(rec_area,numFiles_feat,I_PI_BC,numFiles,side);
% total_BC=[sum_av_BC sum_std_BC];
% [good_parts,good_parts_names,good_parts_Gr,bad_parts,bad_parts_names,bad_parts_Gr] =Results_Processing(total_BC,sum_av_Gr_BC,numFiles,target_BC,target_names);

%%

total_sum=(sum_av_BL+sum_av_BR +sum_av_BC);
total_sum_Gr=sum_av_Gr_BL+sum_av_Gr_BR+sum_av_Gr_BC;
total_st_d=sqrt(sum_std_BL.^2+sum_std_BR.^2+sum_std_BC.^2);
total_sum=[total_sum total_st_d];

total_BL=[sum_av_BL sum_std_BL];
total_BR=[sum_av_BR sum_std_BR];
total_BC=[sum_av_BC sum_std_BC];
total_Gr_BL=sum_av_Gr_BL;
total_Gr_BR=sum_av_Gr_BR;
total_Gr_BC= sum_av_Gr_BC;

end
