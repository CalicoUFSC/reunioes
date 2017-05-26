local function split(string, pat)
    pat = pat or '%s+'
    local st, g = 1, string:gmatch("()("..pat..")")
    local function getter(segs, seps, sep, cap1, ...)
        st = sep and seps + #sep
        return string:sub(segs, (seps or 0) - 1), cap1 or sep, ...
    end
    return function() if st then return getter(st, g()) end end
end

local function lower_compare(s1, s2)
    return s1:lower() < s2:lower()
end

return function(names)
    new_names = {}

    for w in split(names, ", ") do
        new_names[#new_names+1] = w
    end

    table.sort(new_names, lower_compare)

    tex.print(table.concat(new_names, ", "))
end
