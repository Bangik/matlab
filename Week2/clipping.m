function J = clipping(i)
    for x = 1 : size(i,1)
        for y = 1 : size(i,2)
            if i(x,y) > 255
                J(x,y) = 255;
            elseif i(x,y) < 0
                J(x,y) = 0;
            else
                J(x,y) = i(x,y);
            end
        end
    end
end