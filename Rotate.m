%此程序是输入最开始的货物的三个数据，将数据从大到小进行排序，按照从大到小依次是长、宽、高，然后输入旋转的数字，即可返回对应的旋转之后的尺寸
%三个尺寸从左至右一次是长、宽、高。我们箱子的放置按照前后为Z轴，左右为X轴，上下为Y轴。

function RotateGoods = Rotate(Goods,Number)
A = sort(Goods);
height = A(1);
width = A(2);
length = A(3); 
switch Number
    case 1
        RotateGoods = [width, length, height];
    case 2
        RotateGoods = [length, width, height];
    case 3
        RotateGoods = [width, height, length];
    case 4
        RotateGoods = [height, width, length];
    case 5
        RotateGoods = [height, length, width];
    case 6
        RotateGoods = [length, height, width];
end
    
