local exports = {}

local extern = 'engine/resources/external'
local intern = 'engine/resources/internal'

exports.utils = require(intern .. '/utils')
exports.Mlib = require(extern .. '/Mlib')

return exports