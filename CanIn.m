function flag = CanIn(Goods,Space)
L = Goods(1);
W = Goods(2);
H = Goods(3);
l = Space(1);
w = Space(2);
h = Space(3);
if L <= l && W <= w && H <= h
    flag = 1;
else
    flag = 0;
end
