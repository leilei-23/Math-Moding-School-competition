function [BestIndividual , BestFitValue, BestBoxRecord] = Best(pop, fitvalue, boxrecord)
[px,py] = size(pop);
BestIndividual = pop(1, :);
BestFitValue = fitvalue(1);
BestBoxRecord = boxrecord(1, :);
for i = 2 : px
    if fitvalue(i) > BestFitValue
        BestIndividual = pop(i, :);
        BestFitValue = fitvalue(i);
        BestBoxRecord = boxrecord(i, :);
    end
end
