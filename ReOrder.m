%该函数用来处理十进制中交叉和变异之中出来的前八位不能数字进行重复之间的问题。

function Temp1 = ReOrder(newpop)
Temp1 = newpop;
Temp2 = sort(newpop);
for i = 1 : length(newpop)
    for j  = 1 : length(Temp2)
        if newpop(i) == Temp2(j)
            Temp1(i) = j;
        end
    end
end
