%数据预处理

clc
clear all
close all

%数据导入
OrderData = xlsread('fujian.xlsx', '订单数据' , 'A3:E10002');
BoxData = xlsread('fujian.xlsx', '耗材数据' , 'C6:E10');
BagData = xlsread('fujian.xlsx', '耗材数据' , 'C2:E5');

OrderNum = length(OrderData);       %OrderData行数
BoxNum = length(BoxData);           %箱子种类数
BagNum = length(BagData);           %袋子种类数

ErrorData = zeros(521 ,5);
k = 1;
for i = 1 : OrderNum  
     A = sort(OrderData(i,2:4));
     heightI = A(1);
     widthI = A(2);
     lengthI = A(3); 
     BoxLength = BoxData(5,1); 
     BoxWidth = BoxData(5,2);                      %下面的操作是将不能用箱子装的以及不能用袋子装的选出来，这些物品按照题目要求是不用管的  
     BoxHeight = BoxData(5,3);                     %注意是物品，而不是订单，也就意味着该订单中的其他物品是需要进行包装的。
     BagLength = BagData(4,1);
     BagWidth = BagData(4,2);
     BagHeight = BagData(4,3);           
     if heightI > BoxHeight || widthI > BoxWidth || lengthI > BoxLength 
         if lengthI + heightI > BagHeight + BagLength || widthI + heightI > BagWidth + BagHeight
             ErrorData(k,:) = OrderData(i,:);     %将这些超出的物品放入Error列表中，将来在最后结果中进行展示
              OrderData(i,:) = zeros(1,5);        %将原有数据中的这些超出的物品的地方全部补零，在后面进行删除。
              k = k + 1;
         end
     end
end
OrderData(all(OrderData == 0, 2),:) = [];         %将原有数据中全为0的地方进行删除。
[BoxCanData, BagOnlyData] = BoxVer(OrderData);
m = 1;
n = 2;
OrderNumFlag = 1;
while n <= size(BoxCanData, 1)
    if BoxCanData(m, 1) == BoxCanData(n, 1)
        n = n +1;
    else
        OrderNumFlag = OrderNumFlag +1;
        m = n;
        n = n + 1;
    end
end
ResultOutput = zeros(OrderNumFlag, 81);
 y = 1;
while (size(BoxCanData, 1) )> 0
    i = 1;
   
    for k = 1 : 50
        if BoxCanData(i, 1) == BoxCanData(i + k, 1)
            continue
        else
                WaitOrder = BoxCanData(i : i + k - 1, :);
                OutPut = Gene(WaitOrder);
                ResultOutput(y, :) = OutPut;
                y = y + 1;
                BoxCanData(i : i + k - 1, :) =[];
                break
        end
    end
end
