function [BoxNumber,SumBoxVolume, BoxRecord, ErrorChrom] = Load(chrom, OrderData)

% orderarray = randperm(8);
% rotatearray = randi(6,1,8);
% chrom = [orderarray rotatearray];    %形成一条染色体，用于在函数编写中方便进行验证已经修改，之后会改成多条染色体。

chromsize = size(chrom,2);
 
% OrderData = xlsread('fujian.xlsx', '订单数据' , 'A3:E4');  %导入第一个订单的数据，也是为了程序编写的方便。
GoodsNumber = 0;
for n = 1 : size(OrderData,1)
    GoodsNumber = GoodsNumber + OrderData(n,5);            %最后求出来的GoodsNumber是物品的总数量。
end
GoodsList = [];
for m = 1 : size(OrderData,1)
     TempGoodsList = [GoodsList; repmat(OrderData(m,2:4),OrderData(m,5),1)]; %生成物品的尺寸清单，一件物品是一行。
     GoodsList = TempGoodsList;
end
BoxList = xlsread('fujian.xlsx', '耗材数据' , 'C6:E10');   %箱子列表。
origin = zeros(1,4);                                       %基点坐标 + 体积
ErrorChrom = [];                                                      %初始化错误列表


flagSpacelistChange = 0;
for i = 1 : chromsize / 2    
    Goods = Rotate(GoodsList(chrom(i),:),chrom(i + chromsize / 2));    %获取旋转之后的长、宽、高。
    for  j = 1 : 5  
            box = BoxList(j,:);
            if flagSpacelistChange ==0
                BoxRecord = [];
                spacelist = [box origin];
                 BoxRecord = RecordBox(box,BoxRecord);
            else
                spacelist = spacelist;
            end
            flagCanIn = 0;
            for k = 1 : size(spacelist, 1)
                if CanIn(Goods, spacelist(k,:)) == 1
                    flagCanIn = 1;
                end
            end
            if flagCanIn == 0
                if CanIn(Goods, box) == 1
                     BoxRecord = RecordBox(box,BoxRecord);
                     NewSpace = Insert(Goods, box);
                     spacelist = AddSpace(NewSpace,spacelist);
                     spacelist = UpdateSpace(spacelist);
                     spacelist = SortSpace(spacelist);
                else
                    if j == 5
                        ErrorTemp = [ErrorChrom Goods]; 
                        ErrorChrom = ErrorTemp;
                        break
                    else
                        continue
                    end
                end
            else
                flagSpacelistChange = 1;
                [MinSpace, Index] = FindMinSpace(Goods, spacelist);
                NewSpace = Insert(Goods, MinSpace);
                spacelist = DeleteSpace(Index, spacelist);
                spacelist = AddSpace(NewSpace,spacelist);
                spacelist = UpdateSpace(spacelist);
                spacelist = SortSpace(spacelist);
                break
            end
    end
end
BoxNumber = size(BoxRecord, 2) / 3;
SumBoxVolume = 0;
for b = 0 : (BoxNumber -1)
    b1 = 3 * b + 1;
    b2 = 3 * b + 2;
    b3 = 3 * b + 3;
    BoxVolume = BoxRecord(1, b1) * BoxRecord(1, b2) * BoxRecord(1, b3);
    SumBoxVolume = SumBoxVolume + BoxVolume;
end
