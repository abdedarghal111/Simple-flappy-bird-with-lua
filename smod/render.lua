--encargado del render, la data la dan los modelos

local render = {capas = {[0] = {}}}
local idgen = require"mod/id"

function render.add(instance,zindex)
  if zindex then
    local id = idgen.createid()
    if render.capas[zindex] then
      if not idgen.checktableid(render.capas[zindex],id) then
        render.capas[zindex][id] = instance
        instance.zindex = zindex
        instance.zindexid = id
      else
        render.add(instance,zindex)
      end
    else
      render.capas[zindex] = {}
      render.add(instance,zindex)
    end
  else
    local id = idgen.createid()
    if not idgen.checktableid(render.capas[0],id) then
        render.capas[0][id] = instance
        instance.zindex = 0
        instance.zindexid = id
    else
      render.add(instance,zindex)
    end
  end
end

function render.quitzindex(instance)
  render.capas[instance.zindex][instance.zindexid] = nil
end

function render.changezindex(instance,newzindex)
  render.quitzindex(instance)
  render.add(instance,newzindex)
end

function render:update()
  for cap,tab in pairs(render.capas) do
    for i,v in pairs(tab) do
      if v.render then
        v:draw()
      elseif not v then
        prender.capas[cap][i] = nil
      end
    end
  end
end

return render
