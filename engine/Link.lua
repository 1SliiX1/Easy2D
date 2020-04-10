local exports = {data={}}


local send = function(path, name, aspect) -- send a file path (good for one time imports)
    assert(type(name) == 'string', "nameType not string")
    if aspect == nil then exports.data[name] = require(path) or exports.data[name]
    else exports.data[name] = require(path)[aspect] or exports.data[name] end
    print(path .. ' ' .. name .. ' has been imported' .. '\n') 
end

local bind = function(name, aspect) -- bind variable aspects
    exports.data[name] = aspect
end

local get = function(name) -- get specific aspects
    if name == nil then return exports.data
    else return exports.data end
end


---- engine lib ----

  -- entity sys --
local EBS = 'engine/Essentials/Entity_System'
send(EBS .. '/entities', 'EBS')

  -- grouping --
local grouping = 'engine/Essentials/Grouping'
send(grouping .. '/scene', 'scene')

  -- components --
local components = 'engine/Components'
send(components .. '/get_comp', 'custom')


  -- engine resources--
local resources = 'engine/resources'
send(resources .. '/internal/utils', 'utils')



exports.send = send
exports.get = get
exports.connect = connect
return exports