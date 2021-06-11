--Este sera el archivo parde de las ejecuciones

--TODO gui system

--arranque
add("mod/font.lua")

local colors = require"mod/colors"
local particle_option = dofile(love.filesystem.getSource().."mod/particles.lua")
local r,g,b = unpack(colors.black)love.graphics.setBackgroundColor(r/255,g/255,b/255)
particle_option("work",true)
--cube:new(100,100,100,100)
while wait() do
  love.graphics.printf("ola",100,100,200,"center")
end
