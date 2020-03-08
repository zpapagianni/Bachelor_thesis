function [new_array ] = Filters(array,limit)
[rows, columns] = size(array);
for col = 1 : columns;
    for row = 1 : rows;
        if array(row,col)<=limit;          
           new_array(row,col)=0;
        else 
           new_array(row,col)=1; 
        end
    end
end
end

