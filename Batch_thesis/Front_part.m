function [total_sum,total_sum_Gr,total_FL,total_FR,total_FN,total_Gr_FL,total_Gr_FR,total_Gr_FN] = Front_part(sum_target,numFiles)
f=0;
dect=0;
%% Front right
% dect=0;
% f=0;
clc
cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
side='FR';
% file='FR.mat';
% uiopen(file,1);

s2='_name.mat';
s=strcat('FR',s2);
uiopen(s,1);

s3='_reg.mat';
s=strcat('FR',s3);
uiopen(s,1);

s4='_name';
s = strcat(side,s4);
names=char(eval(s));

cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
[I_PI_FR,numFiles] =Basic_Processing(FR_reg,side,names,dect,f);

% f=0;
if f==1
    [rec_area_FR,numFiles_feat_FR]=Features(I_PI_FR{:,:,1},side);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
    save('rec_area_FR.mat','rec_area_FR')
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
else 
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
    s='rec_area_FR.mat'
    uiopen(s,1);
    rec_area=rec_area_FR;
    numFiles_feat=size(rec_area_FR,1);
     cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
end
clc
% close all


[sum_av_FR,sum_std_FR,sum_av_Gr_FR] =Regions_of_interest(rec_area,numFiles_feat,I_PI_FR,numFiles,side);
 total_FR=[sum_av_FR sum_std_FR];
% [good_parts,good_parts_names,good_parts_Gr,bad_parts,bad_parts_names,bad_parts_Gr] =Results_Processing(total_FR,sum_av_Gr_FR,numFiles,target_FR,target_names);

%% Front left
% f=0;
cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'

side='FL';
file='FL.mat';
uiopen(file,1);

s2='_name.mat';
s=strcat('FL',s2);
uiopen(s,1);

s3='_reg.mat';
s=strcat('FL',s3);
uiopen(s,1);

PI_start=eval(side);
s3='_name';
s = strcat(side,s3);
names=char(eval(s));

cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
% 
% f=0;
[I_PI_FL,numFiles] =Basic_Processing(FL_reg,side,names,dect,f);
%%
%  f=0;
if f==1
    [rec_area_FL,numFiles_feat_FL]=Features(I_PI_FL{:,:,1},side);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
    save('rec_area_FL.mat','rec_area_FL')
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
else
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
    s='rec_area_FL.mat'
    uiopen(s,1);
    rec_area=rec_area_FL;
    numFiles_feat=size(rec_area_FL,1);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
end
% close all
[sum_av_FL,sum_std_FL,sum_av_Gr_FL] =Regions_of_interest(rec_area,numFiles_feat,I_PI_FL,numFiles,side);
total_FL=[sum_av_FL sum_std_FL];
% input_1=(((sum_av_Gr_FL(:,1))./(total_FL(:,1).^2))+((total_FL(:,2))).*total_FL(:,4))';
% [good_parts,good_parts_names,good_parts_Gr,bad_parts,bad_parts_names,bad_parts_Gr] =Results_Processing(total_FL,sum_av_Gr_FL,numFiles,target_FL,target_names);

%% Front 
cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'

side='FN';
file='FN.mat';
uiopen(file,1);

s2='_name.mat';
s=strcat('FN',s2);
uiopen(s,1);

s3='_reg.mat';
s=strcat('FN',s3);
uiopen(s,1);

PI_start=eval(side);
s3='_name';
s = strcat(side,s3);
names=char(eval(s));

cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
clc
% close all

[I_PI_FN,numFiles] =Basic_Processing(FN_reg,side,names,dect,f);

%%
% f=0;
% rec_area(1,:)=[267 674 399 64];
% rec_area(2,:)=[505 5 461 369];
% numFiles_feat=2;
if f==1
    rec_area_FN=[1 1 884 690];
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
    save('rec_area_FN.mat','rec_area_FN')
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
else
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
    s='rec_area_FN.mat'
    uiopen(s,1);
    rec_area=rec_area_FN;
    numFiles_feat=size(rec_area_FN,1);
    cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
end
%%
%rec_area(1,:)=[1 1 884 690];

% figure
% imshow(I_PI_FN{:,:,1});
% rect = imrect(gca,rec_area(1,:));
% position = wait(rect);
numFiles_feat=1;

% close all
[sum_av_FN,sum_std_FN,sum_av_Gr_FN] =Regions_of_interest(rec_area,numFiles_feat,I_PI_FN,numFiles,side);
total_FN=[sum_av_FN sum_std_FN];
%%
total_sum=sum_av_FL+sum_av_FR+sum_av_FN;
total_sum_Gr=sum_av_Gr_FL+sum_av_Gr_FR+sum_av_Gr_FN;
total_st_d=sqrt(sum_std_FR.^2+sum_std_FL.^2+sum_std_FN.^2);
total_sum=[total_sum total_st_d];

