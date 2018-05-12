function new_a = operation(a)
% a = [4 4 2 4];
a = a(a>0);
new_a = [];
k = 1;
while k <= length(a)
    if k == length(a)
        new_a = [new_a a(k)];
        break
    end
    if a(k) == a(k+1)
        new_a = [new_a a(k)+a(k+1)];
        k = k + 2;
    else
        new_a = [new_a a(k)];
        k = k + 1;
    end
end
end