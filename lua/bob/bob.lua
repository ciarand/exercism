local hey = function(str)
    -- it's silence if it's an empty string
    if str == "" then return "Fine, be that way." end

    -- it's a question if the last character is ?
    if str:sub(-1) == "?" then return "Sure" end

    -- it's a shout if it's all upcase
    if str:upper() == str then return "Woah, chill out!" end

    -- everything else is w/e
    return "Whatever"
end

return {
    hey = hey
}
