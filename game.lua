--Este sera el archivo parde de las ejecuciones

--TODO: gui system

--arranque



--add("mod/font.lua")
local x,y = love.graphics.getDimensions()
local colors = require"mod/colors"
local guis = {
  play = gui:new(x/18*4,y/18*4,x/18*7,y/18*1),
  options = gui:new(x/18*4,y/18*4,x/18*7,y/18*7),
  exit = gui:new(x/18*4,y/18*4,x/18*7,y/18*13)
}

for i,v in pairs(guis) do
  v.backgroundcolor = {unpack(colors.white)}
  v.textcolor = {unpack(colors.black)}
  v.bordercolor = {unpack(colors.blue)}
  v:aplycolors()
  v:newzindex(10)
  v.objects.texto.text = i
  v.objects.texto:setfont("1",20)
  v:mousehoveron(function() v.backgroundcolor = {unpack(colors.blue)} v:aplycolors() end)
  v:mousehoveroff(function() v.backgroundcolor = {unpack(colors.white)} v:aplycolors() end)
end








local colors = require"mod/colors"
local particle_option = dofile(love.filesystem.getSource().."mod/particles.lua")
particle_option("work",true)
local r,g,b = unpack(colors.black)love.graphics.setBackgroundColor(r/255,g/255,b/255)
