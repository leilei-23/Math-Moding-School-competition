function Compare = CompareBox(Goods, Box)
A = sort(Goods);
heightI = A(1);
widthI = A(2);
lengthI = A(3); 
BoxLength = Box(1); 
BoxWidth = Box(2); 
BoxHeight = Box(3); 
if heightI > BoxHeight || widthI > BoxWidth || lengthI > BoxLength 
    Compare = 0;
else
    Compare = 1;
end
