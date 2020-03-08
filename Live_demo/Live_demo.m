
%% Live demo
close all
clear all
clc

%% Sides to recognize
srcFiles = dir('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Detection\*.png');  % the folder in which ur images exists
numFiles_feat = length(srcFiles);
max=100;
for i = 1 : numFiles_feat
    filename = strcat('C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Detection\',srcFiles(i).name);
    feat= rgb2gray(imread(filename));
     FI{:,:,i}= feat;
end
list = {'Right-side','Left-Side',...                   
'Front','Back','Continue'};
[indx,tf] = listdlg('ListString',list);

%%
prompt = {'Enter item number:'};
title = 'Input';
dims = [1 35];
definput = {'27'};
item = inputdlg(prompt,title,dims,definput);
waitfor(item);
item=str2double(item);
%% Connect to webcam
c = ipcam('http://10.227.113.162/live');
% c = webcam(1); %webcam
%% Setup preview window
figcam = figure_monitor2('NumberTitle', 'off', 'MenuBar', 'none','pos',[10 440 500 350]);
figcam.Name = 'My Camera';
ax = axes(figcam);
frame = snapshot(c);
im = image(ax, zeros(size(frame), 'uint8'));
axis(ax, 'image');
angle=90;
camroll(angle) 
%% Start preview
preview(c, im)
setappdata(figcam, 'cam', c);
figcam.CloseRequestFcn = @closePreviewWindow_Callback;
figure(1)=figcam;
h1=figcam;
dect=1;
f=0;
names='';
lo=0;
%%
answer = questdlg('Continue?')
switch answer
    case 'Yes'
        cont=0;
    case 'No'
        pause
    case 'Cancel'
       return
end
%%
%figures to keep
figs2keep = [1];
load_array=[1:6];
%%

while lo<6 &indx~=5;
if indx==1
    feat=6;
    load_array(indx)=0;
    [sum_av_FR,sum_std_FR,sum_av_Gr_FR] = Detection(indx,c,FI{:,:,feat},angle)
    WinOnTop(h1);
    user_an = continueloop;   
    if user_an==1
        all_figs = findobj(0, 'type', 'figure');
        delete(setdiff(all_figs, figs2keep)); 
        indx=2;
        load_array(indx)=0;
        feat=3;
        [sum_av_BR,sum_std_BR,sum_av_Gr_BR] =Detection(indx,c,FI{:,:,feat},angle)
        lo=lo+1;
        WinOnTop(h1);
        if lo<6
        list = {'Right-side','Left-Side',...
            'Front','Back','Stop'};
        [indx,tf] = listdlg('ListString',list);
        end
        all_figs = findobj(0, 'type', 'figure');   
        delete(setdiff(all_figs, figs2keep));
    else
        indx=5;
    end
    lo=lo+1;
    
elseif indx==2
    indx=3;
    load_array(indx)=0;
    feat=4;
    [sum_av_FL,sum_std_FL,sum_av_Gr_FL]=Detection(indx,c,FI{:,:,feat},angle)
    WinOnTop(h1);
    user_an = continueloop;
    if user_an==1
        all_figs = findobj(0, 'type', 'figure');
        delete(setdiff(all_figs, figs2keep)); 
        indx=4;
        load_array(indx)=0;
        feat=2;
        [sum_av_BL,sum_std_BL,sum_av_Gr_BL]=Detection(indx,c,FI{:,:,feat},angle)
        lo=lo+1;
        WinOnTop(h1);
        if lo<6
        list = {'Right-side','Left-Side',...
            'Front','Back','Stop'};
        [indx,tf] = listdlg('ListString',list);
        end
        all_figs = findobj(0, 'type', 'figure');   
        delete(setdiff(all_figs, figs2keep));
    else
        indx=7;
    end
    lo=lo+1;
    
elseif indx==3
    feat=5;
    indx=5;
    load_array(indx)=0;
    [sum_av_FN,sum_std_FN,sum_av_Gr_FN] = Detection(indx,c,FI{:,:,feat},angle)
    lo=lo+1;
    WinOnTop(h1);
    if lo<6
    list = {'Right-side','Left-Side',...
        'Front','Back','Stop'};
    [indx,tf] = listdlg('ListString',list);
    end
    
    all_figs = findobj(0, 'type', 'figure');
    delete(setdiff(all_figs, figs2keep)); 
elseif indx==4
    feat=1;
    indx=6;
    load_array(indx)=0;
    [sum_av_BC,sum_std_BC,sum_av_Gr_BC] =Detection(indx,c,FI{:,:,feat},angle)
    lo=lo+1;
    WinOnTop(h1);
    if lo<6
    list = {'Right-side','Left-Side',...
        'Front','Back','Stop'};
    [indx,tf] = listdlg('ListString',list);
    end
    all_figs = findobj(0, 'type', 'figure');
    delete(setdiff(all_figs, figs2keep)); 
end
end
%%
all_figs = findobj(0, 'type', 'figure');
delete(setdiff(all_figs, figs2keep)); 
%%
cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis\Statistics'

for i=1:6
    if load_array(i)==1;
        load 'total_FR.mat';
        load 'total_Gr_FR.mat';
        sum_av_FR=total_FR(item,:);
        sum_av_Gr_FR=total_Gr_FR(item,:);
    elseif load_array(i)==2;
        load 'total_BR.mat';
        load 'total_Gr_BR.mat';
        sum_av_BR=total_BR(item,:);
        sum_av_Gr_BR=total_Gr_BR(item,:);
    elseif load_array(i)==3;
        load 'total_FL.mat';
        load 'total_Gr_FL.mat';
        sum_av_FL=total_FL(item,:);
        sum_av_Gr_FL=total_Gr_FL(item,:);
    elseif load_array(i)==4;
        load 'total_BL.mat';
        load 'total_Gr_BL.mat';
        sum_av_BL=total_BL(item,:);
        sum_av_Gr_BL=total_Gr_BL(item,:);
    elseif load_array(i)==5;
        load 'total_FN.mat';
        load 'total_Gr_FN.mat';
        sum_av_FN=total_FN(item,:);
        sum_av_Gr_FN=total_Gr_FN(item,:);
    elseif load_array(i)==6;
        load 'total_BC.mat';
        load 'total_Gr_BC.mat';
        sum_av_BC=total_BC(item,:);
        sum_av_Gr_BC=total_Gr_BC(item,:);
    elseif load_array(i)==0;
            if i==1;                
                sum_av_FR=[sum_av_FR sum_std_FR];
            elseif i==3;
                 sum_av_FL=[sum_av_FL sum_std_FL];
            elseif i==5;
                sum_av_FN=[sum_av_FN sum_std_FN];
            elseif i==2;
                 sum_av_BR=[sum_av_BR sum_std_BR];
            elseif i==4;
                 sum_av_BL=[sum_av_BL sum_std_BL];
            else
                 sum_av_BC=[sum_av_BC sum_std_BC];
            end
            
        
    end
end
cd 'C:\Users\Zoe Papagianni\Documents\MATLAB\Bachelor Thesis'


%%
total_sum_Fr=sum_av_FL+sum_av_FR+sum_av_FN;
total_sum_Fr_Gr=sum_av_Gr_FL+sum_av_Gr_FR+sum_av_Gr_FN;
% total_st_d_Fr=sqrt(sum_std_FR.^2+sum_std_FL.^2+sum_std_FN.^2);
% total_sum_Fr=[total_sum_Fr total_st_d_Fr];

total_sum_Bc=(sum_av_BL+sum_av_BR +sum_av_BC);
total_sum_Bc_Gr=sum_av_Gr_BL+sum_av_Gr_BR+sum_av_Gr_BC;
% total_st_d_Bc=sqrt(sum_std_BL.^2+sum_std_BR.^2+sum_std_BC.^2);
% total_sum_Bc=[total_sum_Bc total_st_d_Bc];
%%
total_live=total_sum_Fr+total_sum_Bc;
total_live_Gr=total_sum_Fr_Gr+total_sum_Bc_Gr;
%%
input_1_live=(((total_live_Gr(1))./(total_live(1).^2))+((total_live(2))).*total_live(4));
%%
load net_1_live
newinput1=[total_live(1) total_live_Gr(1) total_live(2) total_live(4) input_1_live]';
newoutput1= net_1_live(newinput1)
load trainedClassifier_1

label = predict(trainedClassifier_1.ClassificationSVM,newinput1')
%%
load net_2_live
newinput2=[total_live(1) total_live_Gr(1) total_live(2) total_live(3) total_live(4) total_live(5) input_1_live]';
newoutput2= net_2_live(newinput2)


%%
load net_3_live
newinput3=[total_live(1) total_live_Gr(1) total_live_Gr(2) total_live(2) total_live(4) total_live(5) input_1_live]';
newoutput3= net_3_live(newinput3)
load trainedClassifier_2
label = predict(trainedClassifier_2.ClassificationSVM,newinput3')

load net_4_live
newinput4=[total_live(1) total_live_Gr(1) total_live(2) total_live(4)]';
newoutput4= net_4_live(newinput4)

%%
out=[newoutput1' ; newoutput2'; newoutput3' ;newoutput4'];
c = categorical({'NN 1','NN 2','NN 3','NN 4'});
close all
figure;
bar(c,out)
legend('Bad','Good')

%% Weight output
load('c_net1.mat')
load('c_net2.mat')
load('c_net3.mat')
load('c_net4.mat')
w(:)=(out(1,:).*c_net1+out(2,:).*c_net2+out(3,:).*c_net3+out(4,:).*c_net4)./4;
% if w>0.5
    
%% Local functions
function closePreviewWindow_Callback(obj, ~)
c = getappdata(obj, 'cam');
closePreview(c)
delete(obj)
end




   



