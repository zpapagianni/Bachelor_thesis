function [Stat_results,stand_deviation] = stand_stats(array,limit)
mean_value=mean2(array);
stand_deviation=std2(array);
[counts,~] = imhist(array); 
total_count=0;
for i=2:limit
    total_count=total_count+counts(i,1);
    dark_pixel(i)=counts(i)*i;
end    
mean_val_dark=mean(dark_pixel);
Stat_results=[mean_value total_count mean_val_dark];
end

