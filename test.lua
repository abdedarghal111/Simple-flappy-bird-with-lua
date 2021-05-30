cube = require"mod/ins/cube"
local x,y = love.graphics.getDimensions()
uno = cube:new()
dos = cube:new(); dos:setcolor(100,100,100)

add(function()
        coroutine.yield(20)
        local e = "a" + 5
      end)

--[[
uno.position = vector2.new(x-uno.size.x,y/2-(uno.size.y/2))
dos.position = vector2.new(0,y/2-(dos.size.y/2))

local colisions = {uno,dos}

add(function()
  while wait() do
    uno.position = vector2.new(uno.position.x - 100*dt,uno.position.y)
    dos.position = vector2.new(dos.position.x + 100*dt,dos.position.y)
  end
end)

print(table.unpack({
x0y0 = "pepe",--instance.position.x,
x1y0 = "pepa",--instance.position.x,
x0y1 = "jose",
x1y1 = "hola"
}))

local function getcolisionpoints()
  return unpack({
  x0y0 = "pepe",--instance.position.x,
  x1y0 = "pepa",--instance.position.x,
  x0y1 = "jose",
  x1y1 = "hola"
})
end
print(getcolisionpoints())


--[[
add(function()
  while wait() do
    for i,v in colisions() do
      for e,u in colisions() do

      end
    end
  end
end)
]]
