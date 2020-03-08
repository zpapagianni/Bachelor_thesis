function[good_parts,good_parts_names,good_parts_Gr,bad_parts,bad_parts_names,bad_parts_Gr] =Results_Processing(sum_av,sum_av_Gr,numFiles,target,target_names)

l=0;
k=0;
for i=1:numFiles
    if target(1,i)==0
       l=l+1;
       good_parts(l,:)=sum_av(i,:);
       good_parts_names(l,1)=target_names(1,i);
       good_parts_Gr(l,:)=sum_av_Gr(i,:);
    else
        k=k+1;
        bad_parts(k,:)=sum_av(i,:);
        bad_parts_names(k,1)=target_names(1,i);
        bad_parts_Gr(k,:)=sum_av_Gr(i,:);
    end
end

if k>=l
    [good_parts,good_parts_Gr] = plot_proc(good_parts,good_parts_Gr,l,k);
elseif l>=k 
    [bad_parts,bad_parts_Gr] = plot_proc(bad_parts,bad_parts_Gr,k,l);     
end

[x,y] =result_graph(good_parts,good_parts_Gr,bad_parts,bad_parts_Gr);

end
