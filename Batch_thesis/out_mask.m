function [mask] = out_mask(h,image)

c=h(:,1);
r=h(:,2);
[~,xi,yi] = roipoly(image,c,r);
mask=uint8(poly2mask(xi,yi,size(image,1),size(image,2)));

% [I,J]=size(image);
% for i=1:I
%     for j=1:J
%         if image(i,j)<=120
%             mask(i,j)=0;  
%         end
%     end
% end

end

