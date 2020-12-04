%一个空间，放置一个货物之后将会重新形成三个空间，下面的if语句是对右空间以及前空间的一个划分，我们遵从习惯，比较倾向于形成大的空间。

function NewSpace = Insert(Goods, space)
X = space(1);
Y = space(2);
Z = space(3);
x = Goods(1);
y = Goods(2);
z = Goods(3);
Space1 = [x, Y - y, z, 0, y, 0, x * (Y - y) * z];          %上空间
if z * (X - x) > x * (Z - z)
    Space2 = [X - x, Y, Z, x, 0, 0, (X - x) * Y * Z];      %右空间
    Space3 = [x, Y, Z - z, 0, 0, z, x * Y * (Z - z)];      %前空间
else
    Space2 = [X - x, Y, z, x, 0, 0, (X - x) * Y * z];
    Space3 = [X, Y, Z - z, 0, 0, z,X * Y * (Z - z)];
end
NewSpace = [Space1; Space2; Space3];
end
    