total_FL=[sum_av_FL sum_std_FL];
total_FR=[sum_av_FR sum_std_FR];
total_FN=[sum_av_FN sum_std_FN];
total_Gr_FL=sum_av_Gr_FL;
total_Gr_FR=sum_av_Gr_FR;
total_Gr_FN= sum_av_Gr_FN;
% cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
% side='FR';
% file='FR.mat';
% uiopen(file,1);
% 
% s2='_name.mat';
% s=strcat('FR',s2);
% uiopen(s,1);
% 
% PI_start=eval(side);
% s3='_name';
% s = strcat(side,s3);
% names=char(eval(s));
% 
% cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
% 
% [I_PI_FR,numFiles,target_names] =Basic_Processing(PI_start,names,side); 
% [rec_area,numFiles_feat]=Features(I_PI_FR{:,:,1},side);
% [sum_av_FR,sum_std_FR,sum_av_Gr_FR] =Regions_of_interest(rec_area,numFiles_feat,I_PI_FR,numFiles,side);
% 
% % scriptname='Copy_of_Regions_of_interest.m';
% % run(scriptname);
% close all
% clc
% 
% %% Front left
% cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
% 
% side='FL';
% file='FL.mat';
% uiopen(file,1);
% 
% s2='_name.mat';
% s=strcat('FL',s2);
% uiopen(s,1);
% 
% PI_start=eval(side);
% s3='_name';
% s = strcat(side,s3);
% names=char(eval(s));
% 
% cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
% % 
% [I_PI_FL,numFiles,target_names] =Basic_Processing(PI_start,names,side);
% [rec_area,numFiles_feat]=Features(I_PI_FL{:,:,1},side);
% 
% [sum_av_FL,sum_std_FL,sum_av_Gr_FL] =Regions_of_interest(rec_area,numFiles_feat,I_PI_FL,numFiles,side);
% 
% %% Front 
% cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Variables'
% 
% side='FN';
% file='FN.mat';
% uiopen(file,1);
% 
% s2='_name.mat';
% s=strcat('FN',s2);
% uiopen(s,1);
% 
% PI_start=eval(side);
% s3='_name';
% s = strcat(side,s3);
% names=char(eval(s));
% 
% cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
% clc
% close all
% 
% [I_PI_FN,numFiles,target_names] =Basic_Processing(PI_start,names,side);
% rec_area(1,:)=[267 674 399 64];
% rec_area(2,:)=[505 5 461 369];
% numFiles_feat=2;
% %%
% [sum_av_FN,sum_std_FN,sum_av_Gr_FN] =Regions_of_interest(rec_area,numFiles_feat,I_PI_FN,numFiles,side);
% 
% %%
% 
% total_sum=sum_av_FL+sum_av_FR+sum_av_FN;
% total_sum_Gr=sum_av_Gr_FL+sum_av_Gr_FR+sum_av_Gr_FN;
% total_st_d=sqrt(sum_std_FR.^2+sum_std_FL.^2+sum_std_FN.^2);
% total_sum=[total_sum total_st_d];
% close all
% nhn=20;
%  [good_parts,good_parts_names,good_parts_Gr,bad_parts,bad_parts_names,bad_parts_Gr] =Results_Processing(total_sum,total_sum_Gr,numFiles,sum_target,target_names);

% sum_target(2,:)=ones(1,numFiles)-sum_target(1,:);
% input_1=(((total_sum_Gr(:,1))./(total_sum(:,1).^2))+((total_sum(:,2))).*total_sum(:,4))';
%  [testPerformance] =Neural_net_image(input_1,sum_target,nhn)
% 
% input_2=[total_sum(:,1) total_sum_Gr(:,1) total_sum(:,2) total_sum(:,4) input_1'];
%  [testPerformance] =Neural_net_image(input_2',sum_target,nhn) 
% 
% %% Random generation of input
% 
% 
% clearvars new_sum_target new_bp new_gp new_bp_Gr new_gp_Gr
% 
% elements=50;
% 
% [r]=rand_gen(bad_parts,elements); 
% new_bp=[bad_parts ; r];
% clearvars r 
% 
% [r]=rand_gen(bad_parts_Gr,elements); 
% new_bp_Gr=[bad_parts_Gr ; r];
% clearvars r 
% 
% [r]=rand_gen(good_parts,elements); 
% new_gp=[good_parts ; r];
% clearvars r 
% 
% [r]=rand_gen(good_parts_Gr,elements); 
% new_gp_Gr=[good_parts_Gr ; r];
% clearvars r 
% 
% % [x,y] =result_graph(new_gp,new_gp_Gr,new_bp,new_bp_Gr);
% 
% %%
% new_total=[new_gp ; new_bp];
% new_total_Gr=[new_gp_Gr ; new_bp_Gr];
% 
% new_input_1=(((new_total_Gr(:,1))./(new_total(:,1).^2))+((new_total(:,2))).*new_total(:,4));
% new_input_2=[new_total(:,1) new_total_Gr(:,1) new_total(:,2) new_total(:,4) new_input_1];
% 
% new_sum_target(:,1)=[zeros(size(new_bp,1),1); ones(size(new_bp,1),1)];
% new_sum_target(:,2)=ones(size(new_sum_target,1),1)-new_sum_target(:,1);
% 
% nhn=20;
% [testPerformance] =Neural_net_image(new_input_2',new_sum_target',nhn) 

end

