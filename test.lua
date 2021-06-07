local bird = require("gmod/bird")
local bo = bird.object
local colors = require"mod/colors"
local x,y = love.graphics.getDimensions()
local playing = true

--start things
local particles_settings = add("mod/particles.lua")

--starting settings
local r,g,b = unpack(colors.black)love.graphics.setBackgroundColor(r/255,g/255,b/255)

add(function()
    while true do
    if playing then
      bird.velocity.y = bird.velocity.y - 300
    end
    wait(0.5)
  end
end)
while true do
  wait()
  if playing then
    bo.position = bo.position + bird.velocity * dt
    bird.velocity.y = bird.velocity.y + bird.mass * bird.gravity * dt
  end
end
