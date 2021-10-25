local pajaro = require"gmod/bird"

local obstaculo = {}
local diferencia = pajaro.size.y * 3
local velocity = 200
local x,y = love.graphics.getDimensions()

function obstaculo:new()
  t = {}
  for i,v in pairs(obstaculo) do
    t[i] = v
  end
  local rand = math.random(5,65)/100
  local alt = y
  local anch = x/10*2
  t.p1 = cube:new(anch,alt,x,y*rand-alt)
  t.p2 = cube:new(anch,alt,x,y*rand+diferencia)
  t.x = t.p1.position.x + t.p1.size.x
  t.point = false
  return t
end

function obstaculo:move()
  self.p1.position.x = self.p1.position.x - velocity * dt
  self.p2.position.x = self.p2.position.x - velocity * dt
  self.x = self.p1.position.x + self.p1.size.x
end

function obstaculo:check_point(punto)
  if not self.point then
    if pajaro.position.x > self.p1.position.x + self.p1.size.x then
      punto = punto + 1
      self.point = true
    end
  end
end

function obstaculo:coliding()
  --CUBO SUPERIOR
  if pajaro.position.x > self.p1.position.x
  and pajaro.position.x < self.p1.position.x + self.p1.size.x then
    if pajaro.position.y > self.p1.position.y
    and pajaro.position.y < self.p1.position.y + self.p1.size.y
    or pajaro.position.y + pajaro.size.y < self.p1.position.y + self.p1.size.y
    and pajaro.position.y + pajaro.size.y > self.p1.position.y then
      return true
    end
  elseif pajaro.position.x + pajaro.size.x > self.p1.position.x
  and pajaro.position.x + pajaro.size.x < self.p1.position.x + self.p1.size.x then
    if pajaro.position.y > self.p1.position.y
    and pajaro.position.y < self.p1.position.y + self.p1.size.y
    or pajaro.position.y + pajaro.size.y < self.p1.position.y + self.p1.size.y
    and pajaro.position.y + pajaro.size.y > self.p1.position.y then
      return true
    end
  end
  --CUBO INFERIOR
  if pajaro.position.x > self.p2.position.x
  and pajaro.position.x < self.p2.position.x + self.p2.size.x then
    if pajaro.position.y > self.p2.position.y
    and pajaro.position.y < self.p2.position.y + self.p2.size.y
    or pajaro.position.y + pajaro.size.y < self.p2.position.y + self.p2.size.y
    and pajaro.position.y + pajaro.size.y > self.p2.position.y then
      return true
    end
  elseif pajaro.position.x + pajaro.size.x > self.p2.position.x
  and pajaro.position.x + pajaro.size.x < self.p2.position.x + self.p2.size.x then
    if pajaro.position.y > self.p2.position.y
    and pajaro.position.y < self.p2.position.y + self.p2.size.y
    or pajaro.position.y + pajaro.size.y < self.p2.position.y + self.p2.size.y
    and pajaro.position.y + pajaro.size.y > self.p2.position.y then
      return true
    end
  end
  return false
end

return obstaculo
