function [r, g, b] = rgb(minimum, maximum, value)
ratio = 2 * (value-minimum) / (maximum - minimum);
b = ceil(max(0, 255*(1 - ratio)));
r = ceil(max(0, 255*(ratio - 1)));
g = 255 - b - r;
end