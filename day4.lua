local fn = "input/4.in"
local p1, p2 = 0, 0
local f = io.open(fn):read("*a"):gsub("\r", ""):gsub("\n$", "")
local l = {}

for _ in f:gmatch("[^\n]+") do
    table.insert(l, _)
end

local r, c = #l, #l[1]

for row = 1, r do
    for col = 1, c do
        if col + 3 <= c and l[row]:sub(col, col) == 'X' and 
           l[row]:sub(col + 1, col + 1) == 'M' and 
           l[row]:sub(col + 2, col + 2) == 'A' and 
           l[row]:sub(col + 3, col + 3) == 'S' then p1 = p1 + 1 end

        if row + 3 <= r and l[row]:sub(col, col) == 'X' and 
           l[row + 1]:sub(col, col) == 'M' and 
           l[row + 2]:sub(col, col) == 'A' and 
           l[row + 3]:sub(col, col) == 'S' then p1 = p1 + 1 end

        if row + 3 <= r and col + 3 <= c and l[row]:sub(col, col) == 'X' and 
           l[row + 1]:sub(col + 1, col + 1) == 'M' and 
           l[row + 2]:sub(col + 2, col + 2) == 'A' and 
           l[row + 3]:sub(col + 3, col + 3) == 'S' then p1 = p1 + 1 end

        if col + 3 <= c and l[row]:sub(col, col) == 'S' and 
           l[row]:sub(col + 1, col + 1) == 'A' and 
           l[row]:sub(col + 2, col + 2) == 'M' and 
           l[row]:sub(col + 3, col + 3) == 'X' then p1 = p1 + 1 end

        if row + 3 <= r and l[row]:sub(col, col) == 'S' and 
           l[row + 1]:sub(col, col) == 'A' and 
           l[row + 2]:sub(col, col) == 'M' and 
           l[row + 3]:sub(col, col) == 'X' then p1 = p1 + 1 end

        if row + 3 <= r and col + 3 <= c and l[row]:sub(col, col) == 'S' and 
           l[row + 1]:sub(col + 1, col + 1) == 'A' and 
           l[row + 2]:sub(col + 2, col + 2) == 'M' and 
           l[row + 3]:sub(col + 3, col + 3) == 'X' then p1 = p1 + 1 end

        if row - 3 >= 1 and col + 3 <= c and l[row]:sub(col, col) == 'S' and 
           l[row - 1]:sub(col + 1, col + 1) == 'A' and 
           l[row - 2]:sub(col + 2, col + 2) == 'M' and 
           l[row - 3]:sub(col + 3, col + 3) == 'X' then p1 = p1 + 1 end

        if row - 3 >= 1 and col + 3 <= c and l[row]:sub(col, col) == 'X' and 
           l[row - 1]:sub(col + 1, col + 1) == 'M' and 
           l[row - 2]:sub(col + 2, col + 2) == 'A' and 
           l[row - 3]:sub(col + 3, col + 3) == 'S' then p1 = p1 + 1 end

        if row + 2 <= r and col + 2 <= c and l[row]:sub(col, col) == 'M' and 
           l[row + 1]:sub(col + 1, col + 1) == 'A' and 
           l[row + 2]:sub(col + 2, col + 2) == 'S' and 
           l[row + 2]:sub(col, col) == 'M' and 
           l[row]:sub(col + 2, col + 2) == 'S' then p2 = p2 + 1 end

        if row + 2 <= r and col + 2 <= c and l[row]:sub(col, col) == 'M' and 
           l[row + 1]:sub(col + 1, col + 1) == 'A' and 
           l[row + 2]:sub(col + 2, col + 2) == 'S' and 
           l[row + 2]:sub(col, col) == 'S' and 
           l[row]:sub(col + 2, col + 2) == 'M' then p2 = p2 + 1 end

        if row + 2 <= r and col + 2 <= c and l[row]:sub(col, col) == 'S' and 
           l[row + 1]:sub(col + 1, col + 1) == 'A' and 
           l[row + 2]:sub(col + 2, col + 2) == 'M' and 
           l[row + 2]:sub(col, col) == 'M' and 
           l[row]:sub(col + 2, col + 2) == 'S' then p2 = p2 + 1 end

        if row + 2 <= r and col + 2 <= c and l[row]:sub(col, col) == 'S' and 
           l[row + 1]:sub(col + 1, col + 1) == 'A' and 
           l[row + 2]:sub(col + 2, col + 2) == 'M' and 
           l[row + 2]:sub(col, col) == 'S' and 
           l[row]:sub(col + 2, col + 2) == 'M' then p2 = p2 + 1 end
    end
end

print(p1)
print(p2)
