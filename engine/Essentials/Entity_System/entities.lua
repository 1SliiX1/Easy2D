local engine = require('engine/_Link')

local exports = {}

local make_entity = function(x,y)
    local entity = {pos={x=x,y=y}}
    entity.components = {}
    entity.properties = {
        add=function(name, value) entity[name] = value 
        end,
        remove=function(name) entity[name] = nil end,
        id=engine.utils.new_id()}
    

    function entity:add_component(name, component)
        if name == nil then table.insert(self.components, component)
        else entity.components[name] = component end
    end

    function entity:update_component(name, params)
        local params = params or {}
        ent = self

        if name == nil then
        for k,v in pairs(self.components) do v() end
        else
            if type(params) == 'table' then 
                self.components[name](unpack(params)) 
            else
                self.components[name](params)
            end
        end
    end

    function entity:kill()
        entity = nil
    end

    print('entity ' .. entity.properties.id .. ' created at pos ' .. entity.pos.x .. ', ' .. entity.pos.y .. '\n')

    return entity
end

exports.make_entity = make_entity

return exports