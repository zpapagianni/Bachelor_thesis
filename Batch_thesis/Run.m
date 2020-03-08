
clc
close all
clear all
% clearvars -EXCEPT numFiles

numFiles=52;

target_names=[1:1:numFiles];

%% Target 
% clear all
target_FR=zeros(2,numFiles);
% target_FR(1,16:numFiles)=1-target_FR(1,16:numFiles);
% target_FR(1,1:15)=
target_FR(1,16:numFiles)=[1 1 1 1 1 1 1 0 1 1 0 1 0 1 1 ... %%31
    1 1 1 0 1 1 1 1 1 1 0 1 1 1 1 ...
    1 1 1 1 1 0 1];
target_FR(2,:)=ones(1,numFiles)-target_FR(1,:);
%%
target_FL=zeros(2,numFiles);
% target_FL(1,16:numFiles)=1-target_FL(1,16:numFiles);
% 0,0,0,0];
%     1,1,1,1,1,1,0,0,0,0];
target_FL(1,16:numFiles)=[1 1 1 0 1 1 0 1 0 1 0 1 1 0 0 ...
    1 1 1 1 1 1 0 1 1 0 1 1 1 1 1 ...
    1 0 1 0 1 0 1];
target_FL(2,:)=ones(1,numFiles)-target_FL(1,:);
%%
target_FN=zeros(2,numFiles);
target_FN(1,16:numFiles)=1-target_FN(1,16:numFiles);
target_FN(1,16:numFiles)=[1 1 0 1 0 1 1 1 1 1 1 1 1 1 1 ...
    1 1 1 1 1 1 1 1 1 1 1 1 1 0 1 ...
    1 1 1 1 1 1 1];
target_FN(2,:)=ones(1,numFiles)-target_FN(1,:);
 

%%
target_BR=zeros(2,numFiles);
 target_BR(1,16:numFiles)=1-target_BR(1,16:numFiles);
target_BR(1,16:numFiles)=[1 1 0 1 0 1 1 1 1 0 1 1 1 1 1 ...
    0 0 1 1 1 1 1 1 1 1 1 0 1 0 1 ...
    1 1 1 1 1 1 0];
% target_FR(1,1:15)=
% [0,1,0,1,0,0,0,1,0,0];
% 0,0,0,0];
target_BR(2,:)=ones(1,numFiles)-target_BR(1,:);

%%
target_BL=zeros(2,numFiles);
 target_BL(1,16:numFiles)=1-target_BL(1,16:numFiles);
% target_BL(1,16:numFiles)=[0 1 1 1 1 0 0 1 0 1 1 0 0 0 0 ...
%     0 1 0 1 0 0 1 1 0 1 1 1 1 1 0 ...
%     1 0 1 1 0 1 0];
% 0,0,0,0];
%     1,1,1,1,1,1,0,0,0,0];
target_BL(2,:)=ones(1,numFiles)-target_BL(1,:);

%%
target_BC=zeros(2,numFiles);
target_BC(1,16:numFiles)=1-target_BC(1,16:numFiles);
% target_BC(1,16:numFiles)=[0 1 0 0 0 1 1 0 1 1 1 1 1 1 1 ...
%     1 1 1 1 1 1 1 0 1 0 1 1 1 1 1 ...
%     0 1 1 0 0 1 1];
% 0,0,0,0];
%     1,1,1,1,1,1,0,0,0,0];
target_BC(2,:)=ones(1,numFiles)-target_BC(1,:);
target_names=[1:1:numFiles];

% target_FR=zeros(2,numFiles);
% target_FR(1,:)=[0,1,0,1,0,0,0,1,0,0];
% target_FR(2,:)=ones(1,numFiles)-target_FR(1,:);
% 
% target_FL=zeros(2,numFiles);
% target_FL(1,:)=[0,1,1,0,1,1,0,1,1,0];
% target_FL(2,:)=ones(1,numFiles)-target_FL(1,:);
% 
% target_BR=zeros(2,numFiles);
% target_BR(1,:)=[0,1,0,0,1,0,0,0,1,0];
% target_BR(2,:)=ones(1,numFiles)-target_BR(1,:);
% 
% target_BL=zeros(2,numFiles);
% % target_BL(1,:)=[0,0,0,1,1,1,0,1,0,0];
% target_BL(1,:)=[0,0,0,0,1,0,0,0,1,0];
% 
% target_BL(2,:)=ones(1,numFiles)-target_BL(1,:);

for i=1:numFiles
    if target_FR(1,i)==1
        sum_target_Fr(i)=1;
    elseif target_FL(1,i)==1
        sum_target_Fr(i)=1;
    elseif target_FN(1,i)==1
        sum_target_Fr(i)=1;
    else
        sum_target_Fr(i)=0;
    end
