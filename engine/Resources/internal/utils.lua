local exports = {}

local current_path = function()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("(.*/)")
end

local new_id = function(l)
    local l = l or 3
    local id = ""
    local pt = ""

    for i = 1, l do
        for i = 1,6 do
            pt = pt .. math.random(0,9)
            if i == 5 then
                id = id .. pt
                pt = "-"
            end
        end
    end

    return id
end

exports.get_path = current_path
exports.new_id = new_id

return exports