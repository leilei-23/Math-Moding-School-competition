function NewSpaceList = UpdateSpace(spacelist)
if size(spacelist,1) < 2
    NewSpaceList = spacelist;
else
    nowIndex = 1;
    while (nowIndex < size(spacelist,1))
        nextIndex = nowIndex;
        NowSpace = spacelist(nowIndex, :);
        nextIndex = nextIndex + 1;
        while (nextIndex <= size(spacelist,1))
            NextSpace = spacelist(nextIndex,:);
            if CanCombine(NowSpace, NextSpace) ~= 0   %不为0意味着可以进行合并
                Can = CanCombine(NowSpace, NextSpace);
                NewSpace = Combine(NowSpace, NextSpace, Can);
                spacelist(nowIndex, :) = NewSpace;    %将合并好的空间放在NowSpace，因为可能之后还会有空间可以进行合并，这样就实现了空间的累计合并。
                spacelist(nextIndex, :) = [];         %将合并之后的原来的进行删除，上一行是用覆盖进行了删除。这样的话nextIndex就不要进行更新了
            else                                      %因为删除之后后面会前移一位，这样就实现了循环。（顺表吐槽以下matlab，这种操作简直太恶心了。）
                nextIndex = nextIndex + 1;            %如果不能合并的话，就要进行手动后移了。
            end
        end
        nowIndex = nowIndex + 1;                      %因为删除操作全部都在nowIndex之后，所以不会影响到nowIndex进行更新，同时也要保证上面的nextIndex
    end                                               %是从nowIndex开始的，这样才可以保证。
    NewSpaceList = spacelist;
end