end
for i=1:numFiles
    if target_BR(1,i)==1
        sum_target_Bc(i)=1;
    elseif target_BL(1,i)==1
        sum_target_Bc(i)=1;
    elseif target_BC(1,i)==1
        sum_target_Bc(i)=1;
    else
        sum_target_Bc(i)=0;
    end
end

% for i=1:numFiles
%     if target_BC(1,i)==1 | target_FN(1,i)==1
%         sum_1(i)=1;
%     elseif target_BL(1,i)==1|target_FR(1,i)==1 
%         sum_2(i)=1;
%     elseif target_BR(1,i)==1 | target_FL(1,i)==1 
%         sum_3(i)=1;
%     else
%         sum_1(i)=0;
%         sum_2(i)=0;
%         sum_3(i)=0;
%     end
% end

for i=1:numFiles
    if target_BR(1,i)==1 | target_FL(1,i)==1 |target_BL(1,i)==1|target_FR(1,i)==1
        sum_1(i)=1;
    else
        sum_1(i)=0;
    end
end

[total_sum_Fr,total_sum_Gr_Fr,total_FL,total_FR,total_FN,total_Gr_FL,total_Gr_FR,total_Gr_FN] = Front_part(sum_target_Fr,numFiles);
[good_parts_Fr,good_parts_names_Fr,good_parts_Gr_Fr,bad_parts_Fr,bad_parts_names_Fr,bad_parts_Gr_Fr] =Results_Processing(total_sum_Fr,total_sum_Gr_Fr,numFiles,sum_target_Fr,target_names);
cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Statistics'
save('total_FR.mat','total_FR')
save('total_Gr_FR.mat','total_Gr_FR')
save('total_FL.mat','total_FL')
save('total_Gr_FL.mat','total_Gr_FL')
save('total_FN.mat','total_FN')
save('total_Gr_FN.mat','total_Gr_FN')
cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
%%
[total_sum_Bc,total_sum_Gr_Bc,total_BL,total_BR,total_BC,total_Gr_BL,total_Gr_BR,total_Gr_BC] = Back_part(sum_target_Bc,numFiles);
[good_parts_Bc,good_parts_names_Bc,good_parts_Gr_Bc,bad_parts_Bc,bad_parts_names_Bc,bad_parts_Gr_Bc]=Results_Processing(total_sum_Bc,total_sum_Gr_Bc,numFiles,sum_target_Fr,target_names);
cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Statistics'
save('total_BR.mat','total_BR')
save('total_Gr_BR.mat','total_Gr_BR')
save('total_BL.mat','total_BL')
save('total_Gr_BL.mat','total_Gr_BL')
save('total_BC.mat','total_BC')
save('total_Gr_BC.mat','total_Gr_BC')
cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'
close all
%%

clearvars sum_good sum_good_Gr good_names sum_bad sum_bad_Gr bad_names
% total_1=total_FN+total_BC;
% total_1=total_FR+total_BL+total_FR+total_BL;
% total_2=total_FR+total_BL;
% total_3=total_FL+total_BR;
% 
% % total_1_Gr=total_Gr_FN+total_Gr_BC;
% total_1_Gr=total_Gr_FL+total_Gr_BR+total_Gr_FR+total_Gr_BL;
% total_2_Gr=total_Gr_FR+total_Gr_BL;
% total_3_Gr=total_Gr_FL+total_Gr_BR;

