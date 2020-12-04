function [OrderData, BagOnlyData] = BoxVer(OrderData)
OrderNum = length(OrderData);
BoxData = xlsread('fujian.xlsx', '耗材数据' , 'C6:E10');
k = 1;
BagOnlyData = zeros(1534 ,5);
for i = 1 : OrderNum  
     A = sort(OrderData(i,2:4));
     heightI = A(1);
     widthI = A(2);
     lengthI = A(3); 
     BoxLength = BoxData(5,1); 
     BoxWidth = BoxData(5,2);                      %下面的操作是将不能用箱子装的以及不能用袋子装的选出来，这些物品按照题目要求是不用管的  
     BoxHeight = BoxData(5,3);                     %注意是物品，而不是订单，也就意味着该订单中的其他物品是需要进行包装的。           
     if heightI > BoxHeight || widthI > BoxWidth || lengthI > BoxLength 
          BagOnlyData(k,:) = OrderData(i,:);     %将这些超出的物品放入Error列表中，将来在最后结果中进行展示
              OrderData(i,:) = zeros(1,5);        %将原有数据中的这些超出的物品的地方全部补零，在后面进行删除。
              k = k + 1;
     end
end
OrderData(all(OrderData == 0, 2),:) = [];  
