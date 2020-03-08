function [array,array_Gr] = plot_proc(array,array_Gr,min,max)
m=mean(array,1);
m_Gr=mean(array_Gr,1);
for i=min+1:max
   for j=1:5
        array(i,j)=m(j);
        if j<=2
            array_Gr(i,j)=m_Gr(j);
        end
    end
end
end

