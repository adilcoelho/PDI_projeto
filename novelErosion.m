function y = novelErosion(x)

if sum(x(:)) > size(x,1)
    y = 1;
else 
    y = 0;
end