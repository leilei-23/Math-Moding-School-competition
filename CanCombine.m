function Can = CanCombine(NowSpace, NextSpace)
if (NowSpace(4) + NowSpace(1) == NextSpace(4) || NowSpace(4) == NextSpace(1) + NextSpace(4)) && NowSpace(2) == NextSpace(2) && NowSpace(3) == NextSpace(3)
    Can = 1;%左右合并
elseif (NowSpace(5) + NowSpace(2) == NextSpace(5) || NowSpace(5) == NextSpace(2) + NextSpace(5)) && NowSpace(1) == NextSpace(1) && NowSpace(3) == NextSpace(3)
    Can = 2;%上下合并
elseif (NowSpace(6) + NowSpace(3) == NextSpace(6) || NowSpace(6) == NextSpace(3) + NextSpace(6)) && NowSpace(2) == NextSpace(2) && NowSpace(1) == NextSpace(1)
    Can = 3;%前后合并
else
    Can = 0;%不能合并
end
