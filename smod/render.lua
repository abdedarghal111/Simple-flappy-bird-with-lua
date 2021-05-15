--encargado del render, la data la dan los modelos


--TODO: solucionar fallo o remodelar codigo
local render = {capas = {[0] = {}}}
local idgen = require"mod/id"

function render.add(instance,zindex)
  if zindex then
    local id = idgen.createid()
    if render.capas[zindex] then
      if not id.checktableid(render.capas[zindex],id) then
        render.capas[zindex][id] = instance
      else
        render.add(instance,zindex)
      end
    else
      render.capas[zindex] = {}
      render.add(instance,zindex)
    end
  else
    local id = idgen.createid()
    if not id.checktableid(render.capas[0],id) then
        render.capas[0][id] = instance
    else
      function render.add(instance,zindex)
    end
  end
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
