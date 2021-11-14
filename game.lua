--Este sera el archivo parde de las ejecuciones

--arranque
local colors = require"mod/colors"
local x,y = love.graphics.getDimensions()
local particle_option = dofile(love.filesystem.getSource().."mod/particles.lua")
particle_option("work",true)
local r,g,b = unpack(colors.black)love.graphics.setBackgroundColor(r/255,g/255,b/255)
local x,y = love.graphics.getDimensions()
local config = {
  buttondissabled = false,
  gravity = false
}

local mainmusic = sound:new("musica.wav")
mainmusic.source:setVolume(0.1)
mainmusic:play()
add(function()
  while wait(mainmusic.source:getDuration() + 0.01) do
    mainmusic:play()
  end
end)

local bestscore = text:new()
local score = text:new()

local guis = {
  play = gui:new(x/18*4,y/18*4,x/18*7,y/18*1),
  options = gui:new(x/18*4,y/18*4,x/18*7,y/18*7),
  exit = gui:new(x/18*4,y/18*4,x/18*7,y/18*13)
}
local time = 0
for i,v in pairs({"play","options","exit"}) do
  i = v
  v = guis[i]
  v.originalposition = v.position
  time = time + 0.5
  v.render = false
  v:aplyrender()
  v.backgroundcolor = {unpack(colors.white)}
  v.textcolor = {unpack(colors.black)}
  v.bordercolor = {unpack(colors.blue)}
  v:aplycolors()
  v:newzindex(10)
  v.objects.texto.text = i
  v.objects.texto:setfont("1",20)
  v:mousehoveron(function()
    if not config.buttondissabled then
      v.backgroundcolor = {unpack(colors.blue)} v:aplycolors()
    end
  end)
  v:mousehoveroff(function()
    if not config.buttondissabled then
      v.backgroundcolor = {unpack(colors.white)} v:aplycolors()
    end
  end)
  v.tweenupp = tween:create(v,"softland",2,"position",v.position,true,"aplyposition")
  v.position = v.position + vector2.new(0,love.graphics.getHeight())
  local time = time
  add(function() wait(time) v.tweenupp:play() v.render = true v:aplyrender() end)
end

local pajaro = require"gmod/bird"

local game_start = require("gmod/game")

guis.play:mouseclick(function()
  if not debounce then
    debounce = true
    game_start(guis,config)
    debounce = false
  end
end)

guis.options:mouseclick(function()
  if not debounce then
    debounce = true
    guis.options.objects.texto.text = "No options."
    wait(1)
    guis.options.objects.texto.text = "options"
    debounce = false
  end
end)

--salir del programa
guis.exit:mouseclick(function()
  love.event.quit()
end)
