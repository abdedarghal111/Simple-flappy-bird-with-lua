--encargado del render, la data la dan los modelos

local render = {capas = {[0] = {}}}
local orderedlist = {0}
local idgen = require"mod/id"

function render.insertinstance(instance,zindex,id)
  render.capas[zindex][id] = instance
  instance.zindex = zindex
  instance.zindexid = id
end

function render.addorderedlist(position)
  local p = #orderedlist + 1
  orderedlist[p] = position
  local aux,change = nil,false
  if orderedlist[p-1] < orderedlist[p] then
    return
  end
  aux = orderedlist[p-1]
  orderedlist[p-1] = orderedlist[p]
  orderedlist[p] = aux
  p = p - 1
  repeat
    if orderedlist[p - 1] and not (orderedlist[p - 1] < orderedlist[p]) then
      aux = orderedlist[p-1]
      orderedlist[p-1] = orderedlist[p]
      orderedlist[p] = aux
      p = p - 1
    else
      break
    end
  until change
end

render.add = nil;function render.add(instance,zindex)
  if zindex then
    local id = idgen.createid()
    if render.capas[zindex] then
      if not idgen.checktableid(render.capas[zindex],id) then
        render.insertinstance(instance,zindex,id)
      else
        render.add(instance,zindex)
      end
    else
      render.capas[zindex] = {}
      render.addorderedlist(zindex)
      render.add(instance,zindex)
    end
  else
    local id = idgen.createid()
    if not idgen.checktableid(render.capas[0],id) then
        render.insertinstance(instance,zindex,id)
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
  for _,capa in pairs(orderedlist) do
    for i,v in pairs(render.capas[capa]) do
      if v.render then
        v:draw()
      elseif not v then
        render.capas[capa][i] = nil
      end
    end
  end
end

return render
