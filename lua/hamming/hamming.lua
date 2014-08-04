--- Gets the character at the provided pos from str
--
-- @param str the string to retrieve the character from
-- @param pos the position to retrieve the character from
-- @return a one-char string
local char_at = function(str, pos)
    return str:sub(pos, pos)
end

--- Determines whether the character at the provided position is equal in both
-- provided strings
--
-- @param pos the string index to check
-- @param a   the first string to check against
-- @param b   the second string to check against
-- @return boolean indicating whether the two are different
local is_different = function(pos, a, b)
    return char_at(a, pos) ~= char_at(b, pos)
end

--- Computes the Hamming difference between two DNA strands
--
-- @param a the first string to check
-- @param b the second string to check
-- @return the Hamming differences (as an int)
local compute = function(a, b)
    -- shortcut if the two are equal already
    if a == b then return 0 end

    -- we're supposed to ignore any extra characters, so set the length = to
    -- the length of the smallest provided string
    local length
    if #a < #b then length = #a else length = #b end

    local diff = 0
    -- iterate through each character
    for i = 1,length do
        -- if they're different then increment the diff total
        if is_different(i, a, b) then diff = 1 + diff end
    end

    -- return the number of differences
    return diff
end

return {
    compute = compute
}