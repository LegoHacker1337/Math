--Just found a heart in mandelbrot set :P
local function Formula(x,y)
    local a,b,i = 0,0,0
    while i < 5 do
        if (a^2 + b^2) >= 4 then return (i == 3 and "#") or " " end
        a = (a^2 - b^2) + x
        b = (a^2 * a * b) + y
        i += 1
    end
    return " "
end

for i1 = .6, 1.0, .014 do
    local str = ""
    for i2 = -0.4, .4, .008 do
        str = str..Formula(i1,i2)
    end
    rconsoleprint(str.."\n")
end
