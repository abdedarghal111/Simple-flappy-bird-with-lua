--Este sera el archivo parde de las ejecuciones

--TODO: gui system

--arranque



--add("mod/font.lua")
gui:new(100,100,200,200)









local colors = require"mod/colors"
local particle_option = dofile(love.filesystem.getSource().."mod/particles.lua")
particle_option("work",true)
local r,g,b = unpack(colors.black)love.graphics.setBackgroundColor(r/255,g/255,b/255)
