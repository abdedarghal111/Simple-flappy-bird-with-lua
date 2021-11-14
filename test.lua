--[[
local bird = require("gmod/bird")
local bo = bird.object
local colors = require"mod/colors"
local x,y = love.graphics.getDimensions()
local playing = true
local game = true

--TODO game system

--play
function love.mousepressed(x, y, button, isTouch)
  if playing and game and button == 1 then
    bird.velocity.y = bird.velocity.y >= 0 and - 300 or bird.velocity.y - 300
    if bird.velocity.y < - 500 then
      bird.velocity.y = -500
    end
  end
end

--phisics
function() while wait() and game do
  if playing then
    bo.position = bo.position + bird.velocity * dt
    bird.velocity.y = bird.velocity.y + bird.mass * bird.gravity * dt
  end
end end)

return score
]]
