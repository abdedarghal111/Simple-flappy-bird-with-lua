--objeto del pajaro

local colors = require"mod/colors"
local x,y = love.graphics:getDimensions()
local bird = {
  velocity = vector2.new(0,0),
  gravity = 20,
  mass = 50
}
bird.object = cube:new(x/10, x/10, x/10 * 2, y/2-(x/10/2), unpack(colors.blue))
bird.object:newzindex(-2)

return bird
