local x,y = love.graphics.getDimensions()
local obstaculo = require"gmod/obstaculo"
local bird = require "gmod/bird"
local transicion_cube = cube:new(x,y,-x,0)
transicion_cube:newzindex(1000)

return function(guis,config)
  config.buttondissabled = true
  config.gravity = true
  for i,v in pairs(guis) do
    v.tweenupp = tween:create(v,"softland",2,"position",v.position + vector2.new(0,y) ,true,"aplyposition")
    v.tweenupp:play()
  end

  config.gravity = false
  local point = 0
  local delay = 3
  local gravity = 500
  local game_ended = false
  local bird_starter_position = bird.position
  local obstaculos = {}
  math.randomseed(os.time())

  add(function()
    bird.velocity = 0
    local clicking = false
    while not game_ended and wait() do
      bird.position.y = bird.position.y + bird.velocity * dt
      bird.velocity = bird.velocity + gravity * dt
      if clicking then
        if not love.mouse.isDown(1) then
          clicking = false
        end
      elseif not clicking then
        if love.mouse.isDown(1) then
          clicking = true
          bird.velocity = -250
          bird.fly_sound:play()
        end
      end
    end
  end)

  obstaculos[#obstaculos + 1] = obstaculo:new()
  add(function()
    while not game_ended and wait(delay) do
      obstaculos[#obstaculos + 1] = obstaculo:new()
    end
  end)

  while not game_ended and wait() do
    for i,v in pairs(obstaculos) do
      if v:coliding()
      or bird.position.y + bird.size.y < 0
      or bird.position.y > y then
        game_ended = true
        break
      end
      v:check_point(point)
      v:move()
      if v.x < 0 then
        destroy(obstaculos[i].p1)
        destroy(obstaculos[i].p2)
        for u,e in pairs(obstaculos[i]) do
          obstaculos[i][u] = nil
        end
        obstaculos[i] = nil
      end
    end
  end

  bird.hit_sound:play()

  transicion_cube.position = vector2.new(-x,0)
  local tweentransicion = tween:create(transicion_cube,"softland",1,"position",vector2.new(0,0))
  tweentransicion:play()
  wait(1)

  for i,v in pairs(obstaculos) do
    destroy(obstaculos[i].p1)
    destroy(obstaculos[i].p2)
    for u,e in pairs(obstaculos[i]) do
      obstaculos[i][u] = nil
    end
    obstaculos[i] = nil
  end

  for i,v in pairs(guis) do
    v.position = v.originalposition
    v:aplyposition()
  end
  bird.position = bird.originalposition
  config.buttondissabled = false
  tweentransicion = tween:create(transicion_cube,"softland",1,"position",vector2.new(x,0))
  tweentransicion:play()
end
