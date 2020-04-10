local engine = require('engine/_Link')

local exports = {}

-- example of a properly formatted component --

exports.name = 'example'

exports.comp = function(params)
    local comp = {}
    print(ent.pos.x, ent.pos.y)
    print(string.format('params: %s', params))
    return comp
end

return exports