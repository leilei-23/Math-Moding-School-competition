function  OutPut = Gene(WaitOrder)

%对于第一个订单进行操作
%
% clc
% clear all
% close all


OrderData = WaitOrder;
NIND = 20;   %个体数目
MAXGEN = 10; %最大遗传代数
Number = 0;
for j = 1 : size(WaitOrder, 1)
    Number = Number + WaitOrder(j, 5);
end
w1 = 1e9;   %盒子数量的权重
w2 = 1;       %盒子体积的权重
pc = 0.6;      %交叉概率
pm = 0.001; %变异概率
Individual = zeros(MAXGEN, 2 * Number);
Fitvalue = zeros(MAXGEN, 1);
BoxRecord = zeros(MAXGEN, 30);

%初始化种群
Chrom = zeros(NIND,2 * Number);
for i = 1: NIND  
    orderarray = randperm(Number);
    rotatearray = randi(6,1,Number);
    Chrom(i,:) = [orderarray rotatearray];
end

for i = 1 : MAXGEN
    [fitvalue, boxrecord, ErrrorRecord] = FitValue(Chrom, OrderData, w1, w2);

    NewChrom = selection(Chrom, fitvalue);
    NewChrom = crossover(NewChrom, pc);
    NewChrom = mutation(NewChrom, pm);

    [fitvalue, boxrecord, ErrrorRecord] = FitValue(NewChrom, OrderData, w1, w2);
    [BestIndividual , BestFitValue, BestBoxRecord] = Best(NewChrom, fitvalue, boxrecord);
    Individual(i, :) = BestIndividual;
    Fitvalue(i) = BestFitValue;
    BoxRecord(i, :) = BestBoxRecord;
    Chrom = NewChrom;
end

FV = Fitvalue(MAXGEN, :);
BR = BoxRecord(MAXGEN, :);
ID = zeros(1, 50);
for y = 1 : 2 * Number
    ID(1, y) = Individual(MAXGEN, y);
end
OutPut = [FV ID BR];

N = [1:1:MAXGEN]';
plot(N,Fitvalue(1 : MAXGEN, :),'r')
