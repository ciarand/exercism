local normalize = function(raw)
    local str = string.lower(raw)
    local norm = {}
    local byte

    for i=1,#str do
        byte = str:byte(i)
        if not norm[byte] then
            norm[byte] = 1
        else
            norm[byte] = 1 + norm[byte]
        end
    end

    return norm
end

local tables_eq = function(a, b)
    for k in pairs(a) do
        if a[k] ~= b[k] then return false end
    end

    for k in pairs(b) do
        if a[k] ~= b[k] then return false end
    end

    return true
end

local match = function(self, opts)
    local ret = {}

    for _, s in pairs(opts) do
        if tables_eq(normalize(s), self.norm) then
            table.insert(ret, s)
        end
    end

    return ret
end

local new = function(self, str)
    return {
        str = str,
        norm = normalize(str),
        match = match,
    }
end

return {
    new = new,
}
