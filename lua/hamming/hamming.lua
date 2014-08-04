
        --- Computes the Hamming difference between two DNA strands
--
-- @param a the original string to check
-- @param b the string to be compared
--
-- @return the Hamming differences (as an int)
local compute = function(a, b)
    local length = math.min(#a, #b)
    local diff = 0

    for i = 1,length do
        if a:sub(i, i) ~= b:sub(i, i) then diff = 1 + diff end
    end

    return diff
end

return {
    compute = compute
}
      