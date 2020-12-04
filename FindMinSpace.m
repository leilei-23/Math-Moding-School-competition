function [MinSpace,Index] = FindMinSpace(Goods, spacelist)
for i = 1 : size(spacelist, 1)
    if CanIn(Goods,spacelist(i,:)) == 1
        MinSpace = spacelist(i,:);
        Index = i;
        break
    end
end
