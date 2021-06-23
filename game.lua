--Este sera el archivo parde de las ejecuciones

--TODO: gui system

--arranque



--add("mod/font.lua")
cube:new(100,100,100,100,255,255,255)
local text = require"mod/ins/text"
local text = text:new()
text:setfont("1",20)
text.text = "nose"
text.position = vector2.new(100,100)
text:setcolor(0,0,0)
text.size = vector2.new(100,100)

--gui:new(300,300,200,200)










local colors = require"mod/colors"
local particle_option = dofile(love.filesystem.getSource().."mod/particles.lua")
particle_option("work",true)
local r,g,b = unpack(colors.black)love.graphics.setBackgroundColor(r/255,g/255,b/255)
