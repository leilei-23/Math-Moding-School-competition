function NewSpace = Combine(NowSpace,NextSpace,Can)
if Can == 1         %左右合并
    NewSpace = [NowSpace(1) + NextSpace(1), NowSpace(2), NowSpace(3), min(NowSpace(4),NextSpace(4)), NowSpace(5), NowSpace(6),0];
elseif Can ==2      %上下合并
    NewSpace = [NowSpace(1), NowSpace(2) + NextSpace(2), NowSpace(3), NowSpace(4), min(NowSpace(5),NextSpace(5)), NowSpace(6),0];
else                %前后合并
    NewSpace = [NowSpace(1), NowSpace(2), NowSpace(3) + NextSpace(3), NowSpace(4), NowSpace(5), min(NowSpace(6), NextSpace(6)),0];
end
