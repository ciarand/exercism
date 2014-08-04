------------------------------------------------------------------------
-- The anagram module
--
-- @module anagram
local anagram = {}

------------------------------------------------------------------------
-- Normalize a string into a table of byte values
--
-- @param raw the string to normalize
--
-- @return the normalized dictionary (table)
local normalize_string = function(raw)
    local str = string.lower(raw)
    local norm = {}
    local byte

    for i=1,#str do
        byte = str:byte(i)
        norm[byte] = (norm[byte] and 1 + norm[byte]) or 1
    end

    return norm
end

------------------------------------------------------------------------
-- Performs a shallow comparison of two tables
--
-- @param a one of the tables to compare
-- @param b one of the tables to compare
--
-- @return boolean indicating whether they're the same
local tables_eq = function(a, b)
    if #a ~= #b then return false end

    for k in pairs(a) do
        if a[k] ~= b[k] then return false end
    end

    for k in pairs(b) do
        if a[k] ~= b[k] then return false end
    end

    return true
end

------------------------------------------------------------------------
-- Compares the provided word list with the associated anagram string
--
-- @param self the anagram object
-- @param opts the word list to check against
--
-- @return the wordlist filtered by valid anagrams
anagram.match = function(self, opts)
    local ret = {}

    for _, s in pairs(opts) do
        if tables_eq(normalize_string(s), self.norm) then
            table.insert(ret, s)
        end
    end

    return ret
end

------------------------------------------------------------------------
-- Generates a new anagram object
--
-- @param self the module
-- @param str  the string to generate based an anagram object for
--
-- @return an anagram object
anagram.new = function(self, str)
    return {
        str = str,
        norm = normalize_string(str),
        match = self.match,
    }
end

return anagram
