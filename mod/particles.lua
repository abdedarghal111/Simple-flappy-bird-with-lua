local colors = require"mod/colors"
local parts = {}
local settings = {
  canwork = true
}
local x,y = love.graphics:getDimensions()
math.randomseed(os.time())

for i = 1,15 do
  local size = math.random(y/20,y/4)
  local x = math.random(0,x*1000)/1000 + x
  local y = math.random(0,y)
  parts[i] = {cube:new(size,size,x,y,unpack(colors.black_1)),math.random(1,100*100)/100}
  parts[i][1].transparency = 0.5
end

add(function()
  while settings.canwork and wait() do
    for i,v in pairs(parts) do
      local y = v[2]
      local v = v[1]
      v.position = vector2.new(v.position.x - y*dt,v.position.y)
      if v.position.x <= 0 - v.size.x then
        v.position.x = x
      end
    end
  end
end)

return settings
