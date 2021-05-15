--[[
Este modulo se encargara de devolver un id completamente random
--]]

--la tabla del id
local id = {}

--la funcion que crea el id
function id.createid()
  local id = ""
  for e = 0,20 do
    local random_val = math.random(48,90)
    id = id..string.char(random_val)
  end
  return id
end

--funcion para chequear el id
function id.checktableid(table,id)
  for i,v in pairs(table) do
    if i == id then
      if v == nil then
        return false
      else
        return true
      end
    end
  end
  return false
end

--se devuelve la funcion para que se pueda requerir en otros scripts
return id
