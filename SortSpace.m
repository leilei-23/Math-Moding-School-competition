function newspace = SortSpace(space)
 for l= 1: size(space, 1)
        space(l,7) = space(l,1) * space(l,2) * space(l,3);
 end
 newspace = sortrows(space,7);  %对新空间按体积进行升序排
