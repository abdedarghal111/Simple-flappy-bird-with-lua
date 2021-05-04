function love.load()
  local file = require"smod/coroutine"
  function pepe(e)print(e) end
  local e = file:new("test.lua"):update()
end
function love.draw()

end
