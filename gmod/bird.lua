--objeto del pajaro

local colors = require"mod/colors"
local x,y = love.graphics:getDimensions()
local bird = cube:new(x/7.5, x/10, x/10 * 1, y/2-(x/10/2), unpack(colors.blue))
bird:newzindex(100)
bird.velocity = 0
bird.originalposition = bird.position + vector2.new()
bird.fly_sound = sound:new("aletear.wav")
bird.hit_sound = sound:new("hit.wav")
--ojos xd
bird.ojo = cube:new(
  bird.size.x/6,bird.size.y/5,
  bird.position.x + bird.size.x/10*7,bird.position.y + bird.size.y/10*2
)
bird.ojo:newzindex(101)
bird.pupila = cube:new(
  bird.ojo.size.x/2,bird.ojo.size.y/2,
  bird.ojo.position.x + bird.ojo.size.x/2,bird.ojo.position.y + bird.ojo.size.y/3,
  1,1,1
)
bird.pupila:newzindex(102)

--pico
bird.pico_superior = cube:new(
  bird.size.x/5,bird.size.y/10,
  bird.position.x + bird.size.x*0.95,bird.position.y + bird.size.y/2,
  255,195,0
)
bird.pico_superior:newzindex(101)
bird.pico_inferior = cube:new(
  bird.size.x/5,bird.size.y/10,
  bird.position.x + bird.size.x*0.95,bird.pico_superior.position.y + bird.pico_superior.size.y,
  255,195,0
)
bird.pico_inferior:newzindex(101)

--ala grande
bird.ala = cube:new(
  bird.size.x/2,bird.size.y/3,
  bird.position.x + bird.size.x/8,bird.position.y + bird.size.y/3,
  0,245,255
)
bird.ala:newzindex(101)

--cola
bird.cola1 = cube:new(
  bird.size.x/4,bird.size.y/5,
  bird.position.x - bird.size.x/4,bird.position.y + bird.size.y/5 + bird.size.x/6,
  0,245,255
)
bird.cola1:newzindex(101)

bird.cola2 = cube:new(
  bird.size.x/4,bird.size.y/6,
  bird.position.x - bird.size.x/5,bird.position.y + bird.size.y/5 + bird.size.x/11,
  0,100,200
)
bird.cola2.rotation = 45
bird.cola2:newzindex(102)

bird.cola3 = cube:new(
  bird.size.x/5,bird.size.y/6,
  bird.position.x - bird.size.x/6,bird.position.y + bird.size.y/4 + bird.size.x/4,
  0,200,200
)
bird.cola3.rotation = -45
bird.cola3:newzindex(103)

local positions = {}

for i,v in pairs({"ojo","pupila","pico_superior","pico_inferior","ala","cola1","cola2","cola3"}) do
  positions[v] = bird[v].position - bird.position
end

add(function()
  while wait() do
    for i,v in pairs({"ojo","pupila","pico_superior","pico_inferior","ala","cola1","cola2","cola3"}) do
      bird[v].position = bird.position + positions[v]
    end
  end
end)

return bird
