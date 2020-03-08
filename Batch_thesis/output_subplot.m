function [A] =output_subplot(A,inverse)
s=double(idivide(int8(size(A,3)),3,'floor'));
dif=size(A,3)-s*3;

if inverse==0
    figure
    for k = 1:3*s
        subplot(s,3,k)
        imshow(A{:,:,k});
    end
    if dif<3
        k=1;
        figure
        for l = (3*s+1):size(A,3)
            subplot(dif,1,k)
            imshow(A{:,:,l});
            k=k+1;
        end
    end
else
    figure
    for k = 1:3*s
        subplot(s,3,k)
        imshow(A{:,:,k},[]);
    end
    if dif<3
        k=1;
        figure
        for l = (3*s+1):size(A,3)
            subplot(dif,1,k)
            imshow(A{:,:,l},[]);
            k=k+1;
        end
    end
end
