--Este sera el archivo parde de las ejecuciones

--TODO: gui system

--arranque
local x,y = love.graphics.getDimensions()
local colors = require"mod/colors"
local guis = {
  play = gui:new(x/18*4,y/18*4,x/18*7,y/18*1),
  options = gui:new(x/18*4,y/18*4,x/18*7,y/18*7),
  exit = gui:new(x/18*4,y/18*4,x/18*7,y/18*13)
}
--local cubo = cube:new(100,100,100,100)
--cubo:newzindex(100)
--local tween1 = tween:create(cubo,"exponential",5,"position",vector2.new(500,100))
add(function()
  tween1:play()
end)
local cuba = cube:new(100,100,100,200)
cuba:newzindex(100)
local tween2 = tween:create(cuba,"bounce",5,"position",vector2.new(500,200))
add(function()
  tween2:play()
end)

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
