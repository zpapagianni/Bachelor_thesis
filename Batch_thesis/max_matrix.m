function [max] = max_matrix(row1,row2,col1,col2,array,max_gray)
area=array(row1:row2,col1:col2);
max=50;
for i = 1 : size(area,1);
    for j = 1 : size(area,2);
        if area(i,j)>max && area(i,j)<max_gray;
            max=area(i,j);
        end
    end
end

end

