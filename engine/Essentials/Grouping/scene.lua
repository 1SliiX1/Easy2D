local engine = require('engine/_Link')

local exports = {}

function make_scene(name)
    local scene = {name=name, entities={}, global_comps={}}

    function scene:add(entity)
        self.entities[entity.properties.id] = entity
        print('entity ' .. entity.properties.id .. ' added to scene ' .. self.name .. '\n')
    end

    function scene:clear(entity)
        if ent == nil then
            for k,v in pairs(self.entities) do
                v:kill()
            end
        else
            self.entities[entity.properties.id] = nil
            for k,v in pairs(self.global_comps) do
                v.components[k] = nil
            end
        end
    end

    function scene:add_component(name, comp, params)
        for k,v in pairs(self.entities) do
            v:add_component(name, comp)
            self.global_comps[name] = {comp=comp, params=params}
        end
    end

    function scene:remove_component(name, exempt)
        for k,v in pairs(self.entities) do
            v.components[name] = nil
            self.global_comps[name] = nil
        end
    end

    function scene:execute(name, exempt)
        for k,v in pairs(self.entities) do
            if v ~= exempt then
                for k,v in pairs(self.global_comps) do
                    v:update_component(v.name, v.params)
                end
            end
        end
    end

    print('scene ' .. scene.name .. ' created' .. '\n')
    return scene
end

exports.new_scene = make_scene

return exports