--este es el archivo ocupado de la base del proyecto, aqui empieza

local coroutina = require"smod/coroutine"
local core = {}
local corf = {}

function _G.add(f,...)
  table.insert(core,coroutina:new(f,...))
end

function _G.wait(n)
  if n then local time = n + love.timer.getTime()
    repeat coroutine.yield() until time < love.timer.getTime()
  else coroutine.yield()
  end
end

function _G.update()
  for i,v in pairs(core) do
    if v:update() then core[i] = nil end
  end
end

return corf
