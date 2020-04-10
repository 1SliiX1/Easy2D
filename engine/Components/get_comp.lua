local engine = require('engine/_Link')

local exports = {}

local dir = 'engine/Components'

function read(f, CD, Lpath)
    for each in f:lines() do
        local name = string.gsub(each, '.lua', '')
        if name ~= '' then
            if Lpath ~= nil then
                exports[Lpath] = {}
                exports[Lpath][name] = require(dir .. CD .. name)
            else
                exports[name] = require(dir .. CD .. name)
            end
            print('custom property established at :: ' .. dir .. CD .. name .. '\n')
        end
    end
end

local f = io.open(dir .. '/_comp.dat', 'r+')
read(f, '/_comp/', 'comp')
local f = io.open(dir .. '/_scene.dat', 'r+')
read(f, '/_scene/', 'scene')

return exports
