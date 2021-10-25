--este es el archivo ocupado de la base del proyecto, aqui empieza

local coroutina = require"smod/coroutine"
local render = require"smod/render"
local core = {}
local corf = {}
_G.dt = love.timer.getDelta()

function _G.add(f,...)
  table.insert(core,coroutina:new(f,...))
end

function _G.wait(n)
  local n = n
  if n then local time = n + love.timer.getTime()
    repeat coroutine.yield() until time < love.timer.getTime()
    return true
  else coroutine.yield() return true
  end
end

function _G.update()
  dt = love.timer.getDelta()
  for i,v in pairs(core) do
    if v:update() then core[i] = nil end
  end
  render:update()
end

coroutina:new("smod/Vector2.lua"):update()
_G.cube = require"mod/ins/cube"
_G.sound = require"mod/ins/sound"
_G.gui = require"mod/ins/gui"
_G.text = require"mod/ins/text"
_G.tween = require"smod/tween"
_G.destroy = require"mod/ins/destroy"
