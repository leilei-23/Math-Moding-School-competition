function [newpop] = mutation(pop,pm)  %pm是指变异概率。
[px, py] = size(pop);
newpop = ones(size(pop));
%对后八位进行变异
for i = 1 : px                            
    if (rand < pm)
        mpoint = round(rand * (py / 2) + py / 2);
        if mpoint <= py / 2
            mpoint = py / 2 + 1;
        end
        newpop(i, (py / 2 +1) : py) = pop(i, (py / 2 +1) : py);
        newpop(i,mpoint) = randperm(6,1);
    else
        newpop(i, (py / 2 +1) : py) = pop(i, (py / 2 +1) : py);
    end
end
%对前八位进行变异。
for i = 1 : px                            
    if (rand < pm)
        mpoint = round(rand * (py / 2));
        if mpoint <= 0
            mpoint = 1;
        end
        newpop(i, 1 : py / 2) = pop(i, 1 : py /2);
        newpop(i,mpoint) = randperm(8,1) + 0.1;
        newpop(i, 1 : py / 2) = ReOrder(newpop(i, 1 : py / 2));
    else
        newpop(i, 1 : py / 2) = pop(i, 1 : py / 2);
    end
end
