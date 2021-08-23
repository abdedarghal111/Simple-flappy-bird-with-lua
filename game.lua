--Este sera el archivo parde de las ejecuciones

--TODO: gui system

--arranque



--add("mod/font.lua")
local x,y = love.graphics.getDimensions()
local colors = require"mod/colors"
local play = gui:new(x/18*4,y/18*4,x/18*7,y/18*1)
local play = gui:new(x/18*4,y/18*4,x/18*7,y/18*7)
local play = gui:new(x/18*4,y/18*4,x/18*7,y/18*13)
play.backgroundcolor = {unpack(colors.white)}
play.textcolor = {unpack(colors.black)}
play.bordercolor = {unpack(colors.blue)}
play:aplycolors()
play:newzindex(10)
play.objects.texto.text = "play"

play:mouseclick(function() print("clicked") end)







local colors = require"mod/colors"
local particle_option = dofile(love.filesystem.getSource().."mod/particles.lua")
particle_option("work",true)
local r,g,b = unpack(colors.black)love.graphics.setBackgroundColor(r/255,g/255,b/255)