% sum_target(2,:)=ones(1,numFiles)-sum_target(1,:);
% 
% sum_1(2,:)=ones(1,numFiles)-sum_1(1,:);
% [good_parts_1,good_parts_names_1,good_parts_Gr_1,bad_parts_1,bad_parts_names_1,bad_parts_Gr_1] =Results_Processing(total_1,total_1_Gr,numFiles,sum_1,target_names);
% input_1=(((total_1_Gr(:,1))./(total_1(:,1).^2))+((total_1(:,2))).*total_1(:,4))';
% % [testPerformance] =Neural_net_image(input_1,sum_target,nhn)
% input_2=[total_1(:,1) total_1_Gr(:,1) total_1(:,2) total_1(:,4)];
% [testPerformance] =Neural_net_image(input_2',sum_1,nhn) 
% input_3=[total_1(:,1) total_1_Gr(:,1) total_1(:,2) total_1(:,3) total_1(:,4) total_1(:,5)];
% [testPerformance] =Neural_net_image(input_3',sum_1,nhn) 



total=total_sum_Fr+total_sum_Bc;
total_Gr=total_sum_Gr_Fr+total_sum_Gr_Bc;

s1=size(good_parts_names_Fr,1);
s2=size(good_parts_names_Bc,1);
l=0;
for i=1:s1
    j=1;
    flag=0;
    while j<=s2 & flag==0
        if good_parts_names_Fr(i)==good_parts_names_Bc(j)
            l=l+1;
            flag=1;           
            good_names(l)=good_parts_names_Fr(i);   
        end
        j = j + 1;
    end
end

s2=size(target_names);
tix=zeros(numFiles);

for i=1:numFiles
    for j=1:l
        if good_names(j)==target_names(i)
            tix(i)=1;
        end
    end
end

k=0;
l=0;
for i=1:numFiles
    if tix(i)==1
       l=l+1;
       sum_good(l,:)=total(i,:);
       sum_good_Gr(l,:)=total_Gr(i,:);  
    else
       k=k+1; 
       sum_bad(k,:)=total(i,:);
       sum_bad_Gr(k,:)=total_Gr(i,:); 
    end
end

if k>=l
    [sum_good,sum_good_Gr] = plot_proc(sum_good,sum_good_Gr,l,k);
elseif l>=k 
    [sum_bad,sum_bad_Gr] = plot_proc(sum_bad,sum_bad_Gr,k,l);     
end

[x,y] =result_graph(sum_good,sum_good_Gr,sum_bad,sum_bad_Gr);

for i=1:numFiles
    if sum_target_Bc(i)==1|sum_target_Fr(i)==1
       sum_target(i)=1;
    else
        sum_target(i)=0;
    end
end

%%
numFiles=52;
close all
nhn=30;
sum_target(2,:)=ones(1,numFiles)-sum_target(1,:);
 input_1= (((total(:,1).^2)+(total(:,5).^2))./(total_Gr(:,1))+total_Gr(:,2).^2)';
% % % input_1=(((total_Gr(:,1))./(total(:,1).^2))+((total(:,2))).*total(:,4))';
% input_1=(((total_Gr(:,1))./(total(:,1).^2))+((total(:,2))).*total(:,4))';
% [testPerformance] =Neural_net_image(input_1,sum_target,nhn)

input_2=[total(:,1) total_Gr(:,1) total(:,2) total(:,4) input_1']';
[testPerformance,net,c] =Neural_net_image(input_2,sum_target,nhn)
c_net1=c;
net_1_live=net;
%%
clearvars -EXCEPT net_1_live c_net1 sum_target nhn total total_Gr input_1
 save net_1_live
 save c_net1

input_3=[total(:,1) total_Gr(:,1) total(:,2) total(:,3) total(:,4) total(:,5) input_1']';
% while 
[testPerformance,net,c,tr] =Neural_net_image(input_3,sum_target,nhn); 
net_2_live=net;
c_net2=c;
clearvars -EXCEPT net_2_live c_net2 sum_target nhn total total_Gr input_1
save net_2_live
save c_net2
%%
input_4=[total(:,1) total_Gr(:,1) total(:,2) total(:,4)]';
[testPerformance,net,c] =Neural_net_image(input_4,sum_target,nhn)
net_4_live=net;
c_net4=c;
clearvars -EXCEPT net_4_live c_net4 sum_target nhn total total_Gr input_1
% save net_4_live
% save c_net4
%%
input_5=[total(:,1) total_Gr(:,1) total_Gr(:,2) total(:,2) total(:,4) total(:,5) input_1']';
[testPerformance,net,c] =Neural_net_image(input_5,sum_target,nhn) 
net_3_live=net;
c_net3=c;
clearvars -EXCEPT net_3_live c_net3 sum_target nhn total total_Gr input_1
 save net_3_live
save c_net3

%%
% input_1=(((total_Gr(:,1))./(total(:,1).^2))+((total(:,2))).*total(:,4))';
% 
% input_2=[total(:,1) total_Gr(:,1) total(:,2) total(:,4) input_1']';
% 
% input_class_1=[input_2' sum_target(1,:)'];
% [trainedClassifier_1, validationAccuracy_1] = trainClassifier(input_class_1);
% confusionmat
% clearvars -EXCEPT sum_target total total_Gr input_1 trainedClassifier_1 validationAccuracy_1 input 1
% % save trainedClassifier_1
% %%
% input_5=[total(:,1) total_Gr(:,1) total_Gr(:,2) total(:,2) total(:,4) total(:,5) input_1']';
% input_class_2=[input_5' sum_target(1,:)'];
% [trainedClassifier_2, validationAccuracy_2]=trainClassifier_8(input_class_2);
% clearvars -EXCEPT sum_target total total_Gr trainedClassifier_2 validationAccuracy_2
% % % save trainedClassifier_2
% % %%
% % label = predict(trainedClassifier_1.ClassificationSVM,input_2')
